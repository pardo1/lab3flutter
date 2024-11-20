import 'package:equatable/equatable.dart';

class WineModelEntity extends Equatable {
  final String name;
  final String image;
  final int criticScore;
  final String bottleSize;
  final double price;
  final String type;
  final String country;
  final String city;

  WineModelEntity({
    required this.name,
    required this.image,
    required this.criticScore,
    required this.bottleSize,
    required this.price,
    required this.type,
    required this.country,
    required this.city,
  });

  @override
  List<Object?> get props => [
    name,
    image,
    criticScore,
    bottleSize,
    price,
    type,
    country,
    city,
  ]; 
}