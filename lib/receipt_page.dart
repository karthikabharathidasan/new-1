import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart'; 

class ReceiptPage extends StatelessWidget {
  final String paymentId;
  final String amountPaid;
  final String paymentDate;

  ReceiptPage({
    required this.paymentId,
    required this.amountPaid,
    required this.paymentDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Receipt'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final pdf = pw.Document();
            final pdfFile = await savePdf(pdf);

            
            if (pdfFile != null) {

              
              OpenFile.open(pdfFile.path);
            }
          },
          child: Text('Generate Receipt'),
        ),
      ),
    );
  }

  Future<File?> savePdf(pw.Document pdf) async {
    final pdfPath = '${DateTime.now().millisecondsSinceEpoch}_receipt.pdf';
    final file = File(pdfPath);

    
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Container(
            padding: pw.EdgeInsets.all(20),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'Payment Receipt',
                  style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
                ),
                pw.SizedBox(height: 20),
                pw.Text('Payment ID: $paymentId'),
                pw.Text('Amount Paid: $amountPaid'),
                pw.Text('Payment Date: $paymentDate'),
              ],
            ),
          );
        },
      ),
    );

    // Save the PDF document to a file
    await file.writeAsBytes(await pdf.save());
    return file;
  }
}
