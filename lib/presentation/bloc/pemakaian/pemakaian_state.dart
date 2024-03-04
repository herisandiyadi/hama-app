part of 'pemakaian_bloc.dart';

abstract class PemakaianState extends Equatable {
  const PemakaianState();

  @override
  List<Object> get props => [];
}

final class PemakaianInitial extends PemakaianState {}

final class PemakaianLoading extends PemakaianState {}

final class PemakaianFailed extends PemakaianState {
  final String message;

  const PemakaianFailed({required this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}

final class AddPemakaianSuccess extends PemakaianState {
  final PemakaianEntity pemakaianEntity;

  const AddPemakaianSuccess({required this.pemakaianEntity});

  @override
  List<Object> get props => [pemakaianEntity];
}

final class GetAllPemakaianSuccess extends PemakaianState {
  final ListPemakaianEntity listPemakaianEntity;

  const GetAllPemakaianSuccess({required this.listPemakaianEntity});

  @override
  List<Object> get props => [listPemakaianEntity];
}

final class GeneratePemakaianPDFMonthlySuccess extends PemakaianState {
  final GeneratePDFEntity generatePDFEntity;

  const GeneratePemakaianPDFMonthlySuccess({required this.generatePDFEntity});
  @override
  List<Object> get props => [
        generatePDFEntity,
      ];
}
