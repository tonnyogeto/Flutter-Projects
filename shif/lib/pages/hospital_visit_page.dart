import 'package:flutter/material.dart';

class HospitalVisitPage extends StatefulWidget {
  @override
  _HospitalVisitPageState createState() => _HospitalVisitPageState();
}

class _HospitalVisitPageState extends State<HospitalVisitPage> {
  final TextEditingController nameController = TextEditingController();

  // Function to handle submission
  void submitHospitalVisit() {
    final userName = nameController.text;

    // Validate input
    if (userName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter the user\'s name')),
      );
      return;
    }

    // Simulate submission (replace this with actual logic)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Hospital visit submitted for $userName')),
    );

    // Optionally clear the input field
    nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Visit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'User Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: submitHospitalVisit,
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
