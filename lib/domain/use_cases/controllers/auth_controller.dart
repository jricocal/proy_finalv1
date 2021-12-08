// Importamos el paquete get
import 'package:get/get.dart';

// Creamos la clase y extendemos de GetxController
class AuthController extends GetxController {
  // Definimos la variable Observable que cambiará el valor dependiendo de
  // Si el usuario está autenticado o no
  final _authenticated = false.obs;

  // Definimos el método que modificará la variable
  set authenticated(bool state) {
    _authenticated.value = state;
  }

  // Definimos el método get reactivo que notificará
  // inmediatamente que haya un cambio
  RxBool get reactiveAuth => _authenticated;

  // Definimos el método que mostrará el valor de la variable
  bool get authenticated => _authenticated.value;
}
