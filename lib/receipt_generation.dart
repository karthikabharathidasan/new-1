// Inside your receipt_generation.dart file

import 'package:firebase_core/firebase_core.dart';

Future<String> generateReceipt(String userId) async {
  // Connect to the database
  final database = await openDatabase('your_database.db');                                                                                                                                                          base('your_database.db');

  // Query payment details for the specified user
  final List<Map<String, dynamic>> payments = await database.query('payments', where: 'user_id = ?', whereArgs: [userId]);

  // Format payment details into a receipt
  String receiptContent = '';
  for (var payment in payments) {
    receiptContent += 'Payment ID: ${payment['payment_id']}\n';
    receiptContent += 'Payee Name: ${payment['payee_name']}\n';
    receiptContent += 'UPI ID: ${payment['upi_id']}\n';
    receiptContent += 'Amount: ${payment['amount']}\n\n';
  }

  return receiptContent;
}
