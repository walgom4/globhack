import 'package:sstsoft/cons/service_cons.dart';
import 'package:sstsoft/model/response/entity_response.dart';
import 'package:sstsoft/model/response/resources_response.dart';
import 'package:sstsoft/util/httpclient.dart';

class ResourceService {
  HttpClient client = HttpClient();

  ResourceService() {
    this.client.setBaseUrl(ServiceCons.BASE_URL);
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
  Future<Resources> findMask() async {
    try {
      dynamic response = await client.fetchGet(
          ServiceCons.FIND_MASK, Map<String, dynamic>());
      Resources resource = Resources.fromJson(response);
      return resource;
    } catch (ex, stacktrace) {
      print(stacktrace);
      throw ex;
    }
  }
  Future<Resources> findGloves() async {
    try {
      dynamic response = await client.fetchGet(
          ServiceCons.FIND_GLOVES, Map<String, dynamic>());
      Resources resource = Resources.fromJson(response);
      return resource;
    } catch (ex, stacktrace) {
      print(stacktrace);
      throw ex;
    }
  }
  Future<Resources> findSymptoms() async {
    try {
      dynamic response = await client.fetchGet(
          ServiceCons.FIND_SYMPTOMS, Map<String, dynamic>());
      Resources resource = Resources.fromJson(response);
      return resource;
    } catch (ex, stacktrace) {
      print(stacktrace);
      throw ex;
    }
  }
  
  Future<Entity> findARL() async {
    try {
      dynamic response = await client.fetchGet(
          ServiceCons.FIND_ENTITY, Map<String, dynamic>());
      Entity resource = Entity.fromJson(response);
      return resource;
    } catch (ex, stacktrace) {
      print(stacktrace);
      throw ex;
    }
  }

  
}
