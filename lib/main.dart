import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'receipt_page.dart';
import 'upi_payment_screen.dart';
import 'receipt_acknowledgement_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
apiKey: 'AIzaSyAszJMt1n0uZU-ABQspgJRiScqyhNRGRrc',
          appId: '1:380857500926:android:d2ef515d4da367e91451af',
          messagingSenderId: '380857500926',
          projectId: 'qevents-fb143')
    
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UPI Payment & Receipt',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    initialRoute: '/',
      routes: {
        '/': (context) => UpiPaymentScreen(onPaymentSuccess: () {
              Navigator.pushNamed(context, '/receipt_acknowledgement');
            }),
        '/receipt_acknowledgement': (context) => ReceiptAcknowledgementPage(onGenerateReceipt: () {
              Navigator.pushNamed(context, '/receipt');
            }),
        '/receipt': (context) => ReceiptPage(),
      },
    );
  }
}