import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

const String _curl = 'https://dapi.kakao.com/v2/translation/translate';
const String _apiKey = 'KakaoAK bc171a62a7f80e662f8c4a2dd82136e6';
const String _contentType = 'application/x-www-form-urlencoded; charset=UTF-8';

Future<String> getKakaoTranslation({var text, var target, var source}) async {
  var response = await http.post(
    Uri.parse(_curl),
    headers: ({
      'Content-Type': _contentType,
      'Authorization': _apiKey,
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

Future<void> kDetectLang(String text) async {
  String _curl = "https://dapi.kakao.com/v3/translation/language/detect";

  http.Response lan = await http.post(Uri.parse(_curl), headers: {
    'Content-Type': _contentType,
    'Authorization': _apiKey,
  }, body: {
    'query': text
  });

  if (lan.statusCode == 200) {
    var dataJson = jsonDecode(lan.body);
    var language = dataJson['language_info'][0]['code'];
  } else {
    print(lan.statusCode);
  }
}
