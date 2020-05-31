from rest_framework import serializers
from mainapp.models import User, area, eps, gender, idType, healthRegister, transport, resources, entity, entityType, question, answers, schedule

# user serializer
class UserSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = User
        fields = ('url', 'id', 'username', 'idType_fk_user', 'email', 'password',
                'name','last_name','phone', 'address','birthday','gender_fk_user',
                'eps_fk_user','job','boss','area_fk_user', 'photo', 'transport_fk_user', 
                'risk', 'who_risk', 'health_system', 'who_health', 
                'emergency_contact_name', 'emergency_contact_relationship', 
                'emergency_contact_phone', 'accept_terms', 'is_sst', 'is_active')
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        password = validated_data.pop('password')
        user = User(**validated_data)
        user.is_active = True
        user.set_password(password)
        user.save()
        #send email here
        return user

class areaSerializer (serializers.ModelSerializer):
    class Meta:
        model = area
        fields = ('url', 'id','name')

class epsSerializer (serializers.ModelSerializer):
    class Meta:
        model = eps
        fields = ('url', 'id','name')

class idTypeSerializer (serializers.ModelSerializer):
    class Meta:
        model = idType
        fields = ('url', 'id','name')

class genderSerializer (serializers.ModelSerializer):
    class Meta:
        model = gender
        fields = ('url', 'id','name')

class transportSerializer (serializers.ModelSerializer):
    class Meta:
        model = transport
        fields = ('url', 'id','name')

class healthRegisterSerializer (serializers.ModelSerializer):
    class Meta:
        model = healthRegister
        fields = ('url', 'id', 'flu', 'fever', 'cough', 'sore_throat', 
        'nasal_congestion', 'fatigue', 'difficult_breathe', 'muscle_pain', 
        'diarrhea', 'threw_up', 'other', 'user_fk_health', 'temperature', 
        'photo_temperature', 'photo_workspace', 'photo_selfie', 'observations',
        'health_condition', 'medical_file', 'ill', 'who_ill', 'date')

class userHealthRegisterSerializer (serializers.ModelSerializer):
    user_fk_health = UserSerializer(read_only=True)
    class Meta:
        model = healthRegister
        fields = ('url', 'id', 'flu', 'fever', 'cough', 'sore_throat', 
        'nasal_congestion', 'fatigue', 'difficult_breathe', 'muscle_pain', 
        'diarrhea', 'threw_up', 'other', 'user_fk_health', 'temperature', 
        'photo_temperature', 'photo_workspace', 'photo_selfie', 'observations',
        'health_condition', 'medical_file', 'ill', 'who_ill', 'home', 'bad', 'date')

class resourcesSerializer (serializers.ModelSerializer):
    class Meta:
        model = resources
        fields = ('url', 'id','code','image', 'resource_url','text')

class entitySerializer (serializers.ModelSerializer):
    class Meta:
        model = entity
        fields = ('url', 'id','name','image', 'webpage','address', 'phone', 'entityType_fk_entity')

class entityTypeSerializer (serializers.ModelSerializer):
    class Meta:
        model = entityType
        fields = ('url', 'id','name')

class questionSerializer (serializers.ModelSerializer):
    class Meta:
        model = question
        fields = ('url', 'id','question', 'op1', 'op2', 'op3', 'answer')

class answersSerializer (serializers.ModelSerializer):
    class Meta:
        model = answers
        fields = ('url', 'id','answer_fk_user', 'answer_fk_question', 'user_answer', 'date')

class scheduleSerializer (serializers.ModelSerializer):
    class Meta:
        model = schedule
        fields = ('url', 'id','date_start', 'date_end', 'schedule_fk_healthRegister')