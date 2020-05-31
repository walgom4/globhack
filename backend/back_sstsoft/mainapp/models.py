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
    id = models.CharField(max_length=50, unique=True, primary_key=True)
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
    accept_terms = models.BooleanField(default=False)
    is_sst = models.BooleanField(default=False)
    validated = models.BooleanField(default=False)

    USERNAME_FIELD = 'id'
    REQUIRED_FIELDS = ['username']

    def __str__(self):
        return "{}".format(self.id)

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
    home = models.BooleanField(default=False)
    bad = models.BooleanField(default=False)
    date = models.DateTimeField(auto_now_add=True, blank=True, null=True)


    def __str__(self):
        return "{}".format(self.id)


class resources(models.Model):
    id = models.AutoField(primary_key=True)
    code = models.CharField(max_length=100)
    image = models.ImageField(upload_to='resources/', null=True, blank=True)
    resource_url = models.CharField(max_length=150, blank=True, null=True)
    text = models.CharField(max_length=1000, blank=True, null=True)

    def __str__(self):
        return "{}".format(self.id)

class entityType(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=150)

    def __str__(self):
        return "{}".format(self.id)

class entity(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=150)
    image = models.ImageField(upload_to='resources/', null=True, blank=True)
    webpage = models.CharField(max_length=150, blank=True, null=True)
    address = models.CharField(max_length=150, blank=True, null=True)
    phone = models.CharField(max_length=50, blank=True, null=True)
    entityType_fk_entity=models.ForeignKey(entityType, on_delete=models.CASCADE)

    def __str__(self):
        return "{}".format(self.id)

class question(models.Model):
    id = models.AutoField(primary_key=True)
    question = models.CharField(max_length=1000)
    op1 = models.CharField(max_length=1000)
    op2 = models.CharField(max_length=1000)
    op3 = models.CharField(max_length=1000)
    answer = models.CharField(max_length=5)

    def __str__(self):
        return "{}".format(self.id)

class answers(models.Model):
    id = models.AutoField(primary_key=True)
    answer_fk_user = models.ForeignKey(
        User, on_delete=models.CASCADE, null=True)
    answer_fk_question = models.ForeignKey(
        question, on_delete=models.CASCADE, null=True)
    user_answer = models.CharField(max_length=5) 
    date = models.DateTimeField(auto_now_add=True, blank=True, null=True)

    def __str__(self):
        return "{}".format(self.id)

class schedule(models.Model):
    id = models.AutoField(primary_key=True)
    date_start = models.DateTimeField( blank=True, null=True)
    date_end = models.DateTimeField( blank=True, null=True)
    schedule_fk_healthRegister = models.ForeignKey(
        healthRegister, on_delete=models.CASCADE, null=True)

    def __str__(self):
        return "{}".format(self.id)
