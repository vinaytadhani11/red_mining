class ErrorResponse {
  ApiError? apiError;
  String? erroMessage;

  ErrorResponse({
    this.apiError,
    this.erroMessage,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      apiError: json['apierror'] != null ? ApiError.fromJson(json['apierror']) : null,
      erroMessage: json['errorMessage'] ?? json['erroMessage'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (apiError != null) {
      data['apierror'] = apiError?.toJson();
      data['errorMessage'] = erroMessage;
    }
    return data;
  }
}

class ApiError {
  String? description;
  String? message;
  String? status;

  // Object? subErrors;
  int? timestamp;

  ApiError(
      {this.description,
      this.message,
      this.status,
      // this.subErrors,
      this.timestamp});

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      description: json['description'],
      message: json['message'],
      status: json['status'],
      // subErrors:
      //     json['subErrors'] != null ? Object.fromJson(json['subErrors']) : null,
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['timestamp'] = timestamp;
    if (description != null) {
      data['description'] = description;
    }
    // if (this.subErrors != null) {
    //   data['subErrors'] = this.subErrors.toJson();
    // }
    return data;
  }
}
