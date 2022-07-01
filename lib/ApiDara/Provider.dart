import 'package:flutter/material.dart';
import 'package:sakir_exam_3/ApiDara/HttpRequest.dart';
//import 'package:glarryapp/ApiDara/Model.dart';
import 'package:provider/provider.dart';

import 'Model.dart';

class DisplayProvider with ChangeNotifier {
  List<GModel> modelList = [];
  late GModel userModel;

  getCategory() async {
    modelList = (await CustomHttpRequest().getUsers())!;
    notifyListeners();
  }
}
