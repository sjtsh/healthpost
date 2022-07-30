
from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response

from healthpostapp.models import *


@api_view(['GET'])
def getAppointment(request, pk):
    appointments = Appointment.objects.all().filter(user=User.objects.get(id=pk))
    returnable = []
    for i in appointments:
        aDict = {"id": i.id, "doctor": i.doctor.name,  "specialist": i.doctor.specialist,
                 "img": i.doctor.img, "startTime": i.startTime, "note": i.note}
        returnable.append(aDict)
    return Response(returnable)


@api_view(['POST'])
def postAppointment(request, pk):
    Appointment.objects.create(startTime=request.data["startTime"], user=User.objects.get(
        id=pk), doctor=Doctor.objects.get(id=request.data["doctor"]), note=request.data["note"])
    return Response(True)


@api_view(['GET'])
def getAppointments(request):
    appointments = Appointment.objects.all()
    returnable = []
    for i in appointments:
        aDict = {"id": i.id, "startTime": i.startTime, "userUserName": i.user.name, "userName": i.user.name,  "userEmail": i.user.email, "userAddress": i.user.address, "userPhone": i.user.phone,
                 "doctorImg": i.doctor.img, "doctorName": i.doctor.name, "doctorSpecialist": i.doctor.specialist, "doctorPhone": i.doctor.phone, "doctorAvailable": i.doctor.available, "note": i.note}
        returnable.append(aDict)
    return Response(returnable)
