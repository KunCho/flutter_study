import 'package:json_annotation/json_annotation.dart';
part 'book.g.dart';

@JsonSerializable(nullable: false)
class Book{

  final num code;
  final String email;
  Book(this.code,this.email);
  factory Book.fromJson(Map<String,dynamic>json) =>_$BookFromJson(json);

  Map<String,dynamic> toJson() => _$BookToJson(this);

}