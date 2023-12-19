// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class FetchCreateOrder extends OrderEvent {
  final String noOrder;
  final String clientName;

  const FetchCreateOrder({
    required this.noOrder,
    required this.clientName,
  });
  @override
  List<Object> get props => [noOrder, clientName];
}

class FetchAllOrder extends OrderEvent {
  const FetchAllOrder();

  @override
  List<Object> get props => [];
}
