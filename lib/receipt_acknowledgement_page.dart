import 'package:flutter/material.dart';


class ReceiptAcknowledgementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Successful'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Icon(
          Icons.check_circle,
          color: Colors.blue,
          size: 100,
        ),
      ),
    );
  }
}
