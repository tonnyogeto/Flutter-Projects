import 'package:flutter/material.dart';
import 'package:shif/pages/user_page.dart';
import 'package:shif/pages/hospital_visit_page.dart'; // Import HospitalVisitPage
import 'package:shif/pages/payment_plan_page.dart'; // Import PaymentPlanPage
import 'package:shif/pages/payment_page.dart'; // Import PaymentPage
import 'package:shif/pages/claims_page.dart'; // Import ClaimsPage
import 'package:shif/pages/report_page.dart'; // Import ReportPage

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HospitalVisitPage()),
                    );
                  },
                ),
                TaskButton(
                  label: 'Claims',
                  icon: Icons.receipt_long,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ClaimsPage()),
                    );
                  },
                ),
                TaskButton(
                  label: 'Payment Plan',
                  icon: Icons.payment,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentPlanPage()),
                    );
                  },
                ),
                TaskButton(
                  label: 'Payment',
                  icon: Icons.credit_card,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentPage()),
                    );
                  },
                ),
                TaskButton(
                  label: 'Report',  // Add a button for Report
                  icon: Icons.report,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReportPage()),
                    );
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
