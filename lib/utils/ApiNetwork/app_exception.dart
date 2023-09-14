import 'dart:developer';
import 'dart:io';

class AppException implements Exception {
  //un_known error code -> 0
  late String message;
  String? tag;
  int errorCode;

  AppException({required this.message, required this.errorCode, this.tag});

  int getErrorCode() => errorCode;

  String getMessage() => message;

  String getMessageWithTag() => "${tag ?? 'No Tag'} : $message";

  String? getTag() => tag;

  @override
  String toString() {
    return "${errorCode.toString()} : ${tag ?? 'No Tag'} : $message";
  }

  static void showException(dynamic exception, [dynamic stackTrace]) {
    if (exception is AppException) {
      exception.show();
    } else if (exception is SocketException) {
      AppException(message: exception.message, errorCode: exception.osError?.errorCode ?? 0).show();
    } else if (exception is HttpException) {
      AppException(message: "Couldn't find the requested data", errorCode: 0).show();
    } else if (exception is FormatException) {
      AppException(message: "Bad response format", errorCode: 0).show();
    } else {
      AppException(message: "Something went wrong", errorCode: 0).show();
    }
  }

  void show() {
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('message: $message, title: Error')));
    log('message: $message, title: Error');
  }
}
