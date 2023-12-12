import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hama_app/common/style/style.dart';
import 'package:hama_app/common/utils/text_utils.dart';
import 'package:hama_app/presentation/bloc/order/order_bloc.dart';
import 'package:hama_app/presentation/pages/content/order_page.dart';
import 'package:hama_app/presentation/widget/card_order.dart';
import 'package:hama_app/presentation/widget/widget_loading_circle.dart';

class ListOrderPage extends StatefulWidget {
  static const routeName = 'list-order';
  static const path = 'list-order';
  const ListOrderPage({super.key});

  @override
  State<ListOrderPage> createState() => _ListOrderPageState();
}

class _ListOrderPageState extends State<ListOrderPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<OrderBloc>().add(const FetchAllOrder()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('List Order'),
          backgroundColor: greenColor,
        ),
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [whiteColor, whiteColor, whiteColor, greenColor],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: BlocBuilder<OrderBloc, OrderState>(
              builder: (context, state) {
                if (state is OrderLoading) {
                  return const Center(child: CircleProgress());
                }
                if (state is OrderFailed) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                if (state is GetOrderSuccess) {
                  if (state.listOrderEntity.data.isEmpty) {
                    return const Center(
                      child: Text('Data Order Kosong'),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: state.listOrderEntity.data.length,
                      itemBuilder: (context, index) {
                        final data = state.listOrderEntity.data[index];
                        return CardOrder(
                          noOrder: data.noOrder,
                          personel: TextUtils().dateFormatId(data.createdAt),
                          onPressed: () => context.goNamed(OrderPage.routeName,
                              extra: data.noOrder),
                        );
                      },
                    );
                  }
                }
                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
