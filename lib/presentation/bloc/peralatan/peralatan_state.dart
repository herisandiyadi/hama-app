part of 'peralatan_bloc.dart';

abstract class PeralatanState extends Equatable {
  const PeralatanState();

  @override
  List<Object> get props => [];
}

final class PeralatanInitial extends PeralatanState {}

final class PeralatanLoading extends PeralatanState {}

final class PeralatanFailed extends PeralatanState {
  final String message;

  const PeralatanFailed({required this.message});
  @override
  List<Object> get props => [message];
}

final class AddPeralatanSuccess extends PeralatanState {
  final PeralatanEntity peralatanEntity;

  const AddPeralatanSuccess({required this.peralatanEntity});
  @override
  List<Object> get props => [peralatanEntity];
}

final class GetALlPeralatanSuccess extends PeralatanState {
  final ListPeralatanEntity listPeralatanEntity;

  const GetALlPeralatanSuccess({required this.listPeralatanEntity});
  @override
  List<Object> get props => [listPeralatanEntity];
}

final class GeneratePeralatanPDFMonthlySuccess extends PeralatanState {
  final GeneratePDFEntity generatePDFEntity;

  const GeneratePeralatanPDFMonthlySuccess({required this.generatePDFEntity});
  @override
  List<Object> get props => [
        generatePDFEntity,
      ];
}
