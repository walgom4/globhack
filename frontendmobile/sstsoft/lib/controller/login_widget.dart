import 'dart:io';

import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:sstsoft/util/sharedpreferences.dart';

class LoginWidget extends StatefulWidget {
  static const String name = '/login';

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>
    with AfterLayoutMixin<LoginWidget> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  final Map<String, String> forgotEmail = Map<String, String>();

  final Map<String, String> updatePass = Map<String, String>();

  String usuario = "", clave = "";

  bool _obscureText = true;
  SharedPreferencesUtil sharedPreferencesUtil;
  final usuarioController = TextEditingController();
  final claveController = TextEditingController();

  @override
  void initState() {
    super.initState();
    sharedPreferencesUtil = new SharedPreferencesUtil();
  }

  @override
  Future afterFirstLayout(BuildContext context) async {
    // TODO: implement afterFirstLayout
    usuario = await sharedPreferencesUtil.getString("usuario");
    clave = await sharedPreferencesUtil.getString("clave");
    print(usuario);
    print(clave);
    usuarioController.text = usuario;
    claveController.text = clave;

    if (usuario != null &&
        clave != null &&
        usuario != "" &&
        clave != "" &&
        await sharedPreferencesUtil.getInt("intento") != 1) {
      // await autenticacion.login(usuario, clave).then((value) async {
      //   await sharedPreferencesUtil.setString("usuario", usuario);
      //   await sharedPreferencesUtil.setString("clave", clave);
      //   await sharedPreferencesUtil.setInt("intento", 1);
      //   Navigator.of(context).pushNamedAndRemoveUntil(
      //       SplashWidget.name, (Route<dynamic> route) => false);
      // });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icons/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            topSection,
            Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: usuarioController,
                            onSaved: (value) => null,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "requerido";
                              }
                            },
                            // initialValue: "walgom4@gmail.com",
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "Correo",
                              fillColor: Colors.white,
                              filled: true,
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                          ),
                          TextFormField(
                            controller: claveController,
                            onSaved: (value) => null,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "clave requerida";
                              }
                            },
                            // initialValue: "1wa1b2c3-",
                            keyboardType: TextInputType.text,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  //do something
                                  _obscureText = !_obscureText;
                                  setState(() {});
                                },
                                child: Icon(Icons.remove_red_eye),
                              ),
                              hintText: "Clave",
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                          ),
                          Padding(
                              padding: EdgeInsets.all(5),
                              child: GestureDetector(
                                  child: Text(
                                    "Olvidé mi contraseña",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  onTap: () {
                                    // openUrl(
                                    //     "http://front.avaluapp.com/#!/login");
                                  })),
                          Padding(
                              padding: EdgeInsets.all(5),
                              child: GestureDetector(
                                  child: Text(
                                    "Registrarse",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  onTap: () {
                                    // openUrl(
                                    //     "http://avaluapp.com/registro.html");
                                  })),
                          Padding(
                              padding: EdgeInsets.all(5),
                              child: GestureDetector(
                                  child: Text(
                                    "Necesito soporte",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  onTap: () {
                                    // sendWhatsapp("573103253126", "");
                                  })),
                          Container(
                              width: screenSize.width,
                              height: 100.0,
                              padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
                              child: Builder(
                                builder: (context) => RaisedButton(
                                  color: Colors.blue,
                                  child: Text(
                                    "Ingresar",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  onPressed: () async {},
                                ),
                              )),
                        ],
                      ),
                    ),
                  ]),
            ),
          ]),
        ),
      ),
    );
  }

  final topSection = Container(
    padding: EdgeInsets.fromLTRB(20, 130, 20, 20),
    child: Column(children: [
      Container(),
    ]),
  );

  final formSection = Container(
      padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
      child: Column(children: []));
}
