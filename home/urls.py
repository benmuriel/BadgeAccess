from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path("badge/check/", views.badge_check, name="badge_check"),
    path("badge/check/<str:badge_number>/",
         views.badge_check, name="badge_check_number"),
]
