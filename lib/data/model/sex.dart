import 'package:flutter_application_bd/domain/entity/sex_entity.dart';

class Sex extends SexEntity
{
  Sex({required super.sex});

  Map<String,dynamic> toMap(){
    return {'sex':sex,};
  } 
  factory Sex.toFromMap(Map<String,dynamic> json)
  {
    return Sex(sex: json['sex']);
  }
  
}