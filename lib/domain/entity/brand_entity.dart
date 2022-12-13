class BrandEntity {
  late int id;
  final String brand;
  BrandEntity({required this.brand});
}

enum BrandEnum
{
  stels(id:1, brand:'Stels');

  const BrandEnum({
    required this.id, 
    required this.brand
  });
  
  final String brand;
  final int id;
} 