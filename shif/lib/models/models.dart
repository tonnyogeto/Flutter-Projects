class User {
  String name;
  String idNo;
  String imagePath;

  User({required this.name, required this.idNo, required this.imagePath});

  // Custom fromJson method to handle snake_case keys
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'], // Spring Boot will return 'name' in snake_case
      idNo: json['id_no'], // 'id_no' should match the key in the backend response
      imagePath: json['image_path'], // Similarly, use 'image_path' for the image field
    );
  }

  // Custom toJson method to handle snake_case keys when sending data to backend
  Map<String, dynamic> toJson() {
    return {
      'name': name, // 'name' is sent as 'name' in camelCase
      'id_no': idNo, // Use 'id_no' to match the Spring Boot backend's expected format
      'image_path': imagePath, // Similarly, use 'image_path' for the image field
    };
  }
}
