import 'dart:convert';
import 'dart:async';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;

Future<String> getGoogleTranslation(var text, var target) async {
  var _curl = 'https://translation.googleapis.com/language/translate/v2';
  var _apiKey = FlutterConfig.get('GOOGLE_API_KEY');

  //var source = 'kr'; // start language : default = kr
  //var target = target; // translation result language

  //try {} on Exception catch (e) {}

  var response = await http.post(
    Uri.parse(
        '$_curl?target=$target&key=$_apiKey&q=$text'), // json data get response : success code = 200
  );

  if (response.statusCode == 200) {
    var dataJson = jsonDecode(response.body);
    String resultGoogle = dataJson['data']['translations'][0]['translatedText'];
    //return resultGoogle;
    //print(resultGoogle);
    return resultGoogle;
  } else {
    //print(response.statusCode);
    return response.statusCode.toString();
  }
}
