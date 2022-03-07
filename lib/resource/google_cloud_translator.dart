import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';

// ANCHOR get google_cloud_translator method
Future<void> getGoogleTranslation(var text) async {
  var _url = 'https://translation.googleapis.com/language/translate/v2';
  const googleApiKey = 'AIzaSyChjWY1iNZbam8tPLEloVFs8umb-tMViqo';

  //var source = 'kr'; // start language : default = kr
  var target = 'ko'; // translation result language
  var response = await http.post(
    Uri.parse(
        '$_url?target=$target&key=$googleApiKey&q=$text'), // json data get response : success code = 200
  );

  if (response.statusCode == 200) {
    var dataJson = jsonDecode(response.body);
    var result = dataJson['data']['translations'][0]['translatedText'];
    //return result;
    print(result);
  } else {
    print(response.statusCode);
  }
}
