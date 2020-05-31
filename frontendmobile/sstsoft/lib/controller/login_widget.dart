import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sstsoft/cons/general_cons.dart';
import 'package:sstsoft/controller/forgot_password_widget.dart';
import 'package:sstsoft/controller/register_widget.dart';
import 'package:sstsoft/controller/splash_widget.dart';
import 'package:sstsoft/model/request/user_model.dart';
import 'package:sstsoft/service/login_service.dart';
import 'package:sstsoft/util/bezierwidget.dart';

class LoginWidget extends StatefulWidget {
  static final name = "login";
  LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  ///Login form key validation
  final _formKey = GlobalKey<FormState>();

  ///Retain scaffold context to view messages
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ////Login user representation
  final UserModel user = UserModel();

  final String title = "SSTSoft";

  Widget _entryField(String title,
      {bool isPassword = false,
      String validatorMessage = "Por favor ingresa el campo.",
      String value,
      void Function(String) onSaved}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return validatorMessage;
              }
              return null;
            },
            onSaved: onSaved,
            initialValue: value,
            obscureText: isPassword,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true),
          ),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () async {
        await submitLogin();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: GeneralCons.degradeColor)),
        child: Text(
          'Iniciar sesión',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () async {
        await goToRegister();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '¿ No tienes una cuenta ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Regístrate',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'sst',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: GeneralCons.baseColor,
          ),
          children: [
            TextSpan(
              text: 'soft',
              style: TextStyle(color: GeneralCons.secondaryColor, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField(
          "Número de documento",
          validatorMessage: "Ingresa el número de documento",
          value: user.username,
          onSaved: (value) {
            this.user.username = value;
          },
        ),
        _entryField(
          "Contraseña",
          isPassword: true,
          validatorMessage: "Ingresa la contraseña",
          value: user.password,
          onSaved: (value) {
            this.user.password = value;
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: -height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierWidget()),
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: height * .2),
                        _title(),
                        SizedBox(height: 50),
                        _emailPasswordWidget(),
                        SizedBox(height: 20),
                        _submitButton(),
                        GestureDetector(
                          onTap: () async {
                            await goToForgotPassword();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.centerRight,
                            child: Text('Olvidé la contraseña',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                          ),
                        ),
                        _divider(),
                        SizedBox(height: height * .055),
                        _createAccountLabel(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  submitLogin() async {
    if (_formKey.currentState.validate()) {
      try {
        LoginService service = new LoginService();
        _scaffoldKey.currentState
            .showSnackBar(SnackBar(content: Text('Iniciando sesión')));
        _formKey.currentState.save();
        await service.loginUser(user);
        Navigator.of(context).pushNamedAndRemoveUntil(
            SplashWidget.name, (Route<dynamic> route) => false);
      } catch (ex) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text("Inicio de sesión incorrecto."),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
    }
  }

  goToRegister() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterWidget()));
  }

  goToForgotPassword() async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ForgotPasswordWidget()));
  }
}
