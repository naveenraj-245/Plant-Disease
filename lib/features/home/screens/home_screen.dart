import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../scan/screens/capture_screen.dart';
import '../../history/screens/history_screen.dart';
import '../../settings/screens/settings_screen.dart';
import '../../shared/widgets/custom_button.dart';
import '../../scan/screens/results_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const HomeContent(),
      const CaptureScreen(),
      const HistoryScreen(),
      const SettingsScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: 'Scan'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final displayName = user?.displayName ?? 'Naveen Raj A';

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Hello, $displayName!',
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              final parentState = context.findAncestorStateOfType<_HomeScreenState>();
              parentState?._onItemTapped(3); 
            },
            child: const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Scan Your Tree',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Instant AI detection for citrus diseases.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            CustomButton(
              label: 'Start Scanning',
              icon: Icons.camera_alt,
              onPressed: () {
                final parentState = context.findAncestorStateOfType<_HomeScreenState>();
                parentState?._onItemTapped(1); 
              },
            ),
            const SizedBox(height: 40),
            const Text(
              'Recent History',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    color: const Color(0xFFF7F2FA),
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: Colors.grey.shade200),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ResultsScreen()),
                        );
                      },
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.green.shade50,
                          child: const Icon(Icons.eco, color: Colors.green),
                        ),
                      ),
                      title: const Text(
                        'Citrus Canker', 
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87)
                      ),
                      subtitle: const Text(
                        'Analyzed Today', 
                        style: TextStyle(color: Colors.grey, fontSize: 12)
                      ),
                      trailing: const Icon(Icons.chevron_right, color: Colors.black54),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}