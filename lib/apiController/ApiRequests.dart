import 'dart:convert';
import 'package:http/http.dart' as http;


typedef successCallBack = void Function(String);
typedef failCallBack = void Function(String);


class ApiRequests {

  postRest(apiUrl, header , body, successCallBack, failCallBack) async {

    Map<String, String> header = {
      'accept': 'text/plain',
      'X-Tenant-Id': 'clearvision',
      'Content-type': 'application/json'
    };
    var request = await http.post(Uri.parse(apiUrl), headers: header, body: json.encode(body));
    if(request.statusCode == 200) {
      successCallBack(request.body);
    }
    else {
      failCallBack(request.body);
    }

  }

}