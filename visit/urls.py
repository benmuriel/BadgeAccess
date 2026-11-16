from django.urls import path
from . import views

urlpatterns = [
    path('', views.home_page, name='visit_home'),
    path('findperson/', views.find_person, name='visit_find_person'),
    path('saveperson/', views.save_person, name='visit_save_person'),
    path("registration/<int:person_id>/",
         views.visit_registration, name="visit_registration"),
    path("detail/<int:visit_id>/", views.visit_detail, name="visit_detail"),
    path("end/<int:visit_id>/", views.visit_end, name="visit_end"),
]
