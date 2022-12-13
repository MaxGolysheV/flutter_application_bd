import 'package:flutter_application_bd/domain/entity/age_entity.dart';

class Age extends AgeEntity
{
  Age({required super.age});

  Map<String,dynamic> toMap(){
    return {'age':age,};
  } 
  factory Age.toFromMap(Map<String,dynamic> json)
  {
    return Age(age: json['age']);
  }
  
}