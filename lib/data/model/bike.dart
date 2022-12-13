import 'package:flutter_application_bd/domain/entity/age_entity.dart';
import 'package:flutter_application_bd/domain/entity/bike_entity.dart';
import 'package:flutter_application_bd/domain/entity/brand_entity.dart';
import 'package:flutter_application_bd/domain/entity/type_entity.dart';

class Bike extends BikeEntity
{
  Bike
  ({
    required super.id,
    required super.name,
    required super.price, 
    required super.idType, 
    required super.idAge, 
    required super.idBrand
  });

  Map<String,dynamic> toMap()
  {
    return 
    {
    'name':name,
    'price':price,
    'id_type':idType.id,
    'id_age':idAge.id,
    'id_brand':idBrand.id
    };
  }

  factory Bike.toFromMap( Map<String,dynamic> json)
  {
    return Bike
    (
      id: json['id'] as int,
      name: json['name'],
      price: json['price'] as double, 
      idType:  TypeEnum.values
      .firstWhere((element) => element.id == (json['id_type']as int)),
      idAge:  AgeEnum.values
      .firstWhere((element) => element.id == (json['id_age']as int)),
      idBrand:  BrandEnum.values
      .firstWhere((element) => element.id == (json['id_brand']as int)),
      
    );
  }


  
}