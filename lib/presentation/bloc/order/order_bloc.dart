import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hama_app/domain/entities/order/list_order_entity.dart';
import 'package:hama_app/domain/entities/order/order_entity.dart';
import 'package:hama_app/domain/usecase/get_all_data_order.dart';
import 'package:hama_app/domain/usecase/get_create_order.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final GetCreateOrder getCreateOrder;
  final GetAllDataOrder getAllDataOrder;
  OrderBloc({required this.getCreateOrder, required this.getAllDataOrder})
      : super(OrderInitial()) {
    on<FetchCreateOrder>((event, emit) async {
      emit(OrderLoading());
      final result = await getCreateOrder.execute(event.noOrder);
      result.fold((failure) {
        emit(OrderFailed(message: failure.message));
      }, (success) {
        emit(OrderSuccess(orderEntity: success));
      });
    });

    on<FetchAllOrder>((event, emit) async {
      emit(OrderLoading());
      final result = await getAllDataOrder.execute();
      result.fold((failure) {
        emit(OrderFailed(message: failure.message));
      }, (success) {
        emit(GetOrderSuccess(listOrderEntity: success));
      });
    });
  }
}
