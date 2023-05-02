import 'package:flutter/material.dart';

class FavoriPage extends StatefulWidget {
  const FavoriPage({Key? key}) : super(key: key);

  @override
  State<FavoriPage> createState() => _FavoriPageState();
}

class _FavoriPageState extends State<FavoriPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Favori"),
      ),
    );
  }
}
