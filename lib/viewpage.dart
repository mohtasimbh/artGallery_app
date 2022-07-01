import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'ApiDara/Model.dart';

class ViewPage extends StatefulWidget {
  ViewPage({Key? key, this.gModel}) : super(key: key);
  GModel? gModel;
  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.network(
          '${widget.gModel!.downloadUrl}',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
