from rest_framework import serializers
from mainapp.models import User, area, eps, gender, idType, healthRegister

# user serializer
class UserSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = User
        fields = ('url', 'identification', 'username', 'idType_fk_user', 'email', 'password',
                'name','last_name','phone', 'address','birthday','gender_fk_user',
                'eps_fk_user','job','boss','area_fk_user', 'photo', 'transport_fk_user', 
                'risk', 'who_risk', 'health_system', 'who_health', 
                'emergency_contact_name', 'emergency_contact_relationship', 
                'emergency_contact_phone')
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        password = validated_data.pop('password')
        user = User(**validated_data)
        user.is_active = False
        user.set_password(password)
        user.save()
        #send email here
        return user

    def update(self, instance, validated_data):
        instance.identification = validated_data.get('identification', instance.identification)
        instance.save()

        return instance

class areaSerializer (serializers.ModelSerializer):
    class Meta:
        model = area
        fields = ('url', 'id',
                  'name')

class epsSerializer (serializers.ModelSerializer):
    class Meta:
        model = eps
        fields = ('url', 'id',
                  'name')

class idTypeSerializer (serializers.ModelSerializer):
    class Meta:
        model = idType
        fields = ('url', 'id',
                  'name')

class genderSerializer (serializers.ModelSerializer):
    class Meta:
        model = gender
        fields = ('url', 'id',
                  'name')

class healthRegisterSerializer (serializers.ModelSerializer):
    class Meta:
        model = healthRegister
        fields = ('url', 'id', 'flu', 'fever', 'cough', 'sore_throat', 
        'nasal_congestion', 'fatigue', 'difficult_breathe', 'muscle_pain', 
        'diarrhea', 'threw_up', 'other', 'user_fk_health', 'temperature', 
        'photo_temperature', 'photo_workspace', 'photo_selfie', 'observations',
        'health_condition', 'medical_file', 'ill', 'who_ill', 'date')