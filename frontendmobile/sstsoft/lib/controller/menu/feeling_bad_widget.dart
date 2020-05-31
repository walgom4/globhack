import 'package:flutter/material.dart';
import 'package:sstsoft/cons/data_cons.dart';
import 'package:sstsoft/cons/general_cons.dart';
import 'package:sstsoft/controller/principal_widget.dart';
import 'package:sstsoft/model/request/health_registry_model.dart';
import 'package:sstsoft/model/ws_exception.dart';
import 'package:sstsoft/service/login_service.dart';
import 'package:sstsoft/service/register_service.dart';

class FeelingBadWidget extends StatefulWidget {
  @override
  _FeelingBadWidgetState createState() => _FeelingBadWidgetState();
}

class _FeelingBadWidgetState extends State<FeelingBadWidget> {
  ///Feeling bad form key validation
  final _formKey = GlobalKey<FormState>();

  ///Health description model
  HealthRegistryModel healthRegistryModel = HealthRegistryModel();

  ///Health register service
  RegisterService registerService = RegisterService();

  ///Login service
  LoginService loginService = LoginService();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Me siento mal"),
        backgroundColor: Colors.red,
      ),
      body: Form(
        key: this._formKey,
        child: Container(
          height: height,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "¿Trabajas desde casa?:",
                      style: GeneralCons.titleTextStyle,
                    ),
                    Spacer(),
                    Text("Si"),
                    Radio<yesNo>(
                      value: yesNo.yes,
                      groupValue:
                          convertValueToYesNo(this.healthRegistryModel.home),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.home =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                    Text("No"),
                    Radio<yesNo>(
                      value: yesNo.no,
                      groupValue:
                          convertValueToYesNo(this.healthRegistryModel.home),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.home =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "¿Has tenido alguno de estos síntomas?:",
                  style: GeneralCons.titleTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Gripe",
                      style: GeneralCons.generalTextStyle,
                    ),
                    Spacer(),
                    Text("Si"),
                    Radio<yesNo>(
                      value: yesNo.yes,
                      groupValue:
                          convertValueToYesNo(this.healthRegistryModel.flu),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.flu =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                    Text("No"),
                    Radio<yesNo>(
                      value: yesNo.no,
                      groupValue:
                          convertValueToYesNo(this.healthRegistryModel.flu),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.flu =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Fiebre",
                      style: GeneralCons.generalTextStyle,
                    ),
                    Spacer(),
                    Text("Si"),
                    Radio<yesNo>(
                      value: yesNo.yes,
                      groupValue:
                          convertValueToYesNo(this.healthRegistryModel.fever),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.fever =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                    Text("No"),
                    Radio<yesNo>(
                      value: yesNo.no,
                      groupValue:
                          convertValueToYesNo(this.healthRegistryModel.fever),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.fever =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Tos",
                      style: GeneralCons.generalTextStyle,
                    ),
                    Spacer(),
                    Text("Si"),
                    Radio<yesNo>(
                      value: yesNo.yes,
                      groupValue:
                          convertValueToYesNo(this.healthRegistryModel.cough),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.cough =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                    Text("No"),
                    Radio<yesNo>(
                      value: yesNo.no,
                      groupValue:
                          convertValueToYesNo(this.healthRegistryModel.cough),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.cough =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Dolor de garganta",
                      style: GeneralCons.generalTextStyle,
                    ),
                    Spacer(),
                    Text("Si"),
                    Radio<yesNo>(
                      value: yesNo.yes,
                      groupValue: convertValueToYesNo(
                          this.healthRegistryModel.soreThroat),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.soreThroat =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                    Text("No"),
                    Radio<yesNo>(
                      value: yesNo.no,
                      groupValue: convertValueToYesNo(
                          this.healthRegistryModel.soreThroat),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.soreThroat =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Congestión nasal",
                      style: GeneralCons.generalTextStyle,
                    ),
                    Spacer(),
                    Text("Si"),
                    Radio<yesNo>(
                      value: yesNo.yes,
                      groupValue: convertValueToYesNo(
                          this.healthRegistryModel.nasalCongestion),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.nasalCongestion =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                    Text("No"),
                    Radio<yesNo>(
                      value: yesNo.no,
                      groupValue: convertValueToYesNo(
                          this.healthRegistryModel.nasalCongestion),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.nasalCongestion =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Fatiga",
                      style: GeneralCons.generalTextStyle,
                    ),
                    Spacer(),
                    Text("Si"),
                    Radio<yesNo>(
                      value: yesNo.yes,
                      groupValue:
                          convertValueToYesNo(this.healthRegistryModel.fatigue),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.fatigue =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                    Text("No"),
                    Radio<yesNo>(
                      value: yesNo.no,
                      groupValue:
                          convertValueToYesNo(this.healthRegistryModel.fatigue),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.fatigue =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Dificultad en respirar",
                      style: GeneralCons.generalTextStyle,
                    ),
                    Spacer(),
                    Text("Si"),
                    Radio<yesNo>(
                      value: yesNo.yes,
                      groupValue: convertValueToYesNo(
                          this.healthRegistryModel.difficultBreathe),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.difficultBreathe =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                    Text("No"),
                    Radio<yesNo>(
                      value: yesNo.no,
                      groupValue: convertValueToYesNo(
                          this.healthRegistryModel.difficultBreathe),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.difficultBreathe =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Dolor muscular",
                      style: GeneralCons.generalTextStyle,
                    ),
                    Spacer(),
                    Text("Si"),
                    Radio<yesNo>(
                      value: yesNo.yes,
                      groupValue: convertValueToYesNo(
                          this.healthRegistryModel.musclePain),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.musclePain =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                    Text("No"),
                    Radio<yesNo>(
                      value: yesNo.no,
                      groupValue: convertValueToYesNo(
                          this.healthRegistryModel.musclePain),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.musclePain =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Diarrea",
                      style: GeneralCons.generalTextStyle,
                    ),
                    Spacer(),
                    Text("Si"),
                    Radio<yesNo>(
                      value: yesNo.yes,
                      groupValue: convertValueToYesNo(
                          this.healthRegistryModel.diarrhea),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.diarrhea =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                    Text("No"),
                    Radio<yesNo>(
                      value: yesNo.no,
                      groupValue: convertValueToYesNo(
                          this.healthRegistryModel.diarrhea),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.diarrhea =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Vómito",
                      style: GeneralCons.generalTextStyle,
                    ),
                    Spacer(),
                    Text("Si"),
                    Radio<yesNo>(
                      value: yesNo.yes,
                      groupValue:
                          convertValueToYesNo(this.healthRegistryModel.threwUp),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.threwUp =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                    Text("No"),
                    Radio<yesNo>(
                      value: yesNo.no,
                      groupValue:
                          convertValueToYesNo(this.healthRegistryModel.threwUp),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.threwUp =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  DataCons
                      .healthStatusQuestions["recentlyViralContactQuestion"],
                  style: GeneralCons.generalTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Si"),
                    Radio<yesNo>(
                      value: yesNo.yes,
                      groupValue:
                          convertValueToYesNo(this.healthRegistryModel.ill),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.ill =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                    Text("No"),
                    Radio<yesNo>(
                      value: yesNo.no,
                      groupValue:
                          convertValueToYesNo(this.healthRegistryModel.ill),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.ill =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Observaciones'),
                  onSaved: (newValue) {
                    this.healthRegistryModel.observations = newValue;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  onPressed: () async {
                    await processFeelingBadForm();
                  },
                  child: Text(
                    "Guardar",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  color: Colors.purple,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> processFeelingBadForm() async {
    try {
      if (this._formKey.currentState.validate()) {
        this._formKey.currentState.save();
        this.healthRegistryModel.bad = true;
        await this.registerService.registerHealthCondition(healthRegistryModel);
        await this.loginService.startJourney();
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text("Has registrado la información."),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      PrincipalWidget.name, (Route<dynamic> route) => false);
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
