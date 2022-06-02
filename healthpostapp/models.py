from django.db import models


class User(models.Model):
    name = models.TextField()
    email = models.TextField()
    password = models.TextField()
    address = models.TextField()
    phone = models.TextField()


class Ambulance(models.Model):
    hospital = models.TextField()
    lat = models.FloatField()
    lng = models.FloatField()
    phone = models.TextField()
    available = models.BooleanField()


class Blood(models.Model):
    name = models.TextField()
    available = models.IntegerField()
    phone = models.TextField()


class Doctor(models.Model):
    name = models.TextField()
    specialist = models.TextField()
    img = models.TextField()
    phone = models.TextField()
    available = models.BooleanField()


class Appointment (models.Model):
    startTime = models.DateTimeField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)


class Medicine(models.Model):
    name = models.TextField()
    composition = models.TextField()
    available = models.BooleanField()
    prescription = models.BooleanField()
    cost = models.IntegerField()
    cf = models.IntegerField()
    img = models.TextField()


class Offday(models.Model):
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    datetime = models.DateTimeField()


class SideEffect(models.Model):
    medicine = models.ForeignKey(Medicine, on_delete=models.CASCADE)
    point = models.TextField()
