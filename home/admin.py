from django.contrib import admin

from home.models.badge import Badge
from home.models.badge_category import BadgeCategory
from home.models.department import Department
from home.models.visitor import Visitor


class BadgeAdmin(admin.ModelAdmin):
    list_display = ('BadgeNumber', 'BadgeCategory', 'IssueDate', 'ExpiryDate',
                    'CurrentVisitor')
    # list_filter = ('BadgeCategory')


class VisitorAdmin(admin.ModelAdmin):
    list_display = ('Badge', 'Person', 'Purpose', 'CreatedAtDate', 'StartDate',
                    'EndDate')


# Register your models here.
admin.site.register(Department)
admin.site.register(Badge, BadgeAdmin)
admin.site.register(BadgeCategory)
admin.site.register(Visitor, VisitorAdmin)
