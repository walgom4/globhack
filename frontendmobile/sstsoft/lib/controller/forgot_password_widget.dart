import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sstsoft/cons/general_cons.dart';
import 'package:sstsoft/controller/login_widget.dart';
import 'package:sstsoft/model/request/recovery_password_model.dart';
import 'package:sstsoft/model/ws_exception.dart';
import 'package:sstsoft/service/login_service.dart';
import 'package:sstsoft/util/bezierwidget.dart';

class ForgotPasswordWidget extends StatefulWidget {
  static const String name = '/forgot';

  @override
  _ForgotPasswordWidgetState createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  ///Forgot password form key validation
  final _formKey = GlobalKey<FormState>();

  ///Retain scaffold context to view messages
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ///Recovery password model
  RecoveryPasswordModel recoveryPasswordModel = RecoveryPasswordModel();

  ///Login service reference
  LoginService service = LoginService();

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
        await submitForgotPasswordForm();
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
          'Enviar',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '¿ Ya tienes una cuenta ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Inicia sesión',
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

  Widget _formWidget() {
    return Column(
      children: <Widget>[
        _entryField(
          "Cédula",
          validatorMessage: "Por favor ingresa la cédula",
          value: this.recoveryPasswordModel.email,
          onSaved: (value) {
            recoveryPasswordModel.email = value;
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
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierWidget(),
            ),
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
                      SizedBox(
                        height: 50,
                      ),
                      _formWidget(),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Enviaremos un enlace al email asociado a tú cuenta, para que puedas ingresar de nuevo",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      _submitButton(),
                      SizedBox(height: height * .14),
                      _loginAccountLabel(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  submitForgotPasswordForm() async {
    try {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        await service.recoveryUserPassword(recoveryPasswordModel);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text("Se ha reestablecido la contraseña correctamente."),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      LoginWidget.name, (Route<dynamic> route) => false);
                },
              ),
            ],
          ),
        );
      }
    } on WsException catch (ex) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(
              "Registro incorrecto. compruebe los campos del formulario: ${ex.cause}"),
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
    } catch (ex) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("Registro incorrecto."),
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
