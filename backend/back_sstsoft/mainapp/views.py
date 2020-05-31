from django.shortcuts import render
from mainapp.serializers import UserSerializer, areaSerializer, epsSerializer, genderSerializer, idTypeSerializer, healthRegisterSerializer, transportSerializer, resourcesSerializer, entitySerializer, entityTypeSerializer
from mainapp.models import User, area, eps, gender, idType, healthRegister, transport, resources, entity, entityType

# start restframework
from rest_framework import viewsets, generics
from rest_framework.permissions import AllowAny, IsAuthenticated, IsAdminUser
from rest_framework.decorators import api_view, schema
from rest_framework.response import Response
from rest_framework.filters import OrderingFilter
# end restframework

# Create your views here.
class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [AllowAny]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update' or self.action == 'destroy':
            permission_classes = [IsAuthenticated]
        elif self.action == 'list':
            permission_classes = [IsAuthenticated]

        return [permission() for permission in permission_classes]

    def get_queryset(self):
        # if self.action == 'list':
        #     return self.queryset.filter(id=self.request.user.id)
        return self.queryset

class areaViewSet(viewsets.ModelViewSet):
    queryset = area.objects.all()
    serializer_class = areaSerializer

    # permisos
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [IsAuthenticated]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update' or self.action == 'destroy':
            permission_classes = [IsAuthenticated]
        elif self.action == 'list':
            permission_classes = [AllowAny]
        return [permission() for permission in permission_classes]

class epsViewSet(viewsets.ModelViewSet):
    queryset = eps.objects.all()
    serializer_class = epsSerializer

    # permisos
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [IsAuthenticated]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [IsAuthenticated]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [AllowAny]
        return [permission() for permission in permission_classes]

class genderViewSet(viewsets.ModelViewSet):
    queryset = gender.objects.all()
    serializer_class = genderSerializer

    # permisos
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [IsAuthenticated]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [IsAuthenticated]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [AllowAny]
        return [permission() for permission in permission_classes]

class transportViewSet(viewsets.ModelViewSet):
    queryset = transport.objects.all()
    serializer_class = transportSerializer

    # permisos
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [IsAuthenticated]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [IsAuthenticated]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [AllowAny]
        return [permission() for permission in permission_classes]

class idTypeViewSet(viewsets.ModelViewSet):
    queryset = idType.objects.all()
    serializer_class = idTypeSerializer

    # permisos
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [IsAuthenticated]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [IsAuthenticated]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [AllowAny]
        return [permission() for permission in permission_classes]

class healthRegisterViewSet(viewsets.ModelViewSet):
    queryset = healthRegister.objects.all()
    serializer_class = healthRegisterSerializer

    # permisos
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [AllowAny]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [IsAuthenticated]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [AllowAny]
        return [permission() for permission in permission_classes]

class resourcesViewSet(viewsets.ModelViewSet):
    queryset = resources.objects.all()
    serializer_class = resourcesSerializer

    # permisos
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [IsAuthenticated]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [IsAuthenticated]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [IsAuthenticated]
        return [permission() for permission in permission_classes]

class entityViewSet(viewsets.ModelViewSet):
    queryset = entity.objects.all()
    serializer_class = entitySerializer

    # permisos
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [IsAuthenticated]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [IsAuthenticated]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [IsAuthenticated]
        return [permission() for permission in permission_classes]

class entityTypeViewSet(viewsets.ModelViewSet):
    queryset = entityType.objects.all()
    serializer_class = entityTypeSerializer

    # permisos
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [IsAuthenticated]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [IsAuthenticated]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [IsAuthenticated]
        return [permission() for permission in permission_classes]
