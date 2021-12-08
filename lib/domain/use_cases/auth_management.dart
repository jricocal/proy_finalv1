// Importamos la clase de implementación
import 'package:simple_sample_3/data/repositories/auth.dart';

// Creamos la clase
class AuthManagement {
  // Definimos la clase que importamos como una variable privada _auth
  static final Auth _auth = Auth();

  // Definimos cada uno de los métodos de la implementación
  // Y dentro de un try...catch llamamos a cada uno de los métodos
  // Y retornamos sus respuestas (verdadero o falso) o error

  static Future<bool> signIn(
      {required String email, required String password}) async {
    try {
      return await _auth.signIn(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> signUp({
    required String name,
    required String email,
    required String password,
    required String confirmpassword,
  }) async {
    try {
      return await _auth.signUp(
          name: name,
          email: email,
          password: password,
          confirmpassword: confirmpassword);
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
