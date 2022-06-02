
from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response
from datetime import datetime, timedelta
from healthpostapp.models import *
import pytz


@api_view(['GET'])
def getDoctor(request):

    utc=pytz.UTC
    doctors = Doctor.objects.all()
    returnable = []
    for i in doctors:
        offdaysObjects = Offday.objects.all().filter(doctor=i)
        offdays = []
        for j in offdaysObjects:
            offdays.append(j.datetime)

        appointmentObjects = Appointment.objects.all().filter(doctor=i)
        

        appointments = []
        for j in appointmentObjects:
            print(j.startTime)
            appointments.append(j.startTime)

        aDict = {"id": i.id, "name": i.name,  "available": i.available, "phone": i.phone, "specialist": i.specialist,
                 "img": i.img, "phone": i.phone, "offdays": offdays, "appointments": appointments}
        returnable.append(aDict)
    return Response(returnable)
