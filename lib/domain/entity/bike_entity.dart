import 'package:flutter_application_bd/domain/entity/age_entity.dart';
import 'package:flutter_application_bd/domain/entity/brand_entity.dart';
import 'package:flutter_application_bd/domain/entity/type_entity.dart';

class BikeEntity
{
  late int id;
  final String name;
  final double price;
  final TypeEnum idType;
  final AgeEnum idAge;
  final BrandEnum idBrand;

  BikeEntity
  ({
      this.id =0,
      required this.name,
      required this.price,
      required this.idType,
      required this.idAge,
      required this.idBrand
  });
}