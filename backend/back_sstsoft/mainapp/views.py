from django.shortcuts import render
from mainapp.serializers import UserSerializer, areaSerializer, epsSerializer, genderSerializer, idTypeSerializer, healthRegisterSerializer, userHealthRegisterSerializer, transportSerializer, resourcesSerializer, entitySerializer, entityTypeSerializer, questionSerializer, answersSerializer, scheduleSerializer
from mainapp.models import User, area, eps, gender, idType, healthRegister, transport, resources, entity, entityType, question, answers, schedule

# start restframework
from rest_framework import viewsets, generics
from rest_framework.permissions import AllowAny, IsAuthenticated, IsAdminUser
from rest_framework.decorators import api_view, schema
from rest_framework.response import Response
from rest_framework.filters import OrderingFilter
from django_filters.rest_framework import DjangoFilterBackend
# end restframework

# Create your views here.
class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    filterset_fields = ['id', 'username', 'idType_fk_user', 'email',
                'name','last_name','phone', 'address','birthday','gender_fk_user',
                'eps_fk_user','job','boss','area_fk_user',  'transport_fk_user', 
                'risk', 'who_risk', 'health_system', 'who_health', 
                'emergency_contact_name', 'emergency_contact_relationship', 
                'emergency_contact_phone', 'accept_terms', 'is_sst']
    ordering_fields = ['id', 'username', 'idType_fk_user', 'email',
                'name','last_name','phone', 'address','birthday','gender_fk_user',
                'eps_fk_user','job','boss','area_fk_user', 'transport_fk_user', 
                'risk', 'who_risk', 'health_system', 'who_health', 
                'emergency_contact_name', 'emergency_contact_relationship', 
                'emergency_contact_phone', 'accept_terms', 'is_sst']

    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [AllowAny]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update' or self.action == 'destroy':
            permission_classes = [AllowAny]
        elif self.action == 'list':
            permission_classes = [AllowAny]

        return [permission() for permission in permission_classes]

    def get_queryset(self):
        # if self.action == 'list':
        #     return self.queryset.filter(id=self.request.user.id)
        return self.queryset

class areaViewSet(viewsets.ModelViewSet):
    queryset = area.objects.all()
    serializer_class = areaSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    filterset_fields = ['id','name']
    ordering_fields = ['id','name']

    # permisos
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [AllowAny]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update' or self.action == 'destroy':
            permission_classes = [AllowAny]
        elif self.action == 'list':
            permission_classes = [AllowAny]
        return [permission() for permission in permission_classes]

class epsViewSet(viewsets.ModelViewSet):
    queryset = eps.objects.all()
    serializer_class = epsSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    filterset_fields = ['id','name']
    ordering_fields = ['id','name']

    # permisos
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [AllowAny]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [AllowAny]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [AllowAny]
        return [permission() for permission in permission_classes]

class genderViewSet(viewsets.ModelViewSet):
    queryset = gender.objects.all()
    serializer_class = genderSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    filterset_fields = ['id','name']
    ordering_fields = ['id','name']

    # permisos
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [AllowAny]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [AllowAny]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [AllowAny]
        return [permission() for permission in permission_classes]

class transportViewSet(viewsets.ModelViewSet):
    queryset = transport.objects.all()
    serializer_class = transportSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    filterset_fields = ['id','name']
    ordering_fields = ['id','name']

    # permisos
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [AllowAny]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [AllowAny]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [AllowAny]
        return [permission() for permission in permission_classes]

class idTypeViewSet(viewsets.ModelViewSet):
    queryset = idType.objects.all()
    serializer_class = idTypeSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    filterset_fields = ['id','name']
    ordering_fields = ['id','name']

    # permisos
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [AllowAny]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [AllowAny]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [AllowAny]
        return [permission() for permission in permission_classes]

class healthRegisterViewSet(viewsets.ModelViewSet):
    queryset = healthRegister.objects.all()
    serializer_class = healthRegisterSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    filterset_fields = [ 'id', 'flu', 'fever', 'cough', 'sore_throat', 
        'nasal_congestion', 'fatigue', 'difficult_breathe', 'muscle_pain', 
        'diarrhea', 'threw_up', 'other', 'user_fk_health', 'temperature', 'observations',
        'health_condition', 'ill', 'who_ill', 'date']
    ordering_fields = [ 'id', 'flu', 'fever', 'cough', 'sore_throat', 
        'nasal_congestion', 'fatigue', 'difficult_breathe', 'muscle_pain', 
        'diarrhea', 'threw_up', 'other', 'user_fk_health', 'temperature', 'observations',
        'health_condition', 'ill', 'who_ill', 'date']

    # permisos
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [AllowAny]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [AllowAny]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [AllowAny]
        return [permission() for permission in permission_classes]

class userHealthRegisterViewSet(viewsets.ModelViewSet):
    queryset = healthRegister.objects.all()
    serializer_class = userHealthRegisterSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    filterset_fields = [ 'id', 'flu', 'fever', 'cough', 'sore_throat', 
        'nasal_congestion', 'fatigue', 'difficult_breathe', 'muscle_pain', 
        'diarrhea', 'threw_up', 'other', 'user_fk_health', 'temperature', 'observations',
        'health_condition', 'ill', 'who_ill', 'date']
    ordering_fields = [ 'id', 'flu', 'fever', 'cough', 'sore_throat', 
        'nasal_congestion', 'fatigue', 'difficult_breathe', 'muscle_pain', 
        'diarrhea', 'threw_up', 'other', 'user_fk_health', 'temperature', 'observations',
        'health_condition', 'ill', 'who_ill', 'date']

    # permisos
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [AllowAny]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [AllowAny]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [AllowAny]
        return [permission() for permission in permission_classes]

class resourcesViewSet(viewsets.ModelViewSet):
    queryset = resources.objects.all()
    serializer_class = resourcesSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    filterset_fields = ['id', 'code']

    # permisos
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [AllowAny]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [AllowAny]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [AllowAny]
        return [permission() for permission in permission_classes]

class entityViewSet(viewsets.ModelViewSet):
    queryset = entity.objects.all()
    serializer_class = entitySerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter]

    # permisos
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [AllowAny]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [AllowAny]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [AllowAny]
        return [permission() for permission in permission_classes]

class entityTypeViewSet(viewsets.ModelViewSet):
    queryset = entityType.objects.all()
    serializer_class = entityTypeSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter]

    # permisos
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [AllowAny]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [AllowAny]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [AllowAny]
        return [permission() for permission in permission_classes]

class questionViewSet(viewsets.ModelViewSet):
    queryset = question.objects.all()
    serializer_class = questionSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    ordering_fields = [ 'id']
    
    # permisos
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [AllowAny]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [AllowAny]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [AllowAny]
        return [permission() for permission in permission_classes]

class answersViewSet(viewsets.ModelViewSet):
    queryset = answers.objects.all()
    serializer_class = answersSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    ordering_fields = [ 'id']

    # permisos
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [AllowAny]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [AllowAny]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [AllowAny]
        return [permission() for permission in permission_classes]

class scheduleViewSet(viewsets.ModelViewSet):
    queryset = schedule.objects.all()
    serializer_class = scheduleSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    ordering_fields = [ 'id']

    # permisos
    def get_permissions(self):
        permission_classes = []
        if self.action == 'create':
            permission_classes = [AllowAny]
        elif self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update':
            permission_classes = [AllowAny]
        elif self.action == 'list' or self.action == 'destroy':
            permission_classes = [AllowAny]
        return [permission() for permission in permission_classes]
