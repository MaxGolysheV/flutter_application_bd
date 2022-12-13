//import 'package:flutter/cupertino.dart';
import 'package:flutter_application_bd/domain/entity/brand_entity.dart';
import 'package:flutter_application_bd/domain/entity/components_entity.dart';

class Components extends ComponentsEntity
{
  
  Components
  ({
    required super.id,
    required super.name,
    required super.price,
    required super.idBrand,
  });

  Map<String,dynamic> toMap()
  {
    return 
    {
    'name':name,
    'price':price,
    'id_brand':idBrand.id
    };
  }

  factory Components.toFromMap( Map<String,dynamic> json)
  {
    return Components
    (
      id: json['id'] as int,
      name: json['name'],
      price: json['price'], 
      idBrand:  BrandEnum.values
      .firstWhere((element) => element.id == (json['id_brand']as int)),
    );
  }

  
}