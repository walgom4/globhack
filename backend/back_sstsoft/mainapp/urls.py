from django.conf.urls import url, include
from rest_framework import routers
from mainapp.views import UserViewSet, areaViewSet, epsViewSet, genderViewSet, idTypeViewSet, healthRegisterViewSet

router = routers.DefaultRouter()
router.register(r'user', UserViewSet)
router.register(r'area', areaViewSet)
router.register(r'eps', epsViewSet)
router.register(r'gender', genderViewSet)
router.register(r'idType', idTypeViewSet)
router.register(r'healthRegister', healthRegisterViewSet)

urlpatterns = [
    url(r'^', include(router.urls)),
]