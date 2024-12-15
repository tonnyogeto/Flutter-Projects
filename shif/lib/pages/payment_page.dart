import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  void navigateToCreditCard(BuildContext context) {
    // Navigate to Add Credit/Debit Card Page or implement the logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Navigating to Add Credit/Debit Card')),
    );
  }

  void navigateToMpesa(BuildContext context) {
    // Navigate to Add M-Pesa Xpress Billing Page or implement the logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Navigating to Add M-Pesa Xpress Billing')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Methods'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select Payment Method:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            PaymentOption(
              icon: Icons.credit_card,
              label: 'Add Credit or Debit Card',
              onTap: () => navigateToCreditCard(context),
            ),
            SizedBox(height: 20),
            PaymentOption(
              icon: Icons.phone_android,
              label: 'Add M-Pesa Xpress Billing',
              onTap: () => navigateToMpesa(context),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const PaymentOption({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.blue),
            SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
