import 'package:blah2/domain/entities/wine_by_entity.dart';

class WinesByModel extends WinesByModelEntity {
  final String tag;
  final String name;

  // Constructorul care apelează constructorul clasei părinte
  WinesByModel({
    required this.tag,
    required this.name,
  }) : super(tag: tag, name: name);

  // Constructor care creează un obiect WinesByModel dintr-un Map
  factory WinesByModel.fromJson(Map<String, dynamic> json) {
    return WinesByModel(
      tag: json['tag'],
      name: json['name'],
    );
  }

  // Constructor care creează un obiect WinesByModel dintr-o entitate
  factory WinesByModel.fromEntity(WinesByModelEntity entity) => WinesByModel(
    tag: entity.tag,
    name: entity.name,
  );
}