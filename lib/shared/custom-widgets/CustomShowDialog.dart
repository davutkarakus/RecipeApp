
import 'package:flutter/material.dart';

Future<void> CustomShowDialog(String text,String title,BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title: Text(title),
        content: Text(text),
        actions: [
          TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("Tamam")),
        ],
      );
    },
  );
}
