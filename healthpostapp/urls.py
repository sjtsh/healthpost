from django.urls import path

from healthpostapp.view.Ambulance import *
from healthpostapp.view.Appointment import *
from healthpostapp.view.auth import *
from healthpostapp.view.Blood import *
from healthpostapp.view.Doctor import *
from healthpostapp.view.Medicine import *
from healthpostapp.view.dummy import *
from healthpostapp.view.Bed import *

from .views import *
from rest_framework.routers import DefaultRouter

urlpatterns = [
    path('', getRoutes),
    path('signin/', signIn),
    path('signup/', signUp),
    path('ambulance/', getAmbulance),
    path('appointment/<int:pk>/', getAppointment),
    path('appointment/', getAppointments),
    path('create/<int:pk>/', postAppointment),
    path('blood/', getBlood),
    path('doctor/', getDoctor),
    path('medicine/', getMedicine),
    path('dummy/', insertDummy),
    path('bed/', getBeds),
]
