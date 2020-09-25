import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: false)
class Person{
  String firstName;
  String lastName;
  DateTime dateOfBirth;

  Person(this.firstName, this.lastName, this.dateOfBirth);

//  factory Person.fromJson(Map<String,dynamic>json)=>_$PersonFromJson(json);
}