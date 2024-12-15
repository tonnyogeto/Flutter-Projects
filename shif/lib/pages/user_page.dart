import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shif/api/api_service.dart';
import 'package:shif/models/models.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idNoController = TextEditingController();
  File? _selectedImage;

  // Function to pick an image
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  // Function to register the user
  Future<void> registerUser() async {
    final name = nameController.text;
    final idNo = idNoController.text;

    // Validate inputs
    if (name.isEmpty || idNo.isEmpty || _selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields and upload a photo')),
      );
      return;
    }

    // Call the ApiService to register the user
    User? user = await ApiService.registerUser(name, idNo, _selectedImage!, context);

    // Show appropriate message based on result
    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User registered successfully')),
      );
      // Optionally, you can navigate to another screen or display user details
      // For example, navigate to a details screen:
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => UserDetailPage(user: user)),
      // );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register User')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: idNoController,
              decoration: InputDecoration(labelText: 'ID Number'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: pickImage,
              child: _selectedImage == null
                  ? Container(
                      height: 150,
                      width: 150,
                      color: Colors.grey[300],
                      child: Icon(Icons.add_a_photo, size: 50),
                    )
                  : Image.file(_selectedImage!, height: 150, width: 150),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: registerUser,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
