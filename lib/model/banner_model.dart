import 'package:json_annotation/json_annotation.dart';

part 'banner_model.g.dart';


@JsonSerializable()
class BannerModel extends Object {

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'message')
  String message;

  BannerModel(this.data,this.code,this.message,);

  factory BannerModel.fromJson(Map<String, dynamic> srcJson) => _$BannerModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannerModelToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'imageTitle')
  String imageTitle;

  @JsonKey(name: 'imageUrl')
  String imageUrl;

  @JsonKey(name: 'targetUrl')
  String targetUrl;

  @JsonKey(name: 'businessId')
  int businessId;

  @JsonKey(name: 'sort')
  int sort;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'gmtCreate')
  String gmtCreate;

  @JsonKey(name: 'createdBy')
  int createdBy;

  Data(this.id,this.imageTitle,this.imageUrl,this.targetUrl,this.businessId,this.sort,this.status,this.gmtCreate,this.createdBy,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


