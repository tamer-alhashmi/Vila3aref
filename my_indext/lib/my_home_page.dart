import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:  const Text('My Widget Index')),
        // body:  SingleChildScrollView(
    // body:  SingleChildScrollView(
    //       scrollDirection: Axis.horizontal,
    //       child: Row(
    //         children: [
    //           Container(height: 100, width: 100, color: Colors.blue[50]),
    //           Container(height: 100, width: 100, color: Colors.blue[100]),
    //           Container(height: 100, width: 100, color: Colors.blue[200]),
    //           Container(height: 100, width: 100, color: Colors.blue[300]),
    //           Container(height: 100, width: 100, color: Colors.blue[400]),
    //           Container(height: 100, width: 100, color: Colors.blue[500]),
    //           Container(height: 100, width: 100, color: Colors.blue[600]),
    //           Container(height: 100, width: 100, color: Colors.blue[700]),
    //           Container(height: 100, width: 100, color: Colors.blue[800]),
    //           Container(height: 100, width: 100, color: Colors.blue[900]),
    //         ],
    //       ),
    //     ),

        body: Wrap(
          children: [
            Container(height: 100, width: 100, color: Colors.blue[50]),
            Container(height: 100, width: 100, color: Colors.blue[100]),
            Container(height: 100, width: 100, color: Colors.blue[200]),
            Container(height: 100, width: 100, color: Colors.blue[300]),
            Container(height: 100, width: 100, color: Colors.blue[400]),
            Container(height: 100, width: 100, color: Colors.blue[500]),
            Container(height: 100, width: 100, color: Colors.blue[600]),
            Container(height: 100, width: 100, color: Colors.blue[700]),
            Container(height: 100, width: 100, color: Colors.blue[800]),
            Container(height: 100, width: 100, color: Colors.blue[900]),
          ],
        ),
      ),
    );
  }
}
