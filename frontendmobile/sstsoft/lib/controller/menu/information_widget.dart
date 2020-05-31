import 'package:after_layout/after_layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sstsoft/model/response/resources_response.dart';
import 'package:sstsoft/service/resource_service.dart';

class InformationWidget extends StatefulWidget {
  @override
  _InformationWidgetState createState() => _InformationWidgetState();
}

class _InformationWidgetState extends State<InformationWidget>
    with AfterLayoutMixin<InformationWidget> {
  ///Current step index
  int currentStep = 0;

  ///If stepper form is completed
  bool complete = false;

  ///Stepper form list
  List<Step> stepList = List();

  ResourceService resourceService = ResourceService();
  Resources resources2 = new Resources();
  Resources resources3 = new Resources();
  Resources resources4 = new Resources();
  Resources resources5 = new Resources();
  Resources resources6 = new Resources();
  Resources resources7 = new Resources();
  Resources resources8 = new Resources();

  buildStepList() {
    this.stepList = [
      Step(
        title: Text(
          resources2.code ?? "",
          overflow: TextOverflow.ellipsis,
        ),
        isActive: true,
        state: StepState.complete,
        content: Column(
          children: <Widget>[
            resources2.image != null
                ? CachedNetworkImage(
                    imageUrl: resources2.image,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )
                : Text("cargando..."),
          ],
        ),
      ),
      Step(
        title: Text(
          resources3.code ?? "",
          overflow: TextOverflow.ellipsis,
        ),
        isActive: true,
        state: StepState.complete,
        content: Column(
          children: <Widget>[
            resources3.image != null
                ? CachedNetworkImage(
                    imageUrl: resources3.image,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )
                : Text("cargando..."),
          ],
        ),
      ),
      Step(
        title: Text(
          resources4.code ?? "",
        ),
        isActive: true,
        state: StepState.complete,
        content: Column(
          children: <Widget>[
            resources4.image != null
                ? CachedNetworkImage(
                    imageUrl: resources4.image,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )
                : Text("cargando..."),
          ],
        ),
      ),
      Step(
        title: Text(
          resources5.code ?? "",
          overflow: TextOverflow.ellipsis,
        ),
        isActive: true,
        state: StepState.complete,
        content: Column(
          children: <Widget>[
            resources5.image != null
                ? CachedNetworkImage(
                    imageUrl: resources5.image,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )
                : Text("cargando..."),
          ],
        ),
      ),
      Step(
        title: Text(
          resources6.code ?? "",
          overflow: TextOverflow.ellipsis,
        ),
        isActive: true,
        state: StepState.complete,
        content: Column(
          children: <Widget>[
            resources6.image != null
                ? CachedNetworkImage(
                    imageUrl: resources6.image,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )
                : Text("cargando..."),
          ],
        ),
      ),
      Step(
        title: Text(
          resources7.code ?? "",
          overflow: TextOverflow.ellipsis,
        ),
        isActive: true,
        state: StepState.complete,
        content: Column(
          children: <Widget>[
            resources7.image != null
                ? CachedNetworkImage(
                    imageUrl: resources7.image,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )
                : Text("cargando..."),
          ],
        ),
      ),
      Step(
        title: Text(
          resources8.code ?? "",
          overflow: TextOverflow.ellipsis,
        ),
        isActive: true,
        state: StepState.complete,
        content: Column(
          children: <Widget>[
            resources8.image != null
                ? CachedNetworkImage(
                    imageUrl: resources8.image,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )
                : Text("cargando..."),
          ],
        ),
      ),
    ];
  }

  next() async {
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

  @override
  void afterFirstLayout(BuildContext context) async {
    resources2 = await resourceService.findCleaningArea();
    resources3 = await resourceService.findClothes();
    resources4 = await resourceService.findShoes();
    resources5 = await resourceService.findGlasses();
    resources6 = await resourceService.findMask();
    resources7 = await resourceService.findGloves();
    resources8 = await resourceService.findSymptoms();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    buildStepList();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Información"),
        backgroundColor: Colors.cyan,
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: Stepper(
            currentStep: this.currentStep,
            onStepContinue: next,
            onStepTapped: (value) {
              goTo(value);
            },
            onStepCancel: cancel,
            steps: stepList,
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
        ),
      ]),
    );
  }
}
