//import 'dart:ffi';

import 'package:flutter_application_bd/domain/entity/brand_entity.dart';

class AccessoriesEntity {
  late int id;
  final String name;
  final double price;
  final BrandEnum idBrand;

  AccessoriesEntity(
      {this.id = 0,
      required this.name,
      required this.price, //required this.password
      required this.idBrand});
}
