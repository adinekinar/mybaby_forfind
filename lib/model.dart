import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ModelResult {
  int pred;

  ModelResult({required this.pred});

  factory ModelResult.createModelResult(Map<int, dynamic> object) {
    return ModelResult(pred: object['prediction']);
  }

  static Future<ModelResult> connectToAPI(int nik, double jk, double bbl,
      double pbl, double bbn, double pbn, int age, double bbu, double zsbbu,
      double pbu, double zspbu, double bbpb, double zsbbpb) async {
    Map<String, String> header = {"Content-type":"application/json"};
    String apiURL = "https://xgboost-api-deta.et.r.appspot.com/";
     http.Response apiResult = await http.post(Uri.parse(apiURL),headers: header,body: {
      "nik": nik,
      "jk": jk,
      "bbl": bbl,
      "pbl": pbl,
      "bb": bbn,
      "pb": pbn,
      "umur": age,
      "bbu": bbu,
      "zsbbu": zsbbu,
      "pbu": pbu,
      "zspbu": zspbu,
      "bbpb": bbpb,
      "zsbbpb": zsbbpb
    }).timeout(const Duration(seconds: 5));
    var jsonObject = json.decode(apiResult.body);

    return ModelResult.createModelResult(jsonObject);
  }
}
