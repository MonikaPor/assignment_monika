import 'package:assignment_monika/helpers/service_constants.dart';
import 'package:assignment_monika/service/api_response.dart';
import 'package:assignment_monika/model/name_model.dart';
import 'package:dio/dio.dart';

class NameService {
  final Dio? mockDio;

  NameService({this.mockDio});

  late Dio dio = mockDio ?? Dio();

  Future<ApiResponse<List<NameModel>>> getName(
      {required String inputName}) async {
    Response response =
        await dio.get('${ServiceConstants().baseUrl}/name/$inputName');
    if (response.statusCode == 200) {
      return ApiResponse.completed(
          (response.data as List).map((x) => NameModel.fromJson(x)).toList());
    } else {
      return ApiResponse.error(DioError(
        type: DioErrorType.unknown,
        requestOptions: RequestOptions(),
      ));
    }
  }
}
