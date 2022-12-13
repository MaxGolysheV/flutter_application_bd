class TypeEntity//класс типа велосипеда: городской, дорожный, горный
{
  late int id;
  final String type;

  TypeEntity({required this.type});
}

enum TypeEnum {
  city(id: 1, type: 'Городской'),
  road(id: 2, type: 'Дорожный'),
  rock(id: 3, type: 'Горный');

  const TypeEnum({
    required this.id, 
    required this.type
  });
  final String type;
  final int id;
}