
from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response

from healthpostapp.models import *

@api_view(['GET'])
def getMedicine(request):
    medicines = Medicine.objects.all()
    returnable = []
    for i in medicines:
        sideeffectObjects = SideEffect.objects.all().filter(medicine=i)
        sideeffects = []
        for j in sideeffectObjects:
            sideeffects.append(j.point)
        aDict = {"id": i.id, "name": i.name,  "available": i.available, "prescription": i.prescription,
                 "cost": i.cost,  "composition": i.composition, "cf": i.cf, "sideeffects": sideeffects, "img": i.img}
        returnable.append(aDict)
    return Response(returnable)
