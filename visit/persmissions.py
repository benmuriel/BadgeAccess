from home.models import Department, UserSite


def allowed_departments(user):
    """Départements que l'utilisateur peut choisir pour une personne visitée."""
    if user.is_superuser:
        return Department.objects.all()

    link = UserSite.objects.filter(User=user).first()
    if link is None:
        return Department.objects.none()  # aucun site associé

    return Department.objects.filter(Site_id=link.Site_id)
