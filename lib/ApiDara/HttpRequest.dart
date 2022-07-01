import 'dart:developer';
//import 'package:glarryapp/ApiDara/Model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:sakir_exam_3/ApiDara/Model.dart';

class CustomHttpRequest {
  Future<List<GModel>?> getUsers() async {
    try {
      var url = Uri.parse(
          'https://picsum.photos/v2/list?fbclid=IwAR2qk2kE60PcFr1S3OdDKwH9v6bhfWzmIaByJTvViW2iVnLMtDC4Lg7IyeI');
      var response = await http.get(url);
      headers:
      await CustomHttpRequest();

      if (response.statusCode == 200) {
        List<GModel> _model = GModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
