import 'package:az_proof/app/data/models/orders.model.dart';

class DataModel {
  String? ordersTotal;
  String? ordersCount;
  String? salesTotal;
  String? salesCount;
  String? averageTicket;
  List<OrdersModel>? orders;

  DataModel({
    this.ordersCount,
    this.ordersTotal,
    this.salesCount,
    this.salesTotal,
    this.averageTicket,
    this.orders,
  });

  DataModel.fromJson(Map<String, dynamic> json) {
    ordersTotal = json["orders_total"].toString();
    ordersCount = json["orders_count"].toString();
    salesTotal = json["sales_total"].toString();
    salesCount = json["sales_count"].toString();
    averageTicket = json["average_ticket"].toString();
    orders = (json["orders"] as List).map(JsonToOrder.fromJson).toList();
  }
}

