from django.urls import path

from . import views


urlpatterns = [
    path("", views.event_home, name="event_home"),
    path("registration/", views.event_registration, name="event_registration"),
    path("<int:event_id>/registration/",
         views.event_registration, name="event_registration"),
    path("<int:event_id>/participants/",
         views.event_participants, name="event_participants"),
    path("partner/<int:partner_id>/participants/new/",
         views.participant_registration, name="participant_registration"),
    path("participant/<int:person_id>/edit/",
         views.participant_edit, name="participant_edit"),
]
