import 'package:equatable/equatable.dart';

class WinesByModelEntity extends Equatable {
  final String tag;
  final String name;

  WinesByModelEntity({
    required this.tag,
    required this.name
  });

  @override
  List<Object?> get props => [tag, name]; // Suprascrierea metodei `props`
}