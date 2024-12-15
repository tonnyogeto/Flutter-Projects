import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:shif/models/models.dart';

class ApiService {
  static const String _baseUrl = 'http://192.168.0.107:8080/api/users';

  // Function to register a user
  static Future<User?> registerUser(String name, String idNo, File image, BuildContext context) async {
    var request = http.MultipartRequest('POST', Uri.parse(_baseUrl));

    // Set the Content-Type header
    request.headers['Content-Type'] = 'multipart/form-data';

    // Prepare user data in snake_case for Spring Boot backend
    request.fields['user'] = json.encode({
      'name': name,
      'id_no': idNo,  // Using snake_case for idNo
    });

    // Add the image to the request
    var imageFile = await http.MultipartFile.fromPath('image', image.path);
    request.files.add(imageFile);

    try {
      // Send the request
      var response = await request.send();

      // Check response status
      if (response.statusCode == 201) {
        // Read the response body as string
        String responseBody = await response.stream.bytesToString();
        
        // Parse the response
        var decodedResponse = json.decode(responseBody);
        
        // Assuming the response includes 'message' and 'content' keys
        String message = decodedResponse['message'];
        var content = decodedResponse['content'];
        
        // If the content is a valid user object, create a User instance
        User user = User.fromJson(content);

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );

        return user;  // Return the created User object
      } else {
        // Handle failure case
        String responseBody = await response.stream.bytesToString();
        print('Failed to register user: $responseBody');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed')),
        );
        return null;  // Return null if registration fails
      }
    } catch (e) {
      print('Error during request: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      return null;  // Return null if an error occurs
    }
  }
}
