part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class FetchCreateOrder extends OrderEvent {
  final String noOrder;

  const FetchCreateOrder({required this.noOrder});
  @override
  List<Object> get props => [noOrder];
}

class FetchAllOrder extends OrderEvent {
  const FetchAllOrder();

  @override
  List<Object> get props => [];
}
