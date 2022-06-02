
from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response

from healthpostapp.models import *

@api_view(['GET'])
def getAmbulance(request):
    ambulances = Ambulance.objects.all()
    returnable = []
    for i in ambulances:
        aDict = {"id": i.id, "hospital": i.hospital,  "lat": i.lat,
                 "lng": i.lng, "phone": i.phone, "available": i.available}
        returnable.append(aDict)
    return Response(returnable)
