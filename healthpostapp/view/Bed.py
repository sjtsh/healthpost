from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response

from healthpostapp.models import *


@api_view(['GET'])
def getBeds(request):
    beds = Bed.objects.all()
    returnable = []
    for i in beds:
        aDict = {"id": i.id, "name": i.name,  "img": i.img,
                 "phone": i.phone, "hospital": i.hospital, "available": i.available, "category": i.category}
        returnable.append(aDict)
        print(returnable)
    return Response(returnable)
