import 'package:sstsoft/cons/service_cons.dart';
import 'package:sstsoft/model/request/health_registry_model.dart';
import 'package:sstsoft/model/request/user_request_model.dart';
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
    } catch (ex) {
      print(ex);
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
    } catch (ex) {
      print(ex);
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
    } catch (ex) {
      print(ex);
      throw ex;
    }
  }

  Future<List<GenericDataItemResponse>> findAllDocumentType() async {
    try {
      List<dynamic> response = await client.fetchGet(
          ServiceCons.FIND_ALL_DOCUMENT_TYPE, Map<String, dynamic>());
      List<GenericDataItemResponse> documentTypeList =
          List<GenericDataItemResponse>();
      for (var eachData in response) {
        documentTypeList.add(GenericDataItemResponse.fromJson(eachData));
      }
      return documentTypeList;
    } catch (ex) {
      print(ex);
      throw ex;
    }
  }

  Future<List<GenericDataItemResponse>> findAllTransport() async {
    try {
      List<dynamic> response = await client.fetchGet(
          ServiceCons.FIND_ALL_TRANSPORT, Map<String, dynamic>());
      List<GenericDataItemResponse> documentTypeList =
          List<GenericDataItemResponse>();
      for (var eachData in response) {
        documentTypeList.add(GenericDataItemResponse.fromJson(eachData));
      }
      return documentTypeList;
    } catch (ex) {
      print(ex);
      throw ex;
    }
  }

  Future<void> registerUser(UserRequestModel userRequestModel,
      HealthRegistryModel healthRegistryModel) async {
    try {
      dynamic response = await client.typedFileUpload(
          ServiceCons.REGISTER_USER, userRequestModel.toJson());
      userRequestModel = UserRequestModel.fromJson(response);
      healthRegistryModel.userFkHealth = int.parse(userRequestModel.id);
      await registerHealthCondition(healthRegistryModel);
    } catch (ex) {
      print(ex);
      throw ex;
    }
  }

  Future<void> registerHealthCondition(
      HealthRegistryModel healthRegistryModel) async {
    try {
      await client.typedFileUpload(
          ServiceCons.REGISTER_DAILY_FORM, healthRegistryModel.toJson());
    } catch (ex) {
      print(ex);
      throw ex;
    }
  }
}
