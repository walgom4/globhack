from django.conf.urls import url, include
from rest_framework import routers
from mainapp.views import UserViewSet, areaViewSet, epsViewSet, genderViewSet, idTypeViewSet

router = routers.DefaultRouter()
router.register(r'user', UserViewSet)
router.register(r'area', areaViewSet)
router.register(r'eps', epsViewSet)
router.register(r'gender', genderViewSet)
router.register(r'idType', idTypeViewSet)

urlpatterns = [
    url(r'^', include(router.urls)),
]