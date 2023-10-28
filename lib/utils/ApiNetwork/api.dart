import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:redbtc_mining_app/utils/ApiNetwork/api_constants.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/app_exception.dart';
import 'package:redbtc_mining_app/utils/app_shared_preference.dart';

class Api {
  static Api? _instance;

  static http.Client dio = http.Client();

  factory Api() {
    if (_instance == null) {
      _instance = Api._();
      return _instance!;
    } else {
      return _instance!;
    }
  }

  Api._();

  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? queryData,
    Map<String, String>? header,
    dynamic bodyData,
  }) async {
    log('bodyData: ${jsonEncode(bodyData)}');
    final response = await dio.post(
      getUrl(url, queryParameters: queryData),
      body: bodyData,
      headers: header ?? headers(),
    );
    return response;
  }

  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryData,
  }) async {
    final response = await dio.get(
      getUrl(url, queryParameters: queryData),
      headers: headers(),
    );
    log('get api response: ${response.statusCode} // ${response.body}');
    return response;
  }

  Future<dynamic> put(
    String url, {
    Map<String, dynamic>? queryData,
    Map<String, dynamic>? bodyData,
  }) async {
    final response = await dio.put(
      getUrl(url, queryParameters: queryData),
      body: jsonEncode(bodyData),
      headers: headers(),
    );
    return response;
  }

  Future<dynamic> patch(
    String url, {
    Map<String, dynamic>? queryData,
    Map<String, dynamic>? bodyData,
  }) async {
    final response = await dio.patch(
      getUrl(url, queryParameters: queryData),
      body: jsonEncode(bodyData),
      headers: headers(),
    );
    return response;
  }

  Future<dynamic> delete(
    String url, {
    Map<String, dynamic>? queryData,
    Map<String, dynamic>? bodyData,
  }) async {
    final response = await dio.delete(
      getUrl(url, queryParameters: queryData),
      body: jsonEncode(bodyData),
      headers: headers(),
    );
    return response;
  }

  Future<dynamic> head(
    String url, {
    Map<String, dynamic>? queryData,
  }) async {
    final response = await dio.head(
      getUrl(url, queryParameters: queryData),
      headers: headers(),
    );
    return response;
  }

  Future<dynamic> multiPartRequestWithoutImage(
    String url, {
    Map<String, String>? queryData,
    Map<String, String>? header,
  }) async {
    final String fullUrl = "${ApiConstants.BASE_URL}$url";
    final request = http.MultipartRequest(
      'POST',
      Uri.parse(fullUrl),
    );
    log(fullUrl);
    log(queryData.toString());
    request.fields.addAll(queryData!);
    request.headers.addAll(header ?? headers());
    final http.StreamedResponse response = await request.send();
    final result = await http.Response.fromStream(response);
    return result;
  }

  Future<dynamic> postUrlEncoded(
    String url, {
    Map<String, String>? encoded,
    Map<String, String>? header,
  }) async {
    final String fullUrl = "${ApiConstants.BASE_URL}$url";
    print('Api Url: $fullUrl');
    print('encoded: $encoded');
    print('header: $header');
    print('header: ${header ?? headers()}');
    final request = http.Request('POST', Uri.parse(fullUrl));
    request.bodyFields = encoded ?? {};
    request.headers.addAll(header ?? headers());
    final http.StreamedResponse response = await request.send();
    final result = await http.Response.fromStream(response);
    return result;
  }

  Future<dynamic> multipartRequestList(
    String url, {
    required String key,
    Map<String, String>? body,
    List<String>? imageList,
  }) async {
    try {
      const String fullURL = 'BASE_URL + url';
      final request = http.MultipartRequest('POST', Uri.parse(fullURL));
      request.headers.addAll(headers());
      request.fields.addAll(body!);
      if (imageList != null && imageList.isNotEmpty) {
        imageList.forEach((element) async {
          request.files.add(await http.MultipartFile.fromPath(key, element));
        });
      }
      final http.StreamedResponse response = await request.send();
      final result = await http.Response.fromStream(response);
      return result;
    } catch (exception) {
      AppException.showException(exception);
    }
  }
}

Map<String, String> headers() {
  final Map<String, String> headers = <String, String>{};
  // headers["Content-Type"] = "application/x-www-form-urlencoded";
  headers["Accept"] = "application/json";
  final String token = AppSharedPreference.getToken;
  log('Authorization Token : $token');
  if (token != '') {
    headers["Authorization"] = token;
    // headers["X-token"] = '$token';
  }
  return headers;
}

Uri getUrl(String endpoint, {Map<String, dynamic>? queryParameters}) {
  String url = endpoint;
  if (queryParameters != null && queryParameters.isNotEmpty) {
    url = "$url?";
    for (int i = 0; i < queryParameters.entries.length; i++) {
      final element = queryParameters.entries.elementAt(i);
      url += '${element.key}=${element.value}';
      if (i < queryParameters.entries.length - 1) {
        url += '&';
      }
    }
  }
  log('Api Url: ${Uri.parse(url)}');
  return Uri.parse(url);
}
