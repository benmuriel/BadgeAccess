from django.shortcuts import render

from .models import Department


def home_page(request):
    return render(request, 'home.html')


def visitor_list(view_request):
    # Retrieve all visitor objects from the database
    visitors = Department.objects.all()

    context = {
        'visitors': visitors
    }
    return render(view_request, 'department.html', context)
