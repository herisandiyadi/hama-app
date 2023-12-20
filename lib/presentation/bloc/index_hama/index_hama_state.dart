part of 'index_hama_bloc.dart';

abstract class IndexHamaState extends Equatable {
  const IndexHamaState();

  @override
  List<Object> get props => [];
}

final class IndexHamaInitial extends IndexHamaState {}

final class IndexHamaLoading extends IndexHamaState {}

final class IndexHamaFailed extends IndexHamaState {
  final String message;

  const IndexHamaFailed({required this.message});
  @override
  List<Object> get props => [message];
}

final class AddIndexHamaSuccess extends IndexHamaState {
  final IndexHamaEntity indexHamaEntity;

  const AddIndexHamaSuccess({required this.indexHamaEntity});
  @override
  List<Object> get props => [indexHamaEntity];
}

final class GetAllIndexHamaSuccess extends IndexHamaState {
  final ListIndexHamaEntity listIndexHamaEntity;

  const GetAllIndexHamaSuccess({required this.listIndexHamaEntity});

  @override
  List<Object> get props => [listIndexHamaEntity];
}
