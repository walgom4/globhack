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
    birthday = models.DateField(blank=True, null=True)
    gender_fk_user = models.ForeignKey(
        gender, on_delete=models.CASCADE, null=True)
    eps_fk_user = models.ForeignKey(
        eps, on_delete=models.CASCADE, null=True)
    job = models.CharField(max_length=100, blank=True, null=True)
    boss = models.CharField(max_length=100, blank=True, null=True)
    area_fk_user = models.ForeignKey(
        area, on_delete=models.CASCADE, null=True)
    validated = models.BooleanField(default=False)

    USERNAME_FIELD = 'identification'
    REQUIRED_FIELDS = ['username']

    def __str__(self):
        return "{}".format(self.identification)