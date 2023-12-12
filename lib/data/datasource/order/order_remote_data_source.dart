import 'dart:convert';

import 'package:hama_app/common/utils/cache_utils.dart';
import 'package:hama_app/common/utils/constants.dart';
import 'package:hama_app/common/utils/exceptions.dart';
import 'package:hama_app/data/models/order/list_order_response.dart';
import 'package:hama_app/data/models/order/order_response.dart';
import 'package:http/http.dart' as http;

abstract class OrderRemoteDataSource {
  Future<ListOrderResponse> getAllOrder();
  Future<OrderResponse> createOrder(String noOrder);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final http.Client client;

  OrderRemoteDataSourceImpl({required this.client});

  @override
  Future<ListOrderResponse> getAllOrder() async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Authorization': '$token',
      'Content-Type': 'application/json',
    };
    final response = await client.get(
      Uri.parse('$baseUrl/api/order/getall'),
      headers: headers,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final jsonResponse = ListOrderResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }

  @override
  Future<OrderResponse> createOrder(String noOrder) async {
    final token = await CacheUtil.getString(cacheToken);
    final headers = {
      'Authorization': '$token',
      'Content-Type': 'application/json'
    };
    final body = jsonEncode({"no_order": noOrder});
    final response = await client.post(
      Uri.parse('$baseUrl/api/order/create'),
      headers: headers,
      body: body,
    );

    final json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      final jsonResponse = OrderResponse.fromJson(json);

      return jsonResponse;
    } else {
      throw MessageException(json['message']);
    }
  }
}
