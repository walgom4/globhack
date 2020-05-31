from django.conf.urls import url, include
from rest_framework import routers
from mainapp.views import UserViewSet, areaViewSet, epsViewSet, genderViewSet, idTypeViewSet, healthRegisterViewSet, userHealthRegisterViewSet, transportViewSet, resourcesViewSet, entityTypeViewSet, entityViewSet, questionViewSet, scheduleViewSet

router = routers.DefaultRouter()
router.register(r'user', UserViewSet)
router.register(r'area', areaViewSet)
router.register(r'eps', epsViewSet)
router.register(r'gender', genderViewSet)
router.register(r'transport', transportViewSet)
router.register(r'idType', idTypeViewSet)
router.register(r'healthRegister', healthRegisterViewSet)
router.register(r'userHealthRegister', userHealthRegisterViewSet)
router.register(r'resources', resourcesViewSet)
router.register(r'entity', entityViewSet)
router.register(r'entityType', entityTypeViewSet)
router.register(r'question', questionViewSet)
router.register(r'schedule', scheduleViewSet)

urlpatterns = [
    url(r'^', include(router.urls)),
]