import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:simple_sample_3/domain/use_cases/controllers/auth_controller.dart';
import 'package:simple_sample_3/domain/use_cases/auth_management.dart';
import 'package:simple_sample_3/domain/use_cases/controllers/conectivity_controller.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onViewSwitch;

  const LoginScreen({Key? key, required this.onViewSwitch}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isObscure = true;
  final controller = Get.find<AuthController>(); //utilizamos el controladors
  final connectivityController = Get.find<
      ConnectivityController>(); //utilizamos el controladors  dee connectividad

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252222),
      body: SafeArea(
        //contenedor  valores y propiedades
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,

          //columna valores y propiedades de  la  columna (hijo del contendedor)
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 110),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // valores y propiedades de  la  imagen (hijo de  la  columna)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 24),
                  child: Image(
                    image: NetworkImage(
                        'https://avatars.githubusercontent.com/u/109951?s=400&v=4'),
                    width: 160,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                  /*Image.asset(
                    'imagen1.png',
                    width: 160,
                    height: 140,
                    fit: BoxFit.cover,
                  ),*/
                ),

                const Spacer(), //un espacio

                /*child: Container( OPCION  PARA  CAMBIAR LA  IMAGEN
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                            ),
                      ),*/
                //container que tiene el email
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 20),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xFFEEEEEE),
                    ),

                    //textform  hijo del container que tiene el email
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 20, 0),
                      child: TextFormField(
                        controller: emailController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                ),

                //container que tiene la contraseña
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 20),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xFFEEEEEE),
                    ),

                    //textform  hijo del container que tiene el email
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 20, 0),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: _isObscure,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                        ),
                      ),
                    ),
                  ),
                ),

                //boton de  login
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child: Material(
                    //Wrap with Material
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    elevation: 1.0,
                    color: Color(0xFF801E48),
                    clipBehavior: Clip.antiAlias, // Add This
                    child: MaterialButton(
                      minWidth: 300.0,
                      height: 55,
                      color: Color(0xFF4A38EC),
                      child: new Text('Log In',
                          style: new TextStyle(
                              fontSize: 16.0, color: Colors.white)),
                      onPressed: () async {
                        if (connectivityController.connected) {
                          var result = await AuthManagement.signIn(
                              email: emailController.text,
                              password: passwordController.text);
                          controller.authenticated = result;
                          // Validamos que el resultado sea falso, para enviarle
                          // Una alerta al usuario diciendo, que los datos
                          // Son errados, usando Get.showSnackbar
                          if (result == false) {
                            Get.showSnackbar(GetBar(
                              message: "Usuario o contraseña incorrecto",
                              duration: const Duration(seconds: 2),
                            ));
                          }
                        } else {
                          Get.showSnackbar(
                            GetBar(
                              message: "No estas conectado a la red.",
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),

                //contacolumna  que redirecciona  al  registro
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                        child: Text(
                          'Don\'t have an account?',
                        ),
                      ),
                      MaterialButton(
                        onPressed: widget.onViewSwitch,
                        minWidth: 140,
                        height: 40,
                        color: Color(0x004B39EF),
                        child: Text('Create Account',
                            style: TextStyle(color: Colors.white)),
                        elevation: 0,
                      )
                    ],
                  ),
                ),

                //boton que redirecciona  a la  contrasena
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child: Material(
                    //Wrap with Material
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    elevation: 1.0,
                    color: Color(0xFF801E48),
                    clipBehavior: Clip.antiAlias, // Add This
                    child: MaterialButton(
                      minWidth: 200.0,
                      height: 55,
                      color: Color(0xFF4A38EC),
                      child: new Text('"Forgot Password?"',
                          style: new TextStyle(
                              fontSize: 14.0, color: Colors.white)),
                      onPressed: () {
                        Get.offNamed('/forgPass');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
