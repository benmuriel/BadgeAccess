from django.contrib.auth import get_user_model
from .models import UserSite
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from .models import Department, Site, VisitedPerson, Visitor
from django.contrib import admin

from home.models.badge import Badge
from home.models.badge_category import BadgeCategory


class ReadOnlyAdminMixin:
    """Consultation seule : ni ajout, ni modification, ni suppression."""

    def has_add_permission(self, request, obj=None):
        return False

    def has_change_permission(self, request, obj=None):
        return False

    def has_delete_permission(self, request, obj=None):
        return False


@admin.register(Badge)
class BadgeAdmin(ReadOnlyAdminMixin, admin.ModelAdmin):
    list_display = ('BadgeNumber', 'BadgeCategory', 'IssueDate', 'ExpiryDate',
                    'CurrentVisitor')
    list_filter = ('BadgeCategory',)
    list_select_related = ('BadgeCategory', 'CurrentVisitor')
    search_fields = ('BadgeNumber',)


class VisitedPersonInline(ReadOnlyAdminMixin, admin.TabularInline):
    model = VisitedPerson
    extra = 0
    fields = ("Department", "PersonFullName", "PersonRole")


@admin.register(Site)
class SiteAdmin(ReadOnlyAdminMixin, admin.ModelAdmin):
    list_display = ("Name",)
    search_fields = ("Name",)


@admin.register(Department)
class DepartmentAdmin(ReadOnlyAdminMixin, admin.ModelAdmin):
    list_display = ("Name", "Site")
    list_filter = ("Site",)
    search_fields = ("Name", "Site__Name")
    list_select_related = ("Site",)


@admin.register(Visitor)
class VisitorAdmin(ReadOnlyAdminMixin, admin.ModelAdmin):
    list_display = (
        "Person",
        "Badge",
        "visited_persons_list",
        "departments_list",
        "sites_list",
        "Purpose",
        "StartDate",
        "EndDate",
    )
    list_filter = ("visited_persons__Department__Site",
                   "visited_persons__Department")
    search_fields = (
        "Person__FirstName",
        "Person__LastName",
        "visited_persons__PersonFullName",
        "visited_persons__Department__Name",
        "visited_persons__Department__Site__Name",
    )
    inlines = [VisitedPersonInline]

    def get_queryset(self, request):
        return (
            super()
            .get_queryset(request)
            .select_related("Person", "Badge")
            .prefetch_related("visited_persons__Department__Site")
        )

    @staticmethod
    def _unique(values):
        """Valeurs distinctes, dans l'ordre, sans les valeurs vides."""
        return list(dict.fromkeys(str(v) for v in values if v))

    @admin.display(description="Personnes visitées")
    def visited_persons_list(self, obj):
        # .all() utilise le prefetch : aucune requête en plus par ligne
        labels = [
            f"{vp.PersonFullName} ({vp.PersonRole})" if vp.PersonFullName and vp.PersonRole
            else (vp.PersonFullName or vp.PersonRole)
            for vp in obj.visited_persons.all()
            if vp.PersonFullName or vp.PersonRole
        ]
        return ", ".join(labels) or "—"

    @admin.display(description="Départements")
    def departments_list(self, obj):
        names = self._unique(vp.Department for vp in obj.visited_persons.all())
        return ", ".join(names) or "—"

    @admin.display(description="Sites")
    def sites_list(self, obj):
        names = self._unique(
            vp.Department.Site for vp in obj.visited_persons.all())
        return ", ".join(names) or "—"


@admin.register(BadgeCategory)
class BadgeCategoryAdmin(ReadOnlyAdminMixin, admin.ModelAdmin):
    pass


User = get_user_model()


class UserSiteInline(admin.StackedInline):
    model = UserSite
    max_num = 1
    verbose_name = "Site de l'utilisateur"
    verbose_name_plural = "Site de l'utilisateur"


admin.site.unregister(User)


@admin.register(User)
class UserAdmin(BaseUserAdmin):
    inlines = [UserSiteInline]
    list_display = BaseUserAdmin.list_display + ("site",)
    list_filter = BaseUserAdmin.list_filter + ("usersite__Site",)
    list_select_related = ("usersite__Site",)

    @admin.display(description="Site", ordering="usersite__Site__Name")
    def site(self, obj):
        link = getattr(obj, "usersite", None)
        return link.Site if link else "—"
