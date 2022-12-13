import 'package:flutter_application_bd/domain/entity/type_entity.dart';

class Type extends TypeEntity
{
  Type({required super.type});

  Map<String,dynamic> toMap(){
    return {'type':type,};
  } 
  factory Type.toFromMap(Map<String,dynamic> json)
  {
    return Type(type: json['type']);
  }
  
}