import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import '../enum/enum.dart';
import '../models/custom_response.dart';
import '../models/person_model.dart';
import 'api_service.dart';

class HomeProvider extends ChangeNotifier{
  List<PersonModel> persons=[];

  getPersons()async{
    CustomResponse customResponse= await APIService.makeRequest("persons",requestType: "GET",);
    if (customResponse.responseStatus==ResponseStatus.success){
      persons=customResponse.responseData.map<PersonModel>((element)=>PersonModel.fromJson(element)).toList();
      persons.forEach((element) {
        print(element.name);
      });
    }

  }

  getPersonDetails({String? id})async{
    id??="4";

    CustomResponse customResponse= await APIService.makeRequest("persons/$id",requestType: "GET",);
    Logger().i(customResponse.responseData);
    Logger().i(customResponse.responseStatus);

  }
  updatePersonDetails({String? id})async{
    id??="4";

    CustomResponse customResponse= await APIService.makeRequest("persons/$id",requestType: "PUT",body: {"name":"Khaled"});
    Logger().i(customResponse.responseData);
    Logger().i(customResponse.responseStatus);

  }

  addPerson()async{
    CustomResponse customResponse= await APIService.makeRequest("persons",requestType: "POST",body: {"name":"Ahmed","age":25,"address":"Cairo"});
    Logger().i(customResponse.responseData);
    Logger().i(customResponse.responseStatus);
  }

  deletePerson({String? id}) async{
    id??="3";
    CustomResponse customResponse= await APIService.makeRequest("persons/$id",requestType: "DELETE");
    Logger().i(customResponse.responseData);
    Logger().i(customResponse.responseStatus);
  }


}