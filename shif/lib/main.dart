import 'package:flutter/material.dart';
import 'api_service.dart';
import 'models.dart';

void main() {
  runApp(MaterialApp(
    home: UserScreen(),
  ));
}



class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late ApiService apiService;
  late Future<List<UserFetchDto>> users;

  @override
  void initState() {
    super.initState();
    apiService = ApiService(baseUrl: 'https://your-backend-api.com');
    users = apiService.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: FutureBuilder<List<UserFetchDto>>(
        future: users,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.imagePath),
                  ),
                  title: Text(user.name),
                  subtitle: Text('ID: ${user.idNo}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailScreen(userId: user.id),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateUserScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class UserDetailScreen extends StatelessWidget {
  final int userId;

  UserDetailScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    // Fetch and display detailed user information
    return Scaffold(
      appBar: AppBar(title: Text('User Details')),
      body: Center(child: Text('User details for ID: $userId')),
    );
  }
}

class CreateUserScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idNoController = TextEditingController();
  final TextEditingController imagePathController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService(baseUrl: 'https://your-backend-api.com');

    return Scaffold(
      appBar: AppBar(title: Text('Create User')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: idNoController,
              decoration: InputDecoration(labelText: 'ID Number'),
            ),
            TextField(
              controller: imagePathController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final userData = {
                  'name': nameController.text,
                  'idNo': idNoController.text,
                  'imagePath': imagePathController.text,
                };
                await apiService.createUser(userData);
                Navigator.pop(context);
              },
              child: Text('Create User'),
            ),
          ],
        ),
      ),
    );
  }
}






