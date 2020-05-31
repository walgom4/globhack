import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sstsoft/cons/data_cons.dart';
import 'package:sstsoft/cons/general_cons.dart';
import 'package:sstsoft/controller/principal_widget.dart';
import 'package:sstsoft/model/request/health_registry_model.dart';
import 'package:sstsoft/model/request/schedule_model.dart';
import 'package:sstsoft/model/ws_exception.dart';
import 'package:sstsoft/service/login_service.dart';
import 'package:sstsoft/service/register_service.dart';
import 'package:sstsoft/util/image_picker_util.dart';

class StartJourneyWidget extends StatefulWidget {
  @override
  _StartJourneyWidgetState createState() => _StartJourneyWidgetState();
}

class _StartJourneyWidgetState extends State<StartJourneyWidget> {
  ///Start journey form key validation
  final _formKey = GlobalKey<FormState>();

  ///Health description model
  HealthRegistryModel healthRegistryModel = HealthRegistryModel();

  ///Health register service
  RegisterService registerService = RegisterService();

  ///Login service
  LoginService loginService = LoginService();

  ///Temperature photo
  ImageModel tempPhoto;

  ///WorkArea photo
  ImageModel workArea;

  ///Mask photo
  ImageModel maskPhoto;

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
        title: Text("Inicio de jornada"),
        backgroundColor: Colors.purple,
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
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: 'Indica tu temperatura °C'),
                  onSaved: (newValue) {
                    this.healthRegistryModel.temperature = double.parse(newValue);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Text("Foto termómetro", style: GeneralCons.titleTextStyle),
                    Spacer(),
                    RaisedButton(
                      shape: CircleBorder(),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      color: Colors.purple,
                      onPressed: () async {
                        this.tempPhoto =
                            await ImagePickerUtil.imageOptionsDialogBox(
                                context);
                        this.healthRegistryModel.photoTemperature =
                            await MultipartFile.fromFile(
                                this.tempPhoto.image.path);
                        setState(() {});
                      },
                    )
                  ],
                ),
                Visibility(
                  visible: this.tempPhoto != null,
                  child: Row(
                    children: <Widget>[
                      tempPhoto == null
                          ? Text("Sin imágen seleccionada")
                          : Expanded(
                              child: Image.file(
                                tempPhoto.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Text("Foto de tu área de trabajo",
                        style: GeneralCons.titleTextStyle),
                    Spacer(),
                    RaisedButton(
                      shape: CircleBorder(),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      color: Colors.purple,
                      onPressed: () async {
                        this.workArea =
                            await ImagePickerUtil.imageOptionsDialogBox(
                                context);
                        this.healthRegistryModel.photoWorkspace =
                            await MultipartFile.fromFile(
                                this.workArea.image.path);
                        setState(() {});
                      },
                    )
                  ],
                ),
                Visibility(
                  visible: this.workArea != null,
                  child: Row(
                    children: <Widget>[
                      workArea == null
                          ? Text("Sin imágen seleccionada")
                          : Expanded(
                              child: Image.file(
                                workArea.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Text("Foto tapabocas", style: GeneralCons.titleTextStyle),
                    Spacer(),
                    RaisedButton(
                      shape: CircleBorder(),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      color: Colors.purple,
                      onPressed: () async {
                        this.maskPhoto =
                            await ImagePickerUtil.imageOptionsDialogBox(
                                context);
                        this.healthRegistryModel.photoSelfie =
                            await MultipartFile.fromFile(
                                this.maskPhoto.image.path);
                        setState(() {});
                      },
                    )
                  ],
                ),
                Visibility(
                  visible: this.maskPhoto != null,
                  child: Row(
                    children: <Widget>[
                      maskPhoto == null
                          ? Text("Sin imágen seleccionada")
                          : Expanded(
                              child: Image.file(
                                maskPhoto.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
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
                FlatButton(
                  onPressed: () async {
                    await processStartJourneyForm();
                  },
                  child: Text(
                    "Iniciar mi jornada",
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

  processStartJourneyForm() async {
    try {
      if (this._formKey.currentState.validate()) {
        this._formKey.currentState.save();
        HealthRegistryModel healthStatus = await this
            .registerService
            .registerHealthCondition(healthRegistryModel);
        await this.loginService.startJourney();
        ScheduleModel scheduleModel = ScheduleModel();
        scheduleModel.scheduleFkHealthRegister = healthStatus.id;
        scheduleModel.dateStart = GeneralCons.generalDateTimeFormat.format(DateTime.now());
        scheduleModel = await registerService.registerSchedule(scheduleModel);
        await this.loginService.registerJourneySchedule(scheduleModel);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(
                "Has diligenciado la información, feliz inicio de labores!."),
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
