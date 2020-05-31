import 'package:sstsoft/cons/service_cons.dart';
import 'package:sstsoft/model/response/generic_data_item_response.dart';
import 'package:sstsoft/util/httpclient.dart';

class RegisterService {
  HttpClient client = HttpClient();

  RegisterService() {
    this.client.setBaseUrl(ServiceCons.BASE_URL);
  }

  Future<List<GenericDataItemResponse>> findAllEps() async {
    try {
      dynamic response = await client.fetchGet(
          ServiceCons.FIND_ALL_EPS, Map<String, dynamic>());
      List<GenericDataItemResponse> epsList = List();
      for (var eachData in response) {
        epsList.add(GenericDataItemResponse.fromJson(eachData));
      }
      return epsList;
    } catch (ex, stacktrace) {
      print(stacktrace);
      throw ex;
    }
  }

  Future<List<GenericDataItemResponse>> findAllArea() async {
    try {
      dynamic response = await client.fetchGet(
          ServiceCons.FIND_ALL_AREA, Map<String, dynamic>());
      List<GenericDataItemResponse> areaList = List();
      for (var eachData in response) {
        areaList.add(GenericDataItemResponse.fromJson(eachData));
      }
      return areaList;
    } catch (ex, stacktrace) {
      print(stacktrace);
      throw ex;
    }
  }

  Future<List<GenericDataItemResponse>> findAllGender() async {
    try {
      dynamic response = await client.fetchGet(
          ServiceCons.FIND_ALL_GENDER, Map<String, dynamic>());
      List<GenericDataItemResponse> genderList = List();
      for (var eachData in response) {
        genderList.add(GenericDataItemResponse.fromJson(eachData));
      }
      return genderList;
    } catch (ex, stacktrace) {
      print(stacktrace);
      throw ex;
    }
  }

  Future<List<GenericDataItemResponse>> findDocumentType() async {
    try {
      List<dynamic> response = await client.fetchGet(
          ServiceCons.FIND_ALL_DOCUMENT_TYPE, Map<String, dynamic>());
      List<GenericDataItemResponse> documentTypeList =
          List<GenericDataItemResponse>();
      for (var eachData in response) {
        documentTypeList.add(GenericDataItemResponse.fromJson(eachData));
      }
      return documentTypeList;
    } catch (ex, stacktrace) {
      print(stacktrace);
      throw ex;
    }
  }
}
