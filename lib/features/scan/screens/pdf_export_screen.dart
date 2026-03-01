import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfExportScreen extends StatelessWidget {
  const PdfExportScreen({super.key});

  // Generates the actual PDF document
  Future<pw.Document> _generatePdf() async {
    final pdf = pw.Document();
    
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('CitrusAI Health Report', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold, color: PdfColors.green)),
              pw.SizedBox(height: 10),
              pw.Text('Date: Oct 24, 2025', style: const pw.TextStyle(fontSize: 14, color: PdfColors.grey)),
              pw.Divider(),
              pw.SizedBox(height: 20),
              pw.Text('Diagnosis: HLB (Citrus Greening)', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text('URGENCY: HIGH RISK', style: pw.TextStyle(fontSize: 14, color: PdfColors.red, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text('This plant shows severe signs of Huanglongbing. Immediate removal and treatment are recommended to prevent spread.', style: const pw.TextStyle(fontSize: 14)),
            ],
          );
        },
      ),
    );
    return pdf;
  }

  // Opens the device's save/print dialog
  void _savePdf() async {
    final pdf = await _generatePdf();
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
      name: 'Citrus_Report_Oct24.pdf',
    );
  }

  // Opens the device's share menu
  void _sharePdf() async {
    final pdf = await _generatePdf();
    await Printing.sharePdf(
      bytes: await pdf.save(),
      filename: 'Citrus_Report_Oct24.pdf',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Export Diagnostic Report', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Report Preview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            const Text('Review your CitrusAI diagnostic document before exporting.', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
            
            // Preview Card
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, 
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('CitrusAI Health Report', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                      Text('Oct 24, 2025', style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                  const Divider(),
                  Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.eco, size: 50, color: Colors.green),
                  ),
                  const SizedBox(height: 15),
                  const Text('Diagnosis: HLB (Citrus Greening)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: Colors.red.shade100,
                    child: const Text('URGENCY: HIGH RISK', style: TextStyle(color: Colors.red, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'This plant shows severe signs of Huanglongbing. Immediate removal and treatment are recommended to prevent spread.',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            // File Details
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  _buildDetailRow('File Name:', 'Citrus_Report_Oct24.pdf'),
                  const SizedBox(height: 10),
                  _buildDetailRow('File Size:', '12 KB'),
                  const SizedBox(height: 10),
                  _buildDetailRow('Format:', 'PDF Document', valueColor: Colors.red),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _savePdf, // Linked to save function
              icon: const Icon(Icons.download),
              label: const Text('Save to Device'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: _sharePdf, // Linked to share function
              icon: const Icon(Icons.share, color: Colors.green),
              label: const Text('Share PDF', style: TextStyle(color: Colors.green)),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.green),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        Text(value, style: TextStyle(fontWeight: FontWeight.bold, color: valueColor ?? Colors.black)),
      ],
    );
  }
}