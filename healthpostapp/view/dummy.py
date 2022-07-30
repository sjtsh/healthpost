
from django.shortcuts import render
from django.http import JsonResponse
from matplotlib.style import available
from rest_framework.decorators import api_view
from rest_framework.response import Response

from datetime import timedelta, datetime
from healthpostapp.models import *


@api_view(['GET'])
def insertDummy(request):
    User.objects.create(email="test@gmail.com", password="user", name="Dev Yadav",
                        address="bhaktapur", phone="9812345678")
    User.objects.create(email="admin@gmail.com", password="admin", name="Dev Yadav",
                        address="kathmandu", phone="9801234567", admin=True)
    user = User.objects.get(id=1)
    Ambulance.objects.create(hospital="Friendship Community Hospital",
                             lat=27.727510239064642, lng=85.34540357152348, phone="01-440201", available=True)
    Ambulance.objects.create(hospital="Grande City Hospital", lat=27.711904431550384,
                             lng=85.31517864501389, phone="01-4163500", available=True)
    Ambulance.objects.create(hospital="Green City Hospital", lat=27.74229294221694,
                             lng=85.32313440708717, phone="01-4952248", available=True)
    Ambulance.objects.create(hospital="B.P Smriti Hospital", lat=27.742141013167497,
                             lng=85.32605265020857, phone="01-4387096", available=False)
    Ambulance.objects.create(hospital="Swacon International Hospital", lat=27.707799614365108,
                             lng=85.33566568637315, phone="01-4462960", available=True)
    Ambulance.objects.create(hospital="Bir Hospital", lat=27.708037078164043,
                             lng=85.31326889342213, phone="01-4221119", available=True)
    Blood.objects.create(name="A+", available=4, phone="01-440201")
    Blood.objects.create(name="A-", available=3, phone="01-440201")
    Blood.objects.create(name="B+", available=5, phone="01-440201")
    Blood.objects.create(name="B-", available=13, phone="01-440201")
    Blood.objects.create(name="O+", available=12, phone="01-440201")
    Blood.objects.create(name="O-", available=0, phone="01-440201")
    Blood.objects.create(name="AB+", available=1, phone="01-440201")
    Blood.objects.create(name="AB-", available=0, phone="01-440201")
    Doctor.objects.create(name="Dr. Ram K Ghimire", specialist="Pediatrics and Neonatology",
                          img="https://www.nepalmediciti.com/UploadedImages/Dr.-Ram-K-Ghimire-2.jpg", phone="01-4221119", available=True)
    Doctor.objects.create(name="Dr. Ranjit Kumar Sharma", specialist="Gynecology and Obstetrics",
                          img="https://www.nepalmediciti.com/UploadedImages/dr-ranjit-kumar-sharma.jpeg", phone="01-4221119", available=False)
    Doctor.objects.create(name="Dr. Bijog G. Rajbanshi", specialist="Orthopedics and Joint Reconstruction",
                          img="https://www.nepalmediciti.com/UploadedImages/Dr.%20Bijoy%20G%20Rajbanshi.jpg", phone="01-4221119", available=True)
    Doctor.objects.create(name="Dr. Gopi Aryal", specialist="Orthopedics and Joint Reconstruction",
                          img="https://www.nepalmediciti.com/UploadedImages/Dr-gopi-aryal.jpeg", phone="01-4221119", available=True)
    Doctor.objects.create(name="Dr. Gopal Raman Sharma", specialist="Digestive Diseases",
                          img="https://www.nepalmediciti.com/UploadedImages/3.jpg", phone="01-4221119", available=False)
    Doctor.objects.create(name="Dr. Babu Ram Pokharel", specialist="GI & General Surgery",
                          img="https://www.nepalmediciti.com/UploadedImages/Dr.-Babu-Ram-Pokharel2.jpg", phone="01-4221119", available=True)
    Doctor.objects.create(name="Dr. Sunil K Sharma", specialist="Neurosciences",
                          img="https://www.nepalmediciti.com/UploadedImages/Dr.%20sunil2.jpg", phone="01-4221119", available=True)
    Doctor.objects.create(name="Dr. Umid Kumar Shrestha", specialist="Neurosciences",
                          img="https://www.nepalmediciti.com/UploadedImages/Dr.-Umid-K-Shrestha2.jpg", phone="01-4221119", available=True)
    Doctor.objects.create(name="Dr. Shishir Lakhey", specialist="Diagnostic Medicine",
                          img="https://www.nepalmediciti.com/UploadedImages/Dr-Shishir.jpg", phone="01-4221119", available=True)
    Doctor.objects.create(name="Dr. Raj Rana", specialist="Cardiac Sciences", phone="01-4221119",
                          img="https://www.nepalmediciti.com/UploadedImages/Dr.%20Raj%20Rana.jpg", available=True)
    Doctor.objects.create(name="Dr. Nira Singh Shrestha", specialist="Cardiac Sciences",
                          img="https://www.nepalmediciti.com/UploadedImages/Dr.-Nira-Singh-Shrestha2.jpg", phone="01-4221119", available=True)
    Doctor.objects.create(name="Dr. Anna Sharma", specialist="Diagnostic Medicine",
                          img="https://www.nepalmediciti.com/UploadedImages/Dr.%20Anna%20Sharma.JPG", phone="01-4221119", available=True)
    userNew = User.objects.create(
        email="user1@gmail.com", password="user", address="kathmandu", phone="9812345678", name="Yadav Dev", )
    userNew = User.objects.get(email="user1@gmail.com")
    for i in Doctor.objects.all():
        for single_date in daterange(datetime(2022, 6, 2), datetime(2022, 6, 10)):
            timeList = [10, 11, 2, 3, 5]
            for j in timeList:
                Appointment.objects.create(
                    startTime=single_date + timedelta(hours=j), user=userNew, doctor=i)

    for i in Doctor.objects.all():
        for single_date in daterange(datetime(2022, 5, 2), datetime(2022, 10, 10)):
            if single_date.weekday() == 1 or single_date.weekday() == 6:
                Offday.objects.create(datetime=single_date, doctor=i)
    for i in Doctor.objects.all():
        Offday.objects.create(datetime=datetime(2022, 6, 12), doctor=i)
        Offday.objects.create(datetime=datetime(2022, 6, 22), doctor=i)
        Offday.objects.create(datetime=datetime(2022, 6, 13), doctor=i)

    imgList = ["https://www.verywellmind.com/thmb/rtEc7AZMvGYNrt8l0kwdkaZp6Q8=/2572x1929/filters:fill(ABEAC3,1)/diazepam-56a270a45f9b58b7d0ca6476-59bc8d0b0d327a0011f67f5f.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwpyOUbBP1EclkwZ092ygSo0wOGY86SvHe8g&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjIKQfLjjVaYfGxAXmHVCvx86oX-FWuskmqA&usqp=CAU",
               "https://img.medscapestatic.com/pi/features/drugdirectory/octupdate/GSO37190.jpg?output-quality=50", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeCs_U6RJmOJq89jy0B8s0EcxmT_dD9S-pMA&usqp=CAU", "https://www.brunet.ca/FicheMedicaments/images/source/00723770/", "https://vcahospitals.com/-/media/2/vca/images/lifelearn-images-foldered/680/medication.ashx"]

    Medicine.objects.create(name="Bayer", composition="Aspirin",
                            available=True, prescription=False, cost=30, cf=10, img=imgList[0])
    Medicine.objects.create(name="Abilify", composition="clindamycin phosphate",
                            available=True, prescription=False, cost=50, cf=10, img=imgList[1])
    Medicine.objects.create(name="Xanax", composition="Pimecrolimus",
                            available=True, prescription=False, cost=30, cf=10, img=imgList[2])
    Medicine.objects.create(name="Elidel", composition="clindamycin phosphate",
                            available=True, prescription=False, cost=1300, cf=4, img=imgList[3])
    Medicine.objects.create(name="Skyla", composition="Pimecrolimus",
                            available=True, prescription=True, cost=70, cf=10, img=imgList[4])
    Medicine.objects.create(name="Easprin", composition="Aspirin",
                            available=True, prescription=False, cost=110, cf=8, img=imgList[5])
    Medicine.objects.create(name="Ecotrin", composition="Aspirin",
                            available=True, prescription=False, cost=30, cf=10, img=imgList[6])
    Medicine.objects.create(name="Evoclin", composition="vorinostat",
                            available=True, prescription=False, cost=50, cf=10, img=imgList[0])
    Medicine.objects.create(name="TwoCal", composition="vorinostat",
                            available=True, prescription=False, cost=20, cf=1, img=imgList[1])
    Medicine.objects.create(name="Aspirtab", composition="Aspirin",
                            available=True, prescription=False, cost=30, cf=10, img=imgList[2])
    Medicine.objects.create(name="Brigham", composition="Pimecrolimus",
                            available=True, prescription=True, cost=20, cf=10, img=imgList[3])
    Medicine.objects.create(name="Rubraca", composition="aripiprazole",
                            available=True, prescription=False, cost=220, cf=1, img=imgList[4])
    Medicine.objects.create(name="Xalatan", composition="aripiprazole",
                            available=True, prescription=False, cost=20, cf=6, img=imgList[5])
    Medicine.objects.create(name="Zolinza", composition="Aspirin",
                            available=True, prescription=False, cost=130, cf=4, img=imgList[6])
    Medicine.objects.create(name="Cablivi", composition="vorinostat",
                            available=True, prescription=True, cost=160, cf=6, img=imgList[0])
    Medicine.objects.create(name="Proglycem oral", composition="clindamycin phosphate",
                            available=True, prescription=False, cost=1300, cf=8, img=imgList[1])
    Medicine.objects.create(name="Ascriptin", composition="Aspirin",
                            available=True, prescription=False, cost=30, cf=10, img=imgList[2])

    bayerSideEffects = ["rash", "gastrointestinal ulcerations", "abdominal pain", "upset stomach",
                        "heartburn", "drowsiness", "headache", "cramping", "nausea", "gastritis", "bleeding"]
    for i in bayerSideEffects:
        SideEffect.objects.create(
            medicine=Medicine.objects.get(name="Bayer"), point=i)
        SideEffect.objects.create(
            medicine=Medicine.objects.get(name="Zolinza"), point=i)
        SideEffect.objects.create(
            medicine=Medicine.objects.get(name="Cablivi"), point=i)
        SideEffect.objects.create(
            medicine=Medicine.objects.get(name="Proglycem oral"), point=i)
        SideEffect.objects.create(
            medicine=Medicine.objects.get(name="Rubraca"), point=i)

    xanaxSideEffects = ["drowsiness", "lightheadedness", "low energy",
                        "depression", "headache", "confusion", "insomnia", "nervousness", ]
    for i in xanaxSideEffects:
        SideEffect.objects.create(
            medicine=Medicine.objects.get(name="Xanax"), point=i)
        SideEffect.objects.create(
            medicine=Medicine.objects.get(name="Ascriptin"), point=i)
        SideEffect.objects.create(
            medicine=Medicine.objects.get(name="Skyla"), point=i)
        SideEffect.objects.create(
            medicine=Medicine.objects.get(name="TwoCal"), point=i)
        SideEffect.objects.create(
            medicine=Medicine.objects.get(name="Aspirtab"), point=i)

    abilifySideEffects = ["Dizziness", "lightheadedness", "drowsiness", "nausea", "vomiting", "tiredness",
                          "excess saliva/drooling", "blurred vision", "weight gain", "constipation", "headache", "trouble sleeping"]
    for i in abilifySideEffects:
        SideEffect.objects.create(
            medicine=Medicine.objects.get(name="Abilify"), point=i)
        SideEffect.objects.create(
            medicine=Medicine.objects.get(name="Xalatan"), point=i)
        SideEffect.objects.create(
            medicine=Medicine.objects.get(name="Easprin"), point=i)
        SideEffect.objects.create(
            medicine=Medicine.objects.get(name="Ecotrin"), point=i)
        SideEffect.objects.create(
            medicine=Medicine.objects.get(name="Evoclin"), point=i)
        SideEffect.objects.create(
            medicine=Medicine.objects.get(name="Elidel"), point=i)
        SideEffect.objects.create(
            medicine=Medicine.objects.get(name="Brigham"), point=i)
    return Response("success")


def daterange(start_date, end_date):
    for n in range(int((end_date - start_date).days)):
        yield start_date + timedelta(n)
