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

  ///Current step index
  int currentStep = 0;

  ///If stepper form is completed
  bool complete = false;

  ///Stepper form list
  List<Step> stepList = List();

  @override
  Widget build(BuildContext context) {
    this.stepList = buildStepList();
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Registro"),
      ),
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Stepper(
              steps: this.stepList,
              currentStep: this.currentStep,
              onStepContinue: next,
              onStepTapped: (step) {
                goTo(step);
              },
              onStepCancel: cancel,
              controlsBuilder: (context, {onStepCancel, onStepContinue}) {
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: onStepCancel,
                      child: const Text('Volver'),
                    ),
                    RaisedButton(
                      onPressed: onStepContinue,
                      child: const Text(
                        'Siguiente',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.purple,
                    ),
                  ],
                );
              },
            ),
            // Positioned(top: 40, left: 0, child: _backButton()),
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
        state: StepState.editing,
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
                  _scaffoldKey.currentState.showSnackBar(
                      SnackBar(content: Text('No has seleccionado fecha')));
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
          isActive: true,
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
          )),
      Step(
        title: const Text("Estado de salud"),
        isActive: true,
        state: StepState.editing,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              DataCons.healthStatusQuestions["symptomQuestion"],
              style: GeneralCons.generalTextStyle,
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Fiebre:",
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
            SizedBox(
              height: 25,
            ),
            Text(
              DataCons.healthStatusQuestions["previousHealthConditionQuestion"],
              style: GeneralCons.generalTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
            Text(
              "Adjunte soporte médico",
              style: GeneralCons.generalTextStyle,
            ),
            //TODO realizar componente de imagen
          ],
        ),
      ),
      Step(
        title: const Text("Familia"),
        isActive: true,
        state: StepState.editing,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              DataCons.healthStatusQuestions["recentlyContactQuestion"],
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
            TextFormField(
              decoration: InputDecoration(labelText: 'Parentesco'),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              DataCons
                  .healthStatusQuestions["elderPeopleEpocConditionQuestion"],
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
            TextFormField(
              decoration: InputDecoration(labelText: 'Parentesco'),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              DataCons.healthStatusQuestions["healthServicesWorkingQuestion"],
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
            TextFormField(
              decoration: InputDecoration(labelText: 'Parentesco'),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
      Step(
        title: const Text("Contacto y dirección"),
        isActive: true,
        state: StepState.editing,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Ingrese un contacto para emergencias",
              style: GeneralCons.generalTextStyle,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nombre completo'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Parentesco'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Telefono'),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "¿Donde vives?",
              style: GeneralCons.generalTextStyle,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Dirección'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Localidad'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Barrio'),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "¿Como te desplazas al lugar de trabajo?",
              style: GeneralCons.generalTextStyle,
            ),
            DropdownButtonFormField<String>(
                hint: Text("Medio de transporte"),
                items: DataCons.transportTypeList.map<DropdownMenuItem<String>>(
                  (String eachDocument) {
                    return DropdownMenuItem<String>(
                      value: eachDocument,
                      child: Text(eachDocument),
                    );
                  },
                ).toList(),
                onChanged: null),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
      Step(
        title: const Text("Aviso legal"),
        isActive: true,
        state: StepState.editing,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              DataCons.disclaimer, //TODO Relacionar la empresa que corresponde
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: <Widget>[
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                Text(
                  "Acepto los términos y condiciones",
                  style: GeneralCons.generalTextStyle,
                )
              ],
            ),
          ],
        ),
      ),
    ];
  }

  next() {
    currentStep + 1 != this.stepList.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }
}
