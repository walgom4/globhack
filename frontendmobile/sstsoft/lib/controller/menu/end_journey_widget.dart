import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:sstsoft/cons/general_cons.dart';
import 'package:sstsoft/model/request/schedule_model.dart';
import 'package:sstsoft/model/ws_exception.dart';
import 'package:sstsoft/service/login_service.dart';
import 'package:sstsoft/service/register_service.dart';

import '../principal_widget.dart';

class EndJourneyWidget extends StatefulWidget {
  @override
  _EndJourneyWidgetState createState() => _EndJourneyWidgetState();
}

class _EndJourneyWidgetState extends State<EndJourneyWidget>
    with AfterLayoutMixin<EndJourneyWidget> {
  ///Schedule information of previous medical report
  ScheduleModel scheduleModel = ScheduleModel();

  ///Login service reference
  LoginService loginService = LoginService();

  ///Register service reference
  RegisterService registerService = RegisterService();

  @override
  void afterFirstLayout(BuildContext context) async {
    scheduleModel = await loginService.returnRegisteredJourneySchedule();
    scheduleModel.dateEnd =
        GeneralCons.generalDateTimeFormat.format(DateTime.now());
    setState(() {});
  }

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
        title: Text("Fin de jornada"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        height: height,
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.width / 2,
              ),
              Text(
                "Tu hora de salida es: ${scheduleModel.dateEnd}",
                style: GeneralCons.titleTextStyle,
              ),
              Text(
                "¿Estás seguro de finalizar tu jornada?",
                style: GeneralCons.generalTextStyle,
              ),
              SizedBox(height: 40),
              RaisedButton(
                child: Text("Finalizar jornada"),
                textColor: Colors.white,
                color: Colors.purple,
                onPressed: () async {
                  await finishJourney();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  finishJourney() async {
    try {
      scheduleModel = await registerService.updateSchedule(scheduleModel);
      await this.loginService.deleteJourneySchedule();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("Has finalizado tu jornada, ¡Qué descanses!"),
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
