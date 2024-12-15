import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final TextEditingController userController = TextEditingController();

  void generateReport() {
    final userName = userController.text;

    if (userName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a username')),
      );
    } else {
      // Handle report generation here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Generating report for $userName...')),
      );
      // Add API or report generation logic as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Generate Statement for the Last One Year',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: userController,
              decoration: InputDecoration(
                labelText: 'Enter User',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateReport,
              child: Text('Generate'),
            ),
          ],
        ),
      ),
    );
  }
}
