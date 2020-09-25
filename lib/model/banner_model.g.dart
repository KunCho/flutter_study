// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerModel _$BannerModelFromJson(Map<String, dynamic> json) {
  return BannerModel(
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['code'] as String,
    json['message'] as String,
  );
}

Map<String, dynamic> _$BannerModelToJson(BannerModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'code': instance.code,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['id'] as int,
    json['imageTitle'] as String,
    json['imageUrl'] as String,
    json['targetUrl'] as String,
    json['businessId'] as int,
    json['sort'] as int,
    json['status'] as int,
    json['gmtCreate'] as String,
    json['createdBy'] as int,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'imageTitle': instance.imageTitle,
      'imageUrl': instance.imageUrl,
      'targetUrl': instance.targetUrl,
      'businessId': instance.businessId,
      'sort': instance.sort,
      'status': instance.status,
      'gmtCreate': instance.gmtCreate,
      'createdBy': instance.createdBy,
    };
