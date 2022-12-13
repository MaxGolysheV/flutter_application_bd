//import 'package:flutter/foundation.dart';
import 'package:flutter_application_bd/domain/entity/accessories_entity.dart';
import 'package:flutter_application_bd/domain/entity/brand_entity.dart';

class Accessories extends AccessoriesEntity
{
  Accessories
  ({
    required super.id,
    required super.name,
    required super.price,
    required super.idBrand
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
  
  factory Accessories.toFromMap( Map<String,dynamic> json)
  {
    return Accessories
    (
      id: json['id'] as int,
      name: json['name'],
      price: json['price'] as double,
      idBrand:  BrandEnum.values
      .firstWhere((element) => element.id == (json['id_brand']as int)),
    );
  }


  
}