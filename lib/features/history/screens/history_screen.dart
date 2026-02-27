import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Scan History', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.more_horiz, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('All Plant', true),
                  _buildFilterChip('Healthy', false),
                  _buildFilterChip('Diseased', false),
                  _buildFilterChip('Recent', false),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  const Text('Today', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey)),
                  const SizedBox(height: 10),
                  _buildHistoryCard('Citrus Canker', 'Oct 24, 2025 • 03:45 PM', 'High Risk', Colors.red, true),
                  _buildHistoryCard('Healthy Leaf', 'Oct 24, 2025 • 10:12 AM', 'Safe', Colors.green, false),
                  const SizedBox(height: 20),
                  const Text('Yesterday', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey)),
                  const SizedBox(height: 10),
                  _buildHistoryCard('Greening Disease', 'Oct 23, 2025 • 04:20 PM', 'High Risk', Colors.red, true),
                  _buildHistoryCard('Melanose', 'Oct 23, 2025 • 09:15 AM', 'High Risk', Colors.red, true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: ChoiceChip(
        label: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
        selected: isSelected,
        selectedColor: Colors.green,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: isSelected ? Colors.green : Colors.grey.shade300),
        ),
        onSelected: (bool selected) {},
      ),
    );
  }

  Widget _buildHistoryCard(String title, String date, String status, Color statusColor, bool isDiseased) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 60,
                height: 60,
                color: isDiseased ? Colors.red.shade50 : Colors.green.shade50,
                child: Icon(Icons.eco, color: isDiseased ? Colors.red : Colors.green),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 5),
                  Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                status,
                style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}