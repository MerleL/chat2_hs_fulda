import 'dart:convert';
import 'package:http/http.dart' as http;

// https://flutter.dev/docs/cookbook/networking/fetch-data
// https://pub.dev/packages/http

class Communication {
  static Future<String> accSearch() async {
    http.Response response =
        await http.get(Uri.http('192.168.31.26:80', '/acc/search'));
    String result = utf8.decode(response.bodyBytes, allowMalformed: true);
    return result;
  }

  static Future<String> hello(String groupID, String name) async {
    http.Response response =
        await http.get(Uri.http('192.168.31.26:80', '/fachbereich/studiengang/semester/${groupID}/hello/${name}'));
    String result = utf8.decode(response.bodyBytes, allowMalformed: true);
    return result;
  }
}
