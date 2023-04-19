import 'package:assignment_monika/service/api_response.dart';
import 'package:assignment_monika/model/name_model.dart';
import 'package:assignment_monika/service/name_service.dart';

class Repository {
  final NameService _nameService = NameService();

  Future<ApiResponse<List<NameModel>>> getName(String inputName) async {
    return await _nameService.getName(inputName: inputName);
  }
}
