import 'package:flutter/material.dart';

class ClassPage2 extends StatelessWidget {
  final void Function() ontap;
  final String title ;
  final String content ;

  const ClassPage2({Key? key, required this.ontap, required this.title, required this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex:1,
              child: ListTile(
              title: Text('$title'),
              subtitle: Text('$content'),
              leading: Icon(Icons.campaign),
            )),
          ],
      )),
    );
  }
}
