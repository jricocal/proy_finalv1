//2. Crear el controlador, ruta /domain/use_cases/controllers/status_controller.dart
import 'package:get/get.dart';
import 'package:simple_sample_3/domain/models/user_status.dart';

class StatusController extends GetxController {
  RxList<UserStatus> userStatus = List<UserStatus>.from([]).obs;

  Future<void> sendStatus(Map<String, dynamic> status) async {
    userStatus.add(UserStatus.fromJson(status));
  }

  Future<void> removeStatus(UserStatus status) async {
    userStatus.removeWhere((element) => element == status);
  }
}
