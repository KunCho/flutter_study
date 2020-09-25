// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) {
  return HomeModel(
    json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    json['code'] as String,
    json['message'] as String,
  );
}

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'data': instance.data,
      'code': instance.code,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    (json['commonAppList'] as List)
        ?.map((e) => e == null
            ? null
            : CommonAppList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['menuDTOList'] as List)
        ?.map((e) =>
            e == null ? null : MenuDTOList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['hasTips'] as bool,
    json['hasPerformance'] as bool,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'commonAppList': instance.commonAppList,
      'menuDTOList': instance.menuDTOList,
      'hasTips': instance.hasTips,
      'hasPerformance': instance.hasPerformance,
    };

CommonAppList _$CommonAppListFromJson(Map<String, dynamic> json) {
  return CommonAppList(
    json['id'] as int,
    json['name'] as String,
    json['icon'] as String,
    json['type'] as int,
    json['action'] as String,
    json['path'] as String,
    json['sort'] as int,
    json['parentId'] as int,
    json['status'] as int,
    json['version'] as int,
    json['menuType'] as int,
    json['appTipsCount'] as int,
    json['commonType'] as bool,
  );
}

Map<String, dynamic> _$CommonAppListToJson(CommonAppList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'type': instance.type,
      'action': instance.action,
      'path': instance.path,
      'sort': instance.sort,
      'parentId': instance.parentId,
      'status': instance.status,
      'version': instance.version,
      'menuType': instance.menuType,
      'appTipsCount': instance.appTipsCount,
      'commonType': instance.commonType,
    };

MenuDTOList _$MenuDTOListFromJson(Map<String, dynamic> json) {
  return MenuDTOList(
    json['id'] as int,
    json['name'] as String,
    json['type'] as int,
    json['path'] as String,
    json['sort'] as int,
    json['parentId'] as int,
    json['status'] as int,
    json['version'] as int,
    (json['child'] as List)
        ?.map(
            (e) => e == null ? null : Child.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MenuDTOListToJson(MenuDTOList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'path': instance.path,
      'sort': instance.sort,
      'parentId': instance.parentId,
      'status': instance.status,
      'version': instance.version,
      'child': instance.child,
    };

Child _$ChildFromJson(Map<String, dynamic> json) {
  return Child(
    json['id'] as int,
    json['name'] as String,
    json['icon'] as String,
    json['type'] as int,
    json['action'] as String,
    json['path'] as String,
    json['sort'] as int,
    json['parentId'] as int,
    json['status'] as int,
    json['version'] as int,
    json['menuType'] as int,
    json['appTipsCount'] as int,
    json['commonType'] as bool,
  );
}

Map<String, dynamic> _$ChildToJson(Child instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'type': instance.type,
      'action': instance.action,
      'path': instance.path,
      'sort': instance.sort,
      'parentId': instance.parentId,
      'status': instance.status,
      'version': instance.version,
      'menuType': instance.menuType,
      'appTipsCount': instance.appTipsCount,
      'commonType': instance.commonType,
    };
