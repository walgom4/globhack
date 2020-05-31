import 'package:sstsoft/cons/service_cons.dart';
import 'package:sstsoft/model/response/resources_response.dart';
import 'package:sstsoft/util/httpclient.dart';

class RegisterService {
  HttpClient client = HttpClient();

  RegisterService() {
    this.client.setBaseUrl(ServiceCons.BASE_URL);
  }

  Future<List<Resources>> findAllResources() async {
    try {
      dynamic response = await client.fetchGet(
          ServiceCons.FIND_ALL_RESOURCES, Map<String, dynamic>());
      List<Resources> resourceList = List();
      for (var eachData in response) {
        resourceList.add(Resources.fromJson(eachData));
      }
      return resourceList;
    } catch (ex, stacktrace) {
      print(stacktrace);
      throw ex;
    }
  }
  
  Future<Resources> findHandsVideo() async {
    try {
      dynamic response = await client.fetchGet(
          ServiceCons.FIND_WASH_HAND_VIDEO, Map<String, dynamic>());
      Resources resource = Resources.fromJson(response);
      return resource;
    } catch (ex, stacktrace) {
      print(stacktrace);
      throw ex;
    }
  }
  Future<Resources> findCleaningArea() async {
    try {
      dynamic response = await client.fetchGet(
          ServiceCons.FIND_CLEANING_AREA, Map<String, dynamic>());
      Resources resource = Resources.fromJson(response);
      return resource;
    } catch (ex, stacktrace) {
      print(stacktrace);
      throw ex;
    }
  }
  Future<Resources> findClothes() async {
    try {
      dynamic response = await client.fetchGet(
          ServiceCons.FIND_CLOTHES, Map<String, dynamic>());
      Resources resource = Resources.fromJson(response);
      return resource;
    } catch (ex, stacktrace) {
      print(stacktrace);
      throw ex;
    }
  }
  Future<Resources> findShoes() async {
    try {
      dynamic response = await client.fetchGet(
          ServiceCons.FIND_SHOES, Map<String, dynamic>());
      Resources resource = Resources.fromJson(response);
      return resource;
    } catch (ex, stacktrace) {
      print(stacktrace);
      throw ex;
    }
  }
  Future<Resources> findGlasses() async {
    try {
      dynamic response = await client.fetchGet(
          ServiceCons.FIND_GLASSES, Map<String, dynamic>());
      Resources resource = Resources.fromJson(response);
      return resource;
    } catch (ex, stacktrace) {
      print(stacktrace);
      throw ex;
    }
  }

  
}