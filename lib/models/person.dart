


import 'package:hive/hive.dart';

part 'person.g.dart';


@HiveType(typeId: 1)
class Person extends HiveObject{
  @HiveField(0,defaultValue: "person")
  String name;
  @HiveField(1,defaultValue: 20)
  int age;
  @HiveField(2,defaultValue: "Cairo")
  String address;

  Person({required this.name,required this.age,required this.address});
}