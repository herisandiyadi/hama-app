part of 'personel_bloc.dart';

abstract class PersonelEvent extends Equatable {
  const PersonelEvent();

  @override
  List<Object> get props => [];
}

class FetchAllPersonel extends PersonelEvent {
  final String noOrder;
  const FetchAllPersonel({required this.noOrder});

  @override
  List<Object> get props => [noOrder];
}

class FetchAddPersonel extends PersonelEvent {
  final String namePersonel;
  final String noOrder;
  const FetchAddPersonel({required this.namePersonel, required this.noOrder});
  @override
  List<Object> get props => [namePersonel, noOrder];
}

class FetchDeletePersonel extends PersonelEvent {
  final String id;
  final String noOrder;
  const FetchDeletePersonel({required this.id, required this.noOrder});
  @override
  List<Object> get props => [id, noOrder];
}

class FetchUpdatePersonel extends PersonelEvent {
  final String id;
  final String noOrder;
  final String namePersonel;
  const FetchUpdatePersonel(
      {required this.id, required this.noOrder, required this.namePersonel});
  @override
  List<Object> get props => [id, noOrder];
}
