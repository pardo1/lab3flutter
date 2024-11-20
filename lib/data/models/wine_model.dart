import 'package:blah2/domain/entities/wine_entity.dart';

class WineModel extends WineModelEntity {
  final String name;
  final String image;
  final int criticScore;
  final String bottleSize;
  final double price; // Prețul poate fi un număr întreg sau un număr cu virgulă, deci double este o alegere bună
  final String type;
  final String country; // Poate vrei să păstrezi și `city`, deci îl putem include și pe acesta
  final String city;

  // Constructor care apelează constructorul clasei părinte WineModelEntity
  WineModel({
    required this.name,
    required this.image,
    required this.criticScore,
    required this.bottleSize,
    required this.price,
    required this.type,
    required this.country,
    required this.city,
  }) : super(
    name: name,
    image: image,
    criticScore: criticScore,
    bottleSize: bottleSize,
    price: price,
    type: type,
    country: country,
    city: city,
  );

  // Constructor care creează un obiect WineModel dintr-un Map
  factory WineModel.fromJson(Map<String, dynamic> json) {
    return WineModel(
      name: json['name'],
      image: json['image'],
      criticScore: json['critic_score'],
      bottleSize: json['bottle_size'],
      price: json['price_usd'].toDouble(), // Convertim la double
      type: json['type'],
      country: json['from']['country'], // Extragem țara din obiectul "from"
      city: json['from']['city'],
    );
  }

  // Constructor care creează un obiect WineModel dintr-o entitate WineModelEntity
  factory WineModel.fromEntity(WineModelEntity entity) => WineModel(
    name: entity.name,
    image: entity.image,
    criticScore: entity.criticScore,
    bottleSize: entity.bottleSize,
    price: entity.price,
    type: entity.type,
    country: entity.country,
    city: entity.city,
  );
}