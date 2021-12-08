import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF252222),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.offNamed('/auth');
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: Colors.white,
            size: 32,
          ),
        ),
        title: Text(
          'Forgot Password',
        ),
        centerTitle: true,
        elevation: 0,
      ),
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
                //container que tiene la confirmacion del correo

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
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Your Email Address',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                ),

                //boton que redirecciona  a la  contrasena
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child: Material(
                    //Wrap with Material
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    elevation: 1.0,
                    color: Color(0xFF4A38EC),
                    clipBehavior: Clip.antiAlias, // Add This
                    child: MaterialButton(
                      minWidth: 200.0,
                      height: 55,
                      color: Color(0xFF4A38EC),
                      child: new Text('Send Reset Link',
                          style: new TextStyle(
                              fontSize: 16.0, color: Colors.white)),
                      onPressed: () {},
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
}
