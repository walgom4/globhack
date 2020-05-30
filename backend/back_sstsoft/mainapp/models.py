from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.translation import ugettext_lazy as _

# Create your models here.
#identification type
class idType(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)

    def __str__(self):
        return "{}".format(self.id)
class gender(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)

    def __str__(self):
        return "{}".format(self.id)
class area(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)

    def __str__(self):
        return "{}".format(self.id)

class eps(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)

    def __str__(self):
        return "{}".format(self.id)

class transport(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)

    def __str__(self):
        return "{}".format(self.id)

#user model
class User(AbstractUser):
    identification = models.CharField(
        blank=True, null=True, max_length=50, unique=True)
    username = models.CharField(
        blank=True, null=True, max_length=50, unique=True)
    idType_fk_user = models.ForeignKey(
        idType, on_delete=models.CASCADE, null=True)
    email = models.EmailField(_('email address'), unique=True)
    name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    phone = models.CharField(max_length=50)
    address = models.CharField(max_length=150, blank=True, null=True)
    birthday = models.DateField(blank=True, null=True)
    gender_fk_user = models.ForeignKey(
        gender, on_delete=models.CASCADE, null=True)
    eps_fk_user = models.ForeignKey(
        eps, on_delete=models.CASCADE, null=True)
    job = models.CharField(max_length=100, blank=True, null=True)
    boss = models.CharField(max_length=100, blank=True, null=True)
    area_fk_user = models.ForeignKey(area, on_delete=models.CASCADE, null=True)
    photo = models.ImageField(upload_to='users/', null=True, blank=True)
    transport_fk_user = models.ForeignKey(
        transport, on_delete=models.CASCADE, null=True)
    #risk permanent contacts
    risk = models.BooleanField(default=False)
    who_risk = models.CharField(max_length=150, blank=True, null=True)
    health_system = models.BooleanField(default=False)
    who_health = models.CharField(max_length=150, blank=True, null=True)
    #emergency contact
    emergency_contact_name = models.CharField(max_length=150, blank=True, null=True)
    emergency_contact_relationship = models.CharField(max_length=150, blank=True, null=True)
    emergency_contact_phone = models.CharField(max_length=150, blank=True, null=True)
    #addres
    validated = models.BooleanField(default=False)

    USERNAME_FIELD = 'identification'
    REQUIRED_FIELDS = ['username']

    def __str__(self):
        return "{}".format(self.identification)

#health register
class healthRegister(models.Model):
    id = models.AutoField(primary_key=True)
    flu = models.BooleanField(default=False)#gripe
    fever = models.BooleanField(default=False)#fiebre
    cough = models.BooleanField(default=False)#tos
    sore_throat = models.BooleanField(default=False)#dolor de garganta
    nasal_congestion = models.BooleanField(default=False)#congestion
    fatigue = models.BooleanField(default=False)#fatiga
    difficult_breathe = models.BooleanField(default=False)#dificultar para respirar
    muscle_pain = models.BooleanField(default=False)#dolor muscular
    diarrhea = models.BooleanField(default=False)#diarrea
    threw_up = models.BooleanField(default=False)#vomito
    other = models.CharField(max_length=1000, blank=True, null=True)
    user_fk_health = models.ForeignKey(User, on_delete=models.CASCADE)
    temperature = models.DecimalField(max_digits=40, decimal_places=2, default= 0)
    photo_temperature = models.ImageField(upload_to='health_register/', null=True, blank=True)
    photo_workspace = models.ImageField(upload_to='health_register/', null=True, blank=True)
    photo_selfie = models.ImageField(upload_to='health_register/', null=True, blank=True)
    observations = models.CharField(max_length=2000, blank=True, null=True)
    #register 
    health_condition = models.BooleanField(default=False)
    medical_file = models.FileField(upload_to='health_register/', null=True, blank=True)
    #risk contact
    ill = models.BooleanField(default=False)
    who_ill = models.CharField(max_length=150, blank=True, null=True)

    def __str__(self):
        return "{}".format(self.id)