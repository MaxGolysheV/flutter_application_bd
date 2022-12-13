import 'package:flutter_application_bd/domain/entity/brand_entity.dart';

class ComponentsEntity {
  late int id;
  final String name;
  final double price;
  final BrandEnum idBrand;

  ComponentsEntity(
      {this.id = 0,
      required this.name,
      required this.price,
      required this.idBrand});
}
