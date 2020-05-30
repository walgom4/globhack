from rest_framework import serializers
from mainapp.models import User, area, eps, gender, idType

# user serializer
class UserSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = User
        fields = ('url', 'identification', 'username', 'idType_fk_user', 'email', 'password',
                'name','last_name','phone','birthday','gender_fk_user',
                'eps_fk_user','job','boss','area_fk_user')
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