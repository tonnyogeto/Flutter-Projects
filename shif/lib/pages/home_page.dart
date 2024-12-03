import 'package:flutter/material.dart';
import 'user_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Task Menu
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TaskButton(
                  label: 'User',
                  icon: Icons.person,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserPage()),
                    );
                  },
                ),
                TaskButton(
                  label: 'Hospital Visit',
                  icon: Icons.local_hospital,
                  onTap: () {
                    // Add navigation to Hospital Visit Page
                  },
                ),
                TaskButton(
                  label: 'Claims',
                  icon: Icons.receipt_long,
                  onTap: () {
                    // Add navigation to Claims Page
                  },
                ),
                TaskButton(
                  label: 'Payment Plan',
                  icon: Icons.payment,
                  onTap: () {
                    // Add navigation to Payment Plan Page
                  },
                ),
                TaskButton(
                  label: 'Payment',
                  icon: Icons.credit_card,
                  onTap: () {
                    // Add navigation to Payment Page
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TaskButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const TaskButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          backgroundColor: Colors.blue.withOpacity(0.8),
        ),
        onPressed: onTap,
        icon: Icon(icon, size: 30),
        label: Text(
          label,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
