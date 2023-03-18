import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  Network(this.url);
  final String url;

  Future getData() async {
    http.Response resp = await http.get(Uri.parse(url));
    print('\n\n');

    if (resp.statusCode == 200) {
      String dataFromApi = resp.body;

      return jsonDecode(dataFromApi);
    } else {
      print(resp.statusCode);
    }
  }
}



//'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'   api

//ddc479a85da2f910a61f86da5f28c3b2