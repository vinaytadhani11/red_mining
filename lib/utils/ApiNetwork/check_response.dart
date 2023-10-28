import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:redbtc_mining_app/utils/ApiNetwork/app_exception.dart';
import 'package:redbtc_mining_app/utils/ApiNetwork/error_response.dart';
import 'package:redbtc_mining_app/utils/app_function.dart';

class ResponseHandler {
  static Future<void> checkResponseError(
    http.Response response, {
    bool showException = true,
  }) async {
    switch (response.statusCode) {
      case 200:
        final Map data = jsonDecode(response.body);
        if (data['resCode'] != 200 && data['resCode'] != 201) {
          AppFunction.showSnackBar(title: 'Error!', message: data['message']);
          final exception = AppException(
            message: "Unauthorized",
            errorCode: response.statusCode,
          );
          throw exception;
        }

        return;
      case 201:
        return;
      case 401:
        print('checkResponseError 401: ${response.body}');
        final exception = AppException(
          message: "Unauthorized",
          errorCode: response.statusCode,
        );
        if (showException) {
          AppFunction.showSnackBar(title: 'Error!', message: "Unauthorized");
        }
        throw exception;
      case 500:
        print('checkResponseError 500: ${response.body}');
        final Map? data = response.body.isNotEmpty ? jsonDecode(response.body) : {};
        if (showException) {
          AppFunction.showSnackBar(
            title: 'Error!',
            message: data != null ? data['error'] : 'Something went wrong..!',
          );
        }
        final exception = AppException(
          message: "No Internet",
          errorCode: response.statusCode,
        );

        throw exception;
      default:
        print('checkResponseError default: ${response.body}');
        final ErrorResponse error = ErrorResponse.fromJson(jsonDecode(response.body));
        if (showException) {
          AppFunction.showSnackBar(
            title: 'Error!',
            message: error.erroMessage ?? 'Something went wrong..!',
          );
        }
        final exception = AppException(
          message: error.erroMessage ?? "Something went wrong..!",
          errorCode: response.statusCode,
        );
        if (showException) exception.show();
        throw 'exception';
    }
  }
}
