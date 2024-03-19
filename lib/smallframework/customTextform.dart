import 'package:flutter/material.dart';

class CustomTextFormSing extends StatelessWidget {
  final String hint;
  final TextEditingController mycontroller;
  const CustomTextFormSing({Key? key, required this.hint, required this.mycontroller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
