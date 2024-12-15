import 'package:flutter/material.dart';

class PaymentPlanPage extends StatefulWidget {
  @override
  _PaymentPlanPageState createState() => _PaymentPlanPageState();
}

class _PaymentPlanPageState extends State<PaymentPlanPage> {
  final TextEditingController nameController = TextEditingController();
  String? selectedPlan; // To store the selected plan
  int? planCost; // To store the cost of the selected plan

  // Function to handle form submission
  void submitPaymentPlan() {
    final userName = nameController.text;

    // Validate input
    if (userName.isEmpty || selectedPlan == null || planCost == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter your name and select a plan')),
      );
      return;
    }

    // Simulate submission (replace this with actual logic)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$userName selected the $selectedPlan plan (Ksh $planCost)')),
    );

    // Clear fields after submission
    nameController.clear();
    setState(() {
      selectedPlan = null;
      planCost = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Plan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a Plan:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Monthly Premium - Ksh 1500'),
              leading: Radio<String>(
                value: 'Monthly Premium',
                groupValue: selectedPlan,
                onChanged: (value) {
                  setState(() {
                    selectedPlan = value;
                    planCost = 1500;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Annual Premium - Ksh 18000'),
              leading: Radio<String>(
                value: 'Annual Premium',
                groupValue: selectedPlan,
                onChanged: (value) {
                  setState(() {
                    selectedPlan = value;
                    planCost = 18000;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Enter User Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: submitPaymentPlan,
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
