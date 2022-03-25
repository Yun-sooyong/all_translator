import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

const String _cilentId = '';
const String _cilentSecret = '';
const String _contentType = 'application/x-www-form-urlencoded; charset=UTF-8';

// Translator
Future<String> getPapagoTranslation({var text, var target, var source}) async {
  String _curl = 'https://openapi.naver.com/v1/papago/n2mt';

  http.Response response = await http.post(
    Uri.parse(_curl),
    headers: {
      'Content-type': _contentType,
      'X-Naver-Client-Id': _cilentId,
      'X-Naver-Client-Secret': _cilentSecret,
    },
    body: {
      'source': source, // 시작언어
      'target': target, // 타겟언어
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

// Auto language detector
Future<void> pDetectLang(String text) async {
  String _curl = "https://openapi.naver.com/v1/papago/detectLangs";

  http.Response lan = await http.post(
    Uri.parse(_curl),
    headers: {
      'Content-type': _contentType,
      'X-Naver-Client-Id': _cilentId,
      'X-Naver-Client-Secret': _cilentSecret,
    },
    body: {
      'query': text,
    },
  );
  if (lan.statusCode == 200) {
    var dataJson = jsonDecode(lan.body);
    var language = dataJson['langCode'];
  } else {
    print(lan.statusCode);
  }
}
