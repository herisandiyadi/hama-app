part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

final class OrderLoading extends OrderState {}

final class OrderFailed extends OrderState {
  final String message;

  const OrderFailed({required this.message});
  @override
  List<Object> get props => [message];
}

final class OrderSuccess extends OrderState {
  final OrderEntity orderEntity;

  const OrderSuccess({required this.orderEntity});
  @override
  List<Object> get props => [orderEntity];
}

final class GetOrderSuccess extends OrderState {
  final ListOrderEntity listOrderEntity;

  const GetOrderSuccess({required this.listOrderEntity});
  @override
  List<Object> get props => [listOrderEntity];
}
