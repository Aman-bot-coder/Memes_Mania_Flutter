import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'dart:convert';
class FetchMeme{



  static fetchNewMeme() async{
    Response response = await get(Uri.parse("https://meme-api.herokuapp.com/gimme"));
    Map bodyData = jsonDecode(response.body);
    if (kDebugMode) {
      return bodyData["url"];
    }
  }
}