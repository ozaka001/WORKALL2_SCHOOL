import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class ApiProvider {
  ApiProvider();

  String endPoint = 'http://192.168.1.3:8080';

  Future<http.Response> doLogin(String username, String password) async {
    var url = 'http://192.168.1.3:8080/login';

    var body = {
      "username": username,
      "password": password,
    };

    // var connect = await http.post(Uri.parse(_Uri), body: body);
    var response = await http.post(Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode(body));
    return response;
  }

  Future<http.Response> doRegister(
      String username, String password, String fullname) async {
    var url = 'http://192.168.1.3:8080/register';

    var body = {
      "username": username,
      "password": password,
      "avatar": 'http://it.cmtc.ac.th/user.png',
      "fullname": fullname,
    };

    // var connect = await http.post(Uri.parse(_Uri), body: body);
    var response = await http.post(Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode(body));
    return response;
  }
}
