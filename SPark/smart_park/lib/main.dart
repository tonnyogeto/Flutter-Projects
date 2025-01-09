import 'package:flutter/material.dart';

void main() {
  runApp(SmartParkingApp());
}

class SmartParkingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Parking App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Parking App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Section
              Text(
                'Welcome!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Find, Reserve, Park – Hassle-Free',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 16),

              // Quick Access Buttons
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildQuickAccessButton(Icons.directions_car, 'Reserve a Slot'),
                  _buildQuickAccessButton(Icons.map, 'Real-Time Availability'),
                  _buildQuickAccessButton(Icons.history, 'My Reservations'),
                  _buildQuickAccessButton(Icons.payment, 'Make a Payment'),
                ],
              ),
              SizedBox(height: 16),

              // Real-Time Slot Overview
              Text(
                'Real-Time Slot Overview',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Slots Available: 2/2',
                          style: TextStyle(fontSize: 16)),
                      SizedBox(height: 8),
                      Text('Closest Available Slot: Slot 1',
                          style: TextStyle(fontSize: 16)),
                      SizedBox(height: 8),
                      Text('Average Reservation Cost: \$5.00',
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),

        
              // Contact and Support
              Text(
                'Need Help?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.support_agent),
                label: Text('Contact Support'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Reserve',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          // Handle navigation logic here
        },
      ),
    );
  }

  Widget _buildQuickAccessButton(IconData icon, String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16),
      ),
      onPressed: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
