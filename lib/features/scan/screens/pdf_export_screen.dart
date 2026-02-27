import 'package:flutter/material.dart';

class PdfExportScreen extends StatelessWidget {
  const PdfExportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Export Diagnostic Report', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Report Preview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            const Text('Review your CitrusAI diagnostic document before exporting.', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
            Expanded(
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('CitrusAI Health Report', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                          Text('Oct 24, 2025', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                      const Divider(height: 30),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          color: Colors.green.shade50,
                          child: const Icon(Icons.eco, size: 60, color: Colors.green),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text('Diagnosis: HLB (Citrus Greening)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(color: Colors.red.shade100, borderRadius: BorderRadius.circular(5)),
                        child: const Text('URGENCY: HIGH RISK', style: TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'This plant shows severe signs of Huanglongbing. Immediate removal and treatment are recommended to prevent spread.',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: _buildFileDetails(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.download),
              label: const Text('Save to Device', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.share),
              label: const Text('Share PDF', style: TextStyle(fontSize: 18)),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green,
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

  List<Widget> _buildFileDetails() {
    return [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text('File Name:'), Text('Citrus_Report_Oct24.pdf', style: TextStyle(fontWeight: FontWeight.bold))]),
      const SizedBox(height: 10),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text('File Size:'), Text('2.4 MB', style: TextStyle(fontWeight: FontWeight.bold))]),
      const SizedBox(height: 10),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text('Format:'), Text('PDF Document', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red))]),
    ];
  }
}