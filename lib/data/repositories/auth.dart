import 'package:simple_sample_3/domain/repositories/auth_interface.dart';

// Implementamos la interfaz en la clase
class Auth implements AuthInterface {
  // Reescribimos cada uno de los métodos de la interfaz
  // Para el inicio de sesión definimos los valores que por ahora serán válidos
  // Para ingresar a la sesión
  @override
  Future<bool> signIn({required String email, required String password}) async {
    final emailVal = "daanalso@gmail.com" == email;
    final passwordVal = "1067936341" == password;
    return emailVal && passwordVal;
  }

  @override
  Future<bool> signOut() async {
    return true;
  }

  // Para la creación de usuario definimos las condiciones que deben cumplir
  // Las variables de email y password

  @override
  Future<bool> signUp(
      {required String name,
      required String email,
      required String confirmpassword,
      required String password}) async {
    final emailVal = email.contains("@") && email.contains(".co");
    final passwordVal = password.length > 6;
    final conpasswordVal = confirmpassword.length > 6;
    return emailVal && passwordVal && conpasswordVal;
  }
}
