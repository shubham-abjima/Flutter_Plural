import 'package:flutter_architecture/data/response/Status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed() : status = Status.LOADING;
  ApiResponse.error() : status = Status.LOADING;

  @override
  String toString() {
    return 'Status: $status \n Message : $message \n Data : $data';
  }
}
