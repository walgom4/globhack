import 'package:after_layout/after_layout.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sstsoft/cons/data_cons.dart';
import 'package:sstsoft/cons/general_cons.dart';
import 'package:sstsoft/model/request/health_registry_model.dart';
import 'package:sstsoft/model/request/user_request_model.dart';
import 'package:sstsoft/model/response/generic_data_item_response.dart';
import 'package:sstsoft/service/register_service.dart';
import 'package:sstsoft/util/image_picker_util.dart';

class RegisterWidget extends StatefulWidget {
  static final name = "register";
  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget>
    with AfterLayoutMixin<RegisterWidget> {
  ///Register form key validation
  final _formKeyList = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];

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

  ///Register service
  RegisterService registerService = RegisterService();

  ///Document type list
  List<GenericDataItemResponse> documentTypeList = List();

  ///Gender list
  List<GenericDataItemResponse> genreList = List();

  ///Area list
  List<GenericDataItemResponse> areaList = List();

  HealthRegistryModel healthRegistryModel = HealthRegistryModel();
  UserRequestModel userRequestModel = UserRequestModel();
  ImageModel imageModel;

  @override
  void afterFirstLayout(BuildContext context) async {
    this.documentTypeList = await registerService.findDocumentType();
    this.genreList = await registerService.findAllGender();
    this.areaList = await registerService.findAllArea();

    setState(() {});
  }

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
          content: Form(
            key: this._formKeyList[0],
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nombre'),
                  // validator: (value) => registerTextFormFieldValidator(value),
                  onSaved: (newValue) {
                    this.userRequestModel.name = newValue;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Apellidos'),
                  // validator: (value) => registerTextFormFieldValidator(value),
                  onSaved: (newValue) {
                    this.userRequestModel.lastName = newValue;
                  },
                ),
                DropdownButtonFormField<String>(
                  hint: Text("Tipo de documento"),
                  items: this.documentTypeList.map<DropdownMenuItem<String>>(
                    (GenericDataItemResponse eachDocument) {
                      return DropdownMenuItem<String>(
                        value: eachDocument.id.toString(),
                        child: Text(eachDocument.name),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    this.userRequestModel.idTypeFkUser = int.parse(value);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Número documento'),
                  // validator: (value) => registerTextFormFieldValidator(value),
                  onSaved: (newValue) {
                    this.userRequestModel.identification = newValue;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Celular'),
                  // validator: (value) => registerTextFormFieldValidator(value),
                  onSaved: (newValue) {
                    this.userRequestModel.phone = newValue;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Correo electrónico'),
                  // validator: (value) => registerTextFormFieldValidator(value),
                  onSaved: (newValue) {
                    this.userRequestModel.email = newValue;
                  },
                ),
                TextFormField(
                  controller: _dateController,
                  // validator: (value) => registerTextFormFieldValidator(value),
                  onTap: () async {
                    DateTime date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: GeneralCons.generalInitialDate,
                        lastDate: DateTime.now());
                    if (date == null) {
                      _scaffoldKey.currentState.showSnackBar(
                          SnackBar(content: Text('No has seleccionado fecha')));
                    } else {
                      _dateController.text = date.toString();
                      this.userRequestModel.birthday = _dateController.text;
                    }
                  },
                  decoration: InputDecoration(labelText: 'Fecha nacimiento'),
                ),
                DropdownButtonFormField<String>(
                  hint: Text("Género"),
                  items: this.genreList.map<DropdownMenuItem<String>>(
                    (GenericDataItemResponse eachGenre) {
                      return DropdownMenuItem<String>(
                        value: eachGenre.id.toString(),
                        child: Text(eachGenre.name),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    this.userRequestModel.genderFkUser = value;
                  },
                ),
              ],
            ),
          )),
      Step(
        title: const Text("Trabajo"),
        isActive: true,
        state: StepState.editing,
        content: Form(
          key: this._formKeyList[1],
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Cargo'),
                // validator: (value) => registerTextFormFieldValidator(value),
                onSaved: (newValue) {
                  this.userRequestModel.job = newValue;
                },
              ),
              DropdownButtonFormField<String>(
                hint: Text("Área"),
                items: this.areaList.map<DropdownMenuItem<String>>(
                  (GenericDataItemResponse eachArea) {
                    return DropdownMenuItem<String>(
                      value: eachArea.id.toString(),
                      child: Text(eachArea.name),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                  this.userRequestModel.areaFkUser = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Jefe inmediato'),
                // validator: (value) => registerTextFormFieldValidator(value),
                onSaved: (newValue) {
                  this.userRequestModel.boss = newValue;
                },
              ),
            ],
          ),
        ),
      ),
      Step(
          title: const Text("Estado de salud"),
          isActive: true,
          state: StepState.editing,
          content: Form(
            key: this._formKeyList[2],
            child: Column(
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
                      "Dificultad para respirar",
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
                SizedBox(
                  height: 25,
                ),
                Text(
                  DataCons
                      .healthStatusQuestions["previousHealthConditionQuestion"],
                  style: GeneralCons.generalTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    Text("Si"),
                    Radio<yesNo>(
                      value: yesNo.yes,
                      groupValue: convertValueToYesNo(
                          this.healthRegistryModel.healthCondition),
                      onChanged: (value) {
                        setState(() {
                          this.healthRegistryModel.healthCondition =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                    Text("No"),
                    Radio<yesNo>(
                      value: yesNo.no,
                      groupValue: convertValueToYesNo(
                          this.healthRegistryModel.healthCondition),
                      onChanged: (value) {
                        setState(() {
                          this.imageModel = null;
                          this.healthRegistryModel.medicalFile = null;
                          this.healthRegistryModel.healthCondition =
                              convertYesNoToValue(value);
                        });
                      },
                    ),
                  ],
                ),
                Visibility(
                  visible: this.healthRegistryModel.healthCondition != null &&
                      this.healthRegistryModel.healthCondition,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Adjunte soporte médico",
                        style: GeneralCons.generalTextStyle,
                      ),
                      Spacer(),
                      RaisedButton(
                        shape: CircleBorder(),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        color: Colors.purple,
                        onPressed: () async {
                          this.imageModel =
                              await ImagePickerUtil.imageOptionsDialogBox(
                                  context);
                          this.healthRegistryModel.medicalFile =
                              await MultipartFile.fromFile(
                                  imageModel.image.path);
                          setState(() {});
                        },
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: this.healthRegistryModel.healthCondition != null &&
                      this.healthRegistryModel.healthCondition,
                  child: Row(
                    children: <Widget>[
                      imageModel == null
                          ? Text("Sin imagen seleccionada")
                          : Expanded(
                              child: Image.file(
                                imageModel.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ],
                  ),
                ),
                //TODO realizar componente de imagen
              ],
            ),
          )),
      Step(
        title: const Text("Familia"),
        isActive: true,
        state: StepState.editing,
        content: Form(
          key: this._formKeyList[3],
          child: Column(
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
      ),
      Step(
        title: const Text("Contacto y dirección"),
        isActive: true,
        state: StepState.editing,
        content: Form(
          key: this._formKeyList[4],
          child: Column(
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
                  items:
                      DataCons.transportTypeList.map<DropdownMenuItem<String>>(
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
      ),
      Step(
        title: const Text("Aviso legal"),
        isActive: true,
        state: StepState.editing,
        content: Form(
          key: this._formKeyList[5],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                DataCons
                    .disclaimer, //TODO Relacionar la empresa que corresponde
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
      ),
    ];
  }

  next() {
    if (this._formKeyList[currentStep].currentState.validate()) {
      currentStep + 1 != this.stepList.length
          ? goTo(currentStep + 1)
          : setState(() => complete = true);
    }
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    if (this._formKeyList[currentStep].currentState.validate()) {
      setState(() => currentStep = step);
    }
  }

  String registerTextFormFieldValidator(String value) {
    if (value.isEmpty) {
      return "Diligencie este campo";
    }
    return null;
  }

  List<Widget> returnComboboxYesNoByData(
      {String yesString, String noString, bool data}) {
    return [
      Text(yesString),
      Radio<yesNo>(
        value: yesNo.yes,
        groupValue: convertValueToYesNo(data),
        onChanged: (value) {
          setState(() {
            data = convertYesNoToValue(value);
          });
        },
      ),
      Text(noString),
      Radio<yesNo>(
        value: yesNo.no,
        groupValue: convertValueToYesNo(data),
        onChanged: (value) {
          setState(() {
            data = convertYesNoToValue(value);
          });
        },
      ),
    ];
  }
}
