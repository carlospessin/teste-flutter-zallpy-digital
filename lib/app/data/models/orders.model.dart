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