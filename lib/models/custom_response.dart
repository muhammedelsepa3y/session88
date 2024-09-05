import '../enum/enum.dart';

class CustomResponse{
  dynamic responseData;
  ResponseStatus responseStatus;
  CustomResponse({required this.responseStatus,this.responseData});
}