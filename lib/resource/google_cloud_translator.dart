import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

// ANCHOR get google_cloud_translator method
/// TODO target 언어를 받을 변수 생성, mapping
/// TODO try catch 사용

String res = '';

// ANCHOR Google
Future<String> getGoogleTranslation(var text, var target) async {
  var _curl = 'https://translation.googleapis.com/language/translate/v2';
  const googleApiKey = 'AIzaSyChjWY1iNZbam8tPLEloVFs8umb-tMViqo';

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

// ANCHOR papago get language
// Future<void> getLanguage_papago() async {
//   String _cilentId = 'kXhRuAdMvx3cFgUPnyyW';
//   String _cilentSecret = 'BdNwvhe92K';
//   String _curl = 'https://openapi.naver.com/v1/papago/n2mt';
//   String _contentType = 'application/x-www-form-urlencoded; charset=UTF-8';
// }

// ANCHOR Papago
Future<String> getPapagoTranslation({var text, var target, var source}) async {
  String _cilentId = 'kXhRuAdMvx3cFgUPnyyW';
  String _cilentSecret = 'BdNwvhe92K';
  String _curl = 'https://openapi.naver.com/v1/papago/n2mt';
  String _contentType = 'application/x-www-form-urlencoded; charset=UTF-8';

  http.Response response = await http.post(
    Uri.parse(_curl),
    headers: {
      'Content-type': _contentType,
      'X-Naver-Client-Id': _cilentId,
      'X-Naver-Client-Secret': _cilentSecret,
    },
    body: {
      'source': source,
      'target': target,
      'text': text,
    },
  );
  if (response.statusCode == 200) {
    var dataJson = jsonDecode(response.body);
    String resultPapago = dataJson['message']['result']['translatedText'];

    // TODO return reseultPapago
    //print(resultPapago);
    return resultPapago;
  } else {
    //print(response.statusCode);
    return response.statusCode.toString();
  }
}

// ANCHOR Kakao
// NOTE 카카오만 한국어 코드가 kr 로 사용됨 / 나머지는 ko
Future<String> getKakaoTranslation({var text, var target, var source}) async {
  String _curl = 'https://dapi.kakao.com/v2/translation/translate';
  String _apiKey = 'bc171a62a7f80e662f8c4a2dd82136e6';

  var response = await http.post(
    Uri.parse(_curl),
    headers: ({
      'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      'Authorization': 'KakaoAK $_apiKey',
    }),
    body: ({
      'src_lang': source,
      'target_lang': target,
      'query': text,
    }),
  );

  if (response.statusCode == 200) {
    var dataJson = jsonDecode(response.body);
    String resultKakao = dataJson['translated_text']
        .toString()
        .replaceAll('[', '')
        .replaceAll(']', '');

    //print(resultKakao);
    return resultKakao;
  } else {
    return response.statusCode.toString();
  }
}
