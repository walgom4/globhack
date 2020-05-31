import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:sstsoft/model/ws_exception.dart';

class HttpClient {
  static final HttpClient instance = new HttpClient._internal();
  HttpClient._internal();

  String clientBaseUrl;
  Dio client = new Dio();
  Dio interceptorClient = new Dio();

  factory HttpClient() {
    return instance;
  }

  setBaseUrl(String clientBaseUrl) {
    this.clientBaseUrl = clientBaseUrl;
  }

  setFlutterDefaultTransformer() {
    client.transformer = new FlutterTransformer();
  }

  Future<dynamic> fetchGet(String url, Map<String, dynamic> parameters,
      [String tokenHeader, Map<String, dynamic> headers]) async {
    try {
      var uriTemplate = Uri.encodeFull(this.clientBaseUrl + url);
      Map<String, String> headerParameters = new Map<String, String>();
      if (tokenHeader != null && tokenHeader.isNotEmpty) {
        headerParameters['Authorization'] = 'Basic ' + tokenHeader;
      }
      if (headers != null && headers.isNotEmpty) {
        headers.forEach((key, value) {
          headerParameters[key] = value;
        });
      }
      headerParameters['Content-Type'] = 'application/json';
      final Response<dynamic> response = await client.get(uriTemplate,
          options: new Options(
            headers: headerParameters,
          ),
          queryParameters: parameters);
      return buildResponse(response);
    } catch (ex) {
      throw handleError(ex);
    }
  }

  Future<dynamic> fetchPost(String url, Map<String, dynamic> parameters,
      [String tokenHeader, Map<String, dynamic> headers]) async {
    try {
      Map<String, String> headerParameters = new Map<String, String>();
      if (tokenHeader != null && tokenHeader.isNotEmpty) {
        headerParameters[HttpHeaders.authorizationHeader] =
            'Basic ' + tokenHeader;
      }
      if (headers != null && headers.isNotEmpty) {
        headers.forEach((key, value) {
          headerParameters[key] = value;
        });
      }
      headerParameters[HttpHeaders.contentTypeHeader] = 'application/json';
      final Response<dynamic> response = await client.post(
          Uri.encodeFull(this.clientBaseUrl + url),
          options: Options(headers: headerParameters),
          data: parameters);
      return buildResponse(response);
    } catch (ex) {
      throw handleError(ex);
    }
  }

  Future<dynamic> fetchPut(String url, Map<String, dynamic> parameters,
      [String tokenHeader, Map<String, dynamic> headers]) async {
    try {
      Map<String, String> headerParameters = new Map<String, String>();
      if (tokenHeader != null && tokenHeader.isNotEmpty) {
        headerParameters[HttpHeaders.authorizationHeader] =
            'Basic ' + tokenHeader;
      }
      if (headers != null && headers.isNotEmpty) {
        headers.forEach((key, value) {
          headerParameters[key] = value;
        });
      }
      headerParameters[HttpHeaders.contentTypeHeader] = 'application/json';
      final Response<dynamic> response = await client.put(
          Uri.encodeFull(this.clientBaseUrl + url),
          options: Options(headers: headerParameters),
          data: parameters);
      return buildResponse(response);
    } catch (ex) {
      throw handleError(ex);
    }
  }

  Future<dynamic> fetchDelete(String url, Map<String, dynamic> parameters,
      [String tokenHeader]) async {
    try {
      Map<String, String> headerParameters = new Map<String, String>();
      if (tokenHeader != null && tokenHeader.isNotEmpty) {
        headerParameters[HttpHeaders.authorizationHeader] =
            'Basic ' + tokenHeader;
      }
      headerParameters[HttpHeaders.contentTypeHeader] = 'application/json';
      final Response<dynamic> response = await client.delete(
          Uri.encodeFull(this.clientBaseUrl + url),
          options: Options(headers: headerParameters),
          queryParameters: parameters);
      return buildResponse(response);
    } catch (ex) {
      throw handleError(ex);
    }
  }


  Future<dynamic> singleFileUpload(String url, String fileUrl, String fileName,
      [String tokenHeader, Function(int count, int total) sendProgressHandler]) async {
    try {
      Map<String, String> headerParameters = new Map<String, String>();
      if (tokenHeader != null && tokenHeader.isNotEmpty) {
        headerParameters[HttpHeaders.authorizationHeader] =
            'Basic ' + tokenHeader;
      }
      final Response<dynamic> response =
          await client.post(Uri.encodeFull(this.clientBaseUrl + url),
              data: FormData.fromMap(
                {
                  "file":
                      await MultipartFile.fromFile(fileUrl, filename: fileName),
                },
              ),
              options: Options(headers: headerParameters),
              onSendProgress: sendProgressHandler);
      return buildResponse(response);
    } catch (ex) {
      handleError(ex);
    }
  }

  Future<dynamic> typedFileUpload(String url, Map<String, dynamic> formData,
      [String tokenHeader, Function(int count, int total) sendProgressHandler]) async {
    try {
      Map<String, String> headerParameters = new Map<String, String>();
      if (tokenHeader != null && tokenHeader.isNotEmpty) {
        headerParameters[HttpHeaders.authorizationHeader] =
            'Basic ' + tokenHeader;
      }
      final Response<dynamic> response =
          await client.post(Uri.encodeFull(this.clientBaseUrl + url),
              data: FormData.fromMap(
                formData,
              ),
              options: Options(headers: headerParameters),
              onSendProgress: sendProgressHandler);
      return buildResponse(response);
    } catch (ex) {
      handleError(ex);
    }
  }

  buildResponse(Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else {
      throw new WsException(response.statusCode, response.data);
    }
  }

  handleError(ex) {
    if (ex is DioError) {
      if (ex.response != null) {
        throw new WsException(ex.response.statusCode, ex.response.data);
      } else {
        throw new WsException(500, {'unhandledException': ex.message});
      }
    } else {
      return ex;
    }
  }
}
