class AgeEntity {
  late int id;
  final String age;

  AgeEntity({required this.age});
}

enum AgeEnum {
  kids(id: 1, age: 'Для детей'),
  adult(id: 2, age: 'Для взрослых'),
  teen(id: 3, age: 'Для подростков');

  const AgeEnum({required this.id, required this.age});

  final String age;
  final int id;
}
