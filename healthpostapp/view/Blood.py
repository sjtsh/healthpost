
from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response

from healthpostapp.models import *


@api_view(['GET'])
def getBlood(request):
    bloods = Blood.objects.all()
    returnable = []
    for i in bloods:
        aDict = {"id": i.id, "name": i.name,  "available": i.available,
                 "phone": i.phone}
        returnable.append(aDict)
    return Response(returnable)
