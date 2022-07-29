import 'package:az_proof/app/data/models/data_model.dart';
import 'package:dio/dio.dart';

class DataProvider {
  final request = Dio();
  final baseUrl = 'http://150.230.64.79:9393/proof';

  Options opt = Options(
    followRedirects: false,
    validateStatus: (status) {
      return status! < 500;
    },
    headers: {'Content-Type': 'application/json'},
  );

  Future getDataDashboard(String token) async {
    opt.headers!['Authorization'] = 'Bearer $token';
    try {
      final response = await request.get(
        '$baseUrl/dashboard',
        options: opt,
      );

      if (response.statusCode == 200) {
        var data = DataModel.fromJson(response.data);

        return data;
      }
    } catch (e) {
      return Exception();
    }
  }
}
