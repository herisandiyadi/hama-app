import 'package:equatable/equatable.dart';

class ListPersonelEntity extends Equatable {
  final bool success;
  final List<PersonalEntity> data;

  const ListPersonelEntity({required this.success, required this.data});

  @override
  List<Object?> get props => [
        success,
        data,
      ];
}

class PersonalEntity extends Equatable {
  final int id;
  final String name;
  final String noOrder;
  final DateTime updatedAt;
  final DateTime createdAt;

  const PersonalEntity({
    required this.id,
    required this.name,
    required this.noOrder,
    required this.updatedAt,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        noOrder,
        updatedAt,
        createdAt,
      ];
}
