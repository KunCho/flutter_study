import 'package:json_annotation/json_annotation.dart'; 
  
part 'home_model.g.dart';


@JsonSerializable()
  class HomeModel{

  @JsonKey(name: 'data')
  Data data;

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'message')
  String message;

  HomeModel(this.data,this.code,this.message,);

  factory HomeModel.fromJson(Map<String, dynamic> srcJson) => _$HomeModelFromJson(srcJson);

}

  
@JsonSerializable()
  class Data{

  @JsonKey(name: 'commonAppList')
  List<CommonAppList> commonAppList;

  @JsonKey(name: 'menuDTOList')
  List<MenuDTOList> menuDTOList;

  @JsonKey(name: 'hasTips')
  bool hasTips;

  @JsonKey(name: 'hasPerformance')
  bool hasPerformance;

  Data(this.commonAppList,this.menuDTOList,this.hasTips,this.hasPerformance,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

}

  
@JsonSerializable()
  class CommonAppList {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'action')
  String action;

  @JsonKey(name: 'path')
  String path;

  @JsonKey(name: 'sort')
  int sort;

  @JsonKey(name: 'parentId')
  int parentId;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'version')
  int version;

  @JsonKey(name: 'menuType')
  int menuType;

  @JsonKey(name: 'appTipsCount')
  int appTipsCount;

  @JsonKey(name: 'commonType')
  bool commonType;

  CommonAppList(this.id,this.name,this.icon,this.type,this.action,this.path,this.sort,this.parentId,this.status,this.version,this.menuType,this.appTipsCount,this.commonType,);

  factory CommonAppList.fromJson(Map<String, dynamic> srcJson) => _$CommonAppListFromJson(srcJson);

}

  
@JsonSerializable()
  class MenuDTOList {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'path')
  String path;

  @JsonKey(name: 'sort')
  int sort;

  @JsonKey(name: 'parentId')
  int parentId;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'version')
  int version;

  @JsonKey(name: 'child')
  List<Child> child;

  MenuDTOList(this.id,this.name,this.type,this.path,this.sort,this.parentId,this.status,this.version,this.child,);

  factory MenuDTOList.fromJson(Map<String, dynamic> srcJson) => _$MenuDTOListFromJson(srcJson);

}

  
@JsonSerializable()
  class Child {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'action')
  String action;

  @JsonKey(name: 'path')
  String path;

  @JsonKey(name: 'sort')
  int sort;

  @JsonKey(name: 'parentId')
  int parentId;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'version')
  int version;

  @JsonKey(name: 'menuType')
  int menuType;

  @JsonKey(name: 'appTipsCount')
  int appTipsCount;

  @JsonKey(name: 'commonType')
  bool commonType;

  Child(this.id,this.name,this.icon,this.type,this.action,this.path,this.sort,this.parentId,this.status,this.version,this.menuType,this.appTipsCount,this.commonType,);

  factory Child.fromJson(Map<String, dynamic> srcJson) => _$ChildFromJson(srcJson);

}

  
