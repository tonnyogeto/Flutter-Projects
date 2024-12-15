import 'package:flutter/material.dart';

class ClaimsPage extends StatefulWidget {
  @override
  _ClaimsPageState createState() => _ClaimsPageState();
}

class _ClaimsPageState extends State<ClaimsPage> {
  final TextEditingController userController = TextEditingController();

  void submitClaim() {
    final userName = userController.text;

    if (userName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a username')),
      );
    } else {
      // Handle the claim status retrieval here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Fetching claim status for $userName...')),
      );
      // Add API or navigation logic as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Claims Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Claim Status',
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
              onPressed: submitClaim,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
