// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResultModel {}

class SuccessModel extends ResultModel {}

class ErrorModel extends ResultModel {
  String message;
  ErrorModel({
    required this.message,
  });
}

class ExceptionModel extends ResultModel {
  String message;
  ExceptionModel({
    required this.message,
  });
}


