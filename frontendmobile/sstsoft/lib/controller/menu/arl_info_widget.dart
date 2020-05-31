import 'package:after_layout/after_layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sstsoft/cons/general_cons.dart';
import 'package:sstsoft/model/response/entity_response.dart';
import 'package:sstsoft/model/response/resources_response.dart';
import 'package:sstsoft/service/resource_service.dart';

class ArlInfoWidget extends StatefulWidget {
  @override
  _ArlInfoWidgetState createState() => _ArlInfoWidgetState();
}

class _ArlInfoWidgetState extends State<ArlInfoWidget>
    with AfterLayoutMixin<ArlInfoWidget> {
  // info arl
  ResourceService resourceService = ResourceService();
  Entity resources = Entity();

  @override
  void afterFirstLayout(BuildContext context) async {
    this.resources = await resourceService.findARL();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("ARL"),
          backgroundColor: Colors.orange,
        ),
        body: Center(
          child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: resources.image != null ? Column(children: <Widget>[
                CachedNetworkImage(
                  imageUrl: resources.image,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Text(
                  "" + resources.name,
                  style: GeneralCons.titleTextStyle,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "" + resources.address,
                  style: GeneralCons.titleTextStyle,
                ),
                Text(
                  "" + resources.phone,
                  style: GeneralCons.titleTextStyle,
                ),
              ]): Text("cargando")),
        ));
  }
}
