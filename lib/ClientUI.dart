import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClientUI extends StatefulWidget {
  @override
  _ClientUIState createState() => _ClientUIState();
}

class _ClientUIState extends State<ClientUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a client'),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
