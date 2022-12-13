import 'package:flutter_application_bd/domain/entity/brand_entity.dart';

class Brand extends BrandEntity
{
  Brand({required super.brand});

  Map<String,dynamic> toMap(){
    return {'brand':brand,};
  } 
  factory Brand.toFromMap(Map<String,dynamic> json)
  {
    return Brand(brand: json['brand']);
  }
  
}