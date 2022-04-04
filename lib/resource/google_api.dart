import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'api_keys.dart';

Future<String> getGoogleTranslation(var text, var target) async {
  var _curl = 'https://translation.googleapis.com/language/translate/v2';
  //const googleApiKey = googleApiKey;

  //var source = 'kr'; // start language : default = kr
  //var target = target; // translation result language

  //try {} on Exception catch (e) {}

  var response = await http.post(
    Uri.parse(
        '$_curl?target=$target&key=$googleApiKey&q=$text'), // json data get response : success code = 200
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
