import 'package:crm_messagerie/app/auth/home.dart';
import 'package:crm_messagerie/components/crud.dart';
import 'package:crm_messagerie/constant/linkapi.dart';
import 'package:crm_messagerie/smallframework/customTextform.dart';
import 'package:flutter/material.dart';
import 'package:crm_messagerie/constant/linkapi.dart';
import 'package:crm_messagerie/components/crud.dart';
import 'dart:convert' ;
class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Crud crud = Crud();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  singUp() async {
  try {
    var response = await crud.postRequest(linkSingin, {
      "name": name.text, "email": email.text});
    if (response != null && response['status'] == "success") {
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
      print("success");
    } else {
      print("Login failed: Invalid response from server");
    }
  } catch (e) {
    print("Login failed: $e");
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(children: [
        CustomTextFormSing(mycontroller: name, hint: "name"),
        CustomTextFormSing(hint: "Email", mycontroller: email),
        MaterialButton(
          onPressed: () async {
          await  singUp();
          },
          child: Text("Login"),
          color: Colors.blue
        )
      ]),
    ));
  }
}
