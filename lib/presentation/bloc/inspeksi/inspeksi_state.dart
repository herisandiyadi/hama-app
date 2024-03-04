part of 'inspeksi_bloc.dart';

abstract class InspeksiState extends Equatable {
  const InspeksiState();

  @override
  List<Object> get props => [];
}

final class InspeksiInitial extends InspeksiState {}

final class InspeksiLoading extends InspeksiState {}

final class InspeksiFailed extends InspeksiState {
  final String message;

  const InspeksiFailed({required this.message});
  @override
  List<Object> get props => [message];
}

final class AddInspeksiSuccess extends InspeksiState {
  final InspeksiEntity inspeksiEntity;

  const AddInspeksiSuccess({required this.inspeksiEntity});
  @override
  List<Object> get props => [inspeksiEntity];
}

final class GetInspeksiSuccess extends InspeksiState {
  final ListInspeksiEntity listInspeksiEntity;

  const GetInspeksiSuccess({required this.listInspeksiEntity});

  @override
  List<Object> get props => [listInspeksiEntity];
}

final class GenerateInspeksiPDFMonthlySuccess extends InspeksiState {
  final GeneratePDFEntity generatePDFEntity;

  const GenerateInspeksiPDFMonthlySuccess({required this.generatePDFEntity});
  @override
  List<Object> get props => [
        generatePDFEntity,
      ];
}
