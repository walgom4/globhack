import 'package:flutter/material.dart';
import 'package:sstsoft/cons/data_cons.dart';
import 'package:sstsoft/cons/general_cons.dart';

class StartJourneyWidget extends StatefulWidget {
  @override
  _StartJourneyWidgetState createState() => _StartJourneyWidgetState();
}

class _StartJourneyWidgetState extends State<StartJourneyWidget> {
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
      body: Container(
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
                  Radio(
                    value: yesNo.yes,
                    groupValue: yesNo,
                    onChanged: (value) {},
                  ),
                  Text("No"),
                  Radio(
                    value: yesNo.no,
                    groupValue: yesNo,
                    onChanged: (value) {},
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
                  Radio(
                    value: yesNo.yes,
                    groupValue: yesNo,
                    onChanged: (value) {},
                  ),
                  Text("No"),
                  Radio(
                    value: yesNo.no,
                    groupValue: yesNo,
                    onChanged: (value) {},
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
                  Radio(
                    value: yesNo.yes,
                    groupValue: yesNo,
                    onChanged: (value) {},
                  ),
                  Text("No"),
                  Radio(
                    value: yesNo.no,
                    groupValue: yesNo,
                    onChanged: (value) {},
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
                  Radio(
                    value: yesNo.yes,
                    groupValue: yesNo,
                    onChanged: (value) {},
                  ),
                  Text("No"),
                  Radio(
                    value: yesNo.no,
                    groupValue: yesNo,
                    onChanged: (value) {},
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
                  Radio(
                    value: yesNo.yes,
                    groupValue: yesNo,
                    onChanged: (value) {},
                  ),
                  Text("No"),
                  Radio(
                    value: yesNo.no,
                    groupValue: yesNo,
                    onChanged: (value) {},
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
                  Radio(
                    value: yesNo.yes,
                    groupValue: yesNo,
                    onChanged: (value) {},
                  ),
                  Text("No"),
                  Radio(
                    value: yesNo.no,
                    groupValue: yesNo,
                    onChanged: (value) {},
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
                  Radio(
                    value: yesNo.yes,
                    groupValue: yesNo,
                    onChanged: (value) {},
                  ),
                  Text("No"),
                  Radio(
                    value: yesNo.no,
                    groupValue: yesNo,
                    onChanged: (value) {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Dificultad para respirar",
                    style: GeneralCons.generalTextStyle,
                  ),
                  Spacer(),
                  Text("Si"),
                  Radio(
                    value: yesNo.yes,
                    groupValue: yesNo,
                    onChanged: (value) {},
                  ),
                  Text("No"),
                  Radio(
                    value: yesNo.no,
                    groupValue: yesNo,
                    onChanged: (value) {},
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
                  Radio(
                    value: yesNo.yes,
                    groupValue: yesNo,
                    onChanged: (value) {},
                  ),
                  Text("No"),
                  Radio(
                    value: yesNo.no,
                    groupValue: yesNo,
                    onChanged: (value) {},
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
                  Radio(
                    value: yesNo.yes,
                    groupValue: yesNo,
                    onChanged: (value) {},
                  ),
                  Text("No"),
                  Radio(
                    value: yesNo.no,
                    groupValue: yesNo,
                    onChanged: (value) {},
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
                  Radio(
                    value: yesNo.yes,
                    groupValue: yesNo,
                    onChanged: (value) {},
                  ),
                  Text("No"),
                  Radio(
                    value: yesNo.no,
                    groupValue: yesNo,
                    onChanged: (value) {},
                  ),
                ],
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Indica tu temperatura °C'),
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
                    onPressed: () {},
                  )
                ],
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
                    onPressed: () {},
                  )
                ],
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
                    onPressed: () {},
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                DataCons.healthStatusQuestions["recentlyViralContactQuestion"],
                style: GeneralCons.generalTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Si"),
                  Radio(
                    value: yesNo.yes,
                    groupValue: yesNo,
                    onChanged: (value) {},
                  ),
                  Text("No"),
                  Radio(
                    value: yesNo.no,
                    groupValue: yesNo,
                    onChanged: (value) {},
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                onPressed: () {},
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
    );
  }
}
