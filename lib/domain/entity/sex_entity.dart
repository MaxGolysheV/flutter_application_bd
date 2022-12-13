class SexEntity {
  late int id;
  final String sex;
  SexEntity({required this.sex});
}

enum SexEnum {
  male(id: 1, sex: 'Мужчина'),
  female(id: 2, sex: 'Женщина');

  const SexEnum({required this.id, required this.sex});

  final String sex;
  final int id;
}
