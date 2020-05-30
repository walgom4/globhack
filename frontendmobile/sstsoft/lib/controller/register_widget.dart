import 'package:flutter/material.dart';
import 'package:sstsoft/cons/data_cons.dart';
import 'package:sstsoft/cons/general_cons.dart';

class RegisterWidget extends StatefulWidget {
  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  ///Register form key validation
  final _formKey = GlobalKey<FormState>();

  ///Retain scaffold context to view messages
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ///Change birthdate behaviour
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<Step> stepList = buildStepList();
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Stepper(steps: stepList),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Volver',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  List<Step> buildStepList() {
    ///Register data steps list
    return [
      Step(
        title: const Text("Datos personales"),
        isActive: true,
        state: StepState.complete,
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Apellidos'),
            ),
            DropdownButtonFormField<String>(
                hint: Text("Tipo de documento"),
                items: DataCons.documentTypeList.map<DropdownMenuItem<String>>(
                  (String eachDocument) {
                    return DropdownMenuItem<String>(
                      value: eachDocument,
                      child: Text(eachDocument),
                    );
                  },
                ).toList(),
                onChanged: null),
            TextFormField(
              decoration: InputDecoration(labelText: 'Número documento'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Celular'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Correo electrónico'),
            ),
            TextFormField(
              controller: _dateController,
              onTap: () async {
                DateTime date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: GeneralCons.generalInitialDate,
                    lastDate: DateTime.now());
                if (date == null)
                  _scaffoldKey.currentState
                      .showSnackBar(SnackBar(content: Text('No has seleccionado fecha')));
                else
                  _dateController.text = date.toString();
              },
              decoration: InputDecoration(labelText: 'Fecha nacimiento'),
            ),
            DropdownButtonFormField<String>(
                hint: Text("Género"),
                items: DataCons.genreList.map<DropdownMenuItem<String>>(
                  (String eachGenre) {
                    return DropdownMenuItem<String>(
                      value: eachGenre,
                      child: Text(eachGenre),
                    );
                  },
                ).toList(),
                onChanged: null),
          ],
        ),
      ),
      Step(
          title: const Text("Trabajo"),
          isActive: false,
          state: StepState.editing,
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Cargo'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Unidad/Dependencia'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Jefe inmediato'),
              ),
            ],
          ))
    ];
  }
}
