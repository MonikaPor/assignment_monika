import 'package:assignment_monika/helpers/service_constants.dart';
import 'package:assignment_monika/model/name_model.dart';
import 'package:dio/dio.dart';

class NameService {
  final Dio dio = Dio();

  Future<List<NameModel>> getName({required String inputName}) async {
    Response response =
        await dio.get('${ServiceConstants().baseUrl}/name/$inputName');
    return (response.data as List).map((x) => NameModel.fromJson(x)).toList();
  }
}
