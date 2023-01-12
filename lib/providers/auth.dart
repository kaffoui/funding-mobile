
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart'  as http;
import 'package:flutter/cupertino.dart';
import 'package:lisocash/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  DateTime? _duration;
  Timer? _authTimer;


  
  Future<void> register(String nom, String prenoms, String email, String telephone, String ville, String codePostal, String indicatif, String password) async {
    var url = "$apiEndPoint/register";

    // String error = "";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers:  {
          'Content-Type': 'application/json',
          'Accept':'application/json',
        },
        body: {
          "nom": nom,
          "prenoms": prenoms,
          "email": email,
          "telephone": telephone,
          "ville": ville,
          "code_postal": codePostal,
          "indicatif": indicatif,
          "password": password,
        }

      );

      debugPrint("####### ${response.body}");
      
      final responseData = json.decode(response.body);
      debugPrint("####### $responseData");

      // if (response.statusCode == 201) {
      //   // SharedPreferences
      //   final prefs = await SharedPreferences.getInstance();
        
      //   if (responseData["status"] == true) {
      //     var data = responseData["data"];

      //     _scemUser = ScemUser.fromJson(data["user"]);
      //     _token = data["token"];

      //     final userData = json.encode({
      //       "token": _token,
      //       "scemUser": scemUserToJson(_scemUser)
      //       //school
      //     });

      //     await prefs.setString("userData", userData);

      //     error = "success";
      //   }
        
      // } else {
      //   debugPrint("###### ${responseData["message"]}");
      //    error = "error";
      // }

    } catch (e) {
      debugPrint("###### e $e");
    }

    // return error;

  }
}