import 'package:easy_mask/easy_mask.dart';
import 'package:intl/intl.dart';

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

class OrdersModel {
  String? idOrder;
  String? idSeller;
  DateTime? createTime;
  String? name;
  String? cpf;
  String? statusOrder;
  String? statusPayment;
  String? paymentMethod;
  String? total;

  OrdersModel({
    this.idOrder,
    this.idSeller,
    this.createTime,
    this.name,
    this.cpf,
    this.statusOrder,
    this.statusPayment,
    this.paymentMethod,
    this.total,
  });
}

class JsonToOrder {
  static OrdersModel fromJson(dynamic json) {
    return OrdersModel(
      idOrder: json['_id'],
      idSeller: json['seller']['id'],
      createTime: DateTime.parse(json['createdAt']),
      name: json['customer']['name'],
      cpf: json['customer']['doc'].toString(),
      statusOrder: json['status'],
      statusPayment: json['payment']['status'],
      paymentMethod: json['payment']['method'],
      total: json['payment']['amount'].toString(),
    );
  }
}