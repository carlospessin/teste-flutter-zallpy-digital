import 'package:az_proof/app/modules/home/controllers/home_controller.dart';
import 'package:az_proof/app/modules/home/views/widgets/card_item.dart';
import 'package:az_proof/app/routes/app_pages.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TableData extends StatelessWidget {
  TableData({Key? key}) : super(key: key);
  final DataTableSource _data = MyData();
  HomeController controller = Get.find<HomeController>();

  Future<bool> getData() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (c, s) {
        if (s.hasData) {
          return DataTable(data: _data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class DataTable extends StatelessWidget {
  const DataTable({
    Key? key,
    required DataTableSource data,
  })  : _data = data,
        super(key: key);

  final DataTableSource _data;

  @override
  Widget build(BuildContext context) {
    return DataTableTheme(
      data: DataTableThemeData(
        headingRowColor:
            MaterialStateColor.resolveWith((states) => Color(0xFFFE877A)),
        headingTextStyle: TextStyle(color: Colors.white),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: PaginatedDataTable(
          source: _data,
          columns: [
            DataColumn(label: itemColumn('ID do Pedido')),
            DataColumn(label: itemColumn('ID na Loja')),
            DataColumn(label: itemColumn('Criação')),
            DataColumn(label: itemColumn('Nome do cliente')),
            DataColumn(label: itemColumn('CPF/CNPJ do cliente')),
            DataColumn(label: itemColumn('Status do pedido')),
            DataColumn(label: itemColumn('Status do pagamento')),
            DataColumn(label: itemColumn('Método de pagamento')),
            DataColumn(label: itemColumn('Total')),
          ],
          // columnSpacing: 100,
          // horizontalMargin: 10,
          rowsPerPage: 6,
          showCheckboxColumn: false,
        ),
      ),
    );
  }
}

class MyData extends DataTableSource {
  HomeController controller = Get.find<HomeController>();
  DateFormat formatter = DateFormat('dd/MM/yyyy');
  MagicMask maskCpf = MagicMask.buildMask('999.999.999-99');
  MagicMask maskCNPJ = MagicMask.buildMask('99.999.999/9999-99');

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => controller.dataModel.value.orders?.length ?? 6;
  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    final order = controller.dataModel.value.orders![index];

    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(itemCell(order.idOrder)),
        DataCell(itemCell(order.idOrder)),
        DataCell(itemCell('${formatter.format(order.createTime!)}')),
        DataCell(itemCell(order.name)),
        DataCell(itemCell(order.cpf!.length <= 11
            ? maskCpf.getMaskedString(order.cpf.toString())
            : maskCNPJ.getMaskedString(order.cpf.toString()))),
        DataCell(itemCell(statusDoPedido(order.statusOrder))),
        DataCell(itemCell(statusDoPagamento(order.statusPayment))),
        DataCell(itemCell(metodoDePagamento(order.paymentMethod))),
        DataCell(itemCell('R\$ ${order.total.toString()}')),
      ],
    );
  }
}

Text itemCell(item) =>
    Text('${item}', style: TextStyle(color: Color(0xFF59666F)));

Text itemColumn(item) =>
    Text('${item}', style: TextStyle(fontWeight: FontWeight.bold));

statusDoPedido(status) {
  switch (status) {
    case 'paid':
      return 'Pago';
    case 'canceled':
      return 'Cancelado';
    case 'pending':
      return 'Pendente';
    default:
      return 'status não definido';
  }
}

statusDoPagamento(status) {
  switch (status) {
    case 'succeeded':
      return 'Aprovado';
    case 'pending':
      return 'Pendente';
    case 'Aprovada':
      return 'Aprovado';
    default:
      return 'status não definido';
  }
}

metodoDePagamento(status) {
  switch (status) {
    case 'pix':
      return 'Pix';
    case 'PIX':
      return 'Pix';
    case 'credit':
      return 'Crédito à vista';
    case 'credit_installments':
      return 'Crédito à prazo';
    case 'boleto':
      return 'Boleto';
    default:
      return 'status não definido';
  }
}
