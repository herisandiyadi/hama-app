part of 'absen_bloc.dart';

abstract class AbsenState extends Equatable {
  const AbsenState();

  @override
  List<Object> get props => [];
}

final class AbsenInitial extends AbsenState {}

final class AbsenLoading extends AbsenState {}

final class AbsenFailed extends AbsenState {
  final String message;

  const AbsenFailed({required this.message});
  @override
  List<Object> get props => [message];
}

final class AddAbsenSuccess extends AbsenState {
  final String message;

  const AddAbsenSuccess({required this.message});
  @override
  List<Object> get props => [message];
}

final class GetAbsenSuccess extends AbsenState {
  final DataAbsenEntity dataAbsenEntity;

  const GetAbsenSuccess({required this.dataAbsenEntity});
  @override
  List<Object> get props => [dataAbsenEntity];
}

final class GenerateAbsenPDFMonthlySuccess extends AbsenState {
  final GeneratePDFEntity generatePDFEntity;

  const GenerateAbsenPDFMonthlySuccess({required this.generatePDFEntity});
  @override
  List<Object> get props => [
        generatePDFEntity,
      ];
}
