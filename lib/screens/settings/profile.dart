// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(Profile());
}


class Profile extends StatelessWidget {
const Profile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed:(){}, icon: Icon(Icons.chevron_left_sharp)),
        title: Text("My Profile"),
      ),

      body: Padding(
        padding:EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Profile Pictue 
            CircleAvatar(
              radius: 50.0,
              child: const Image(image: AssetImage("assets/images/profile/Image Placeholder.png"),),
            ),
            SizedBox(height: 20.0),
            // User Name
            Text(
              "Cameron Williamson",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            // User email
            Text(
              "\$joneswilliam",
              style: TextStyle(fontSize: 16.0),
            ),
            Divider(thickness: 1.0),
            // Account Details List
            ListTile(
              title: Text("Account Number"),
              trailing: Text("1234567890"),
            ),
            ListTile(
              title: Text("Account Type"),
              trailing: Text ("Checking"),
            ),
            ListTile(
              title: Text('Available Balance'),
              trailing: Text('\$10,000.00'),
            ),
            ListTile(
              title: Text('User Name '),
              trailing: Text('Dewa_Fan'),
            ),
            Divider(thickness: 1.0),

            ListTile(
              title: Text('Settings'),
              onTap: () {
                // Navigate to settings screen
              },
            ),
            Divider(), // Add a divider between sections
            ListTile(
              title: Text('Change Pin'),
              onTap: () {
                // Navigate to change pin screen
              },
            ),
            ListTile(
              title: Text('Change Password'),
              onTap: () {
                // Navigate to change password screen
              },
            ),
            ListTile(
              title: Text('Enable Finger Print'),
              onTap: () {
                // Handle enabling fingerprint
              },
            ),

            Divider(thickness: 1.0), // Add a divider between sections
            ListTile(
              title: Text('Others'),
              onTap: () {
                // Navigate to other details screen
              },
            ),
            Divider(thickness: 1.0), // Add a divider between sections
          
          ListTile(
              title: Text('Others'),
              onTap: () {
                // Navigate to other details screen
              },
            ),
            Divider(), // Add a divider between sections
            ListTile(
              title: Text('Language'),
              onTap: () {
                // Navigate to language settings screen
              },
            ),
            ListTile(
              title: Text('Notification Settings'),
              onTap: () {
                // Navigate to notification settings screen
              },
            ), 
          ],
        ),
      ),
    );
  }
}