


class PersonModel{
  String name;
  int age;
  String id;
  String address;

  PersonModel({required this.name,required this.age,required this.address,required this.id});
 static PersonModel fromJson(dynamic map){
    return PersonModel(name: map["name"], age: map["age"], address: map["address"],id: map["id"]);
  }
}