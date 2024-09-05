import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';
import 'package:session88/enum/enum.dart';
import 'package:session88/models/custom_response.dart';
import 'package:session88/services/desk_storage.dart';
import 'package:session88/util/constants.dart';
import 'package:http/http.dart' as http;
class APIService {
   static makeRequest(
       String endPoint,{
    String requestType="POST",
         dynamic body,
         Map<String,String>? headers
   })async{
     try {
       final url = Uri.parse(baseUrl + endPoint);
       final request = http.Request(requestType, url);
       headers ??= {
         if(DeskStorage.token != null )"Authorization": "Token ${DeskStorage
             .token}",
         HttpHeaders.contentTypeHeader: 'application/json'
       };
       request.headers.addAll(headers);
       if (body != null) {
         request.body = jsonEncode(body);
       }
       final response = await http.Client().send(request);
       final responseString = await response.stream.bytesToString();
       ResponseStatus status = response.statusCode == 200 ||
           response.statusCode == 201 ?
       ResponseStatus.success : ResponseStatus.errorFromBackend;
       if (responseString.isNotEmpty) {
         try{
           var responseContent=jsonDecode(responseString);
           return CustomResponse(responseStatus: status,responseData: responseContent);
         }catch(err){
           return CustomResponse(responseStatus: status,responseData: responseString);
         }

       }else{
         return CustomResponse(responseStatus: status);
       }
     }catch(err){
       return CustomResponse(responseStatus: ResponseStatus.errorCatching,responseData: err.toString());

     }




   }
}







// HEADERS
// BODY

// (PERSONS, ADMINS, PROVIDERS) ) API         application
//        <- SEND REQUEST  <-
//        -> Send Response ->


// GET POST PUT DELETE


//STATUS CODE (200,201)


