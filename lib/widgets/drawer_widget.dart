import 'package:flutter/material.dart';
import 'package:harvestify/utils/profile.dart';
import '/screens/classified_diseases_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text("Mohit Singh"),
            accountEmail: const Text("mohitrajputms123@gmail.com"),
            currentAccountPicture: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen(username: '', surname: '', otherNames: '', primaryContact: 's',)),
                );
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/placeholder_profile.png"),
              ),
            ),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 6, 80, 8),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone_android),
            title: const Text('Classified Diseases'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ClassifiedDiseases()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () {
              Navigator.pop(context);
              // Handle Notifications navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              // Handle Logout navigation
            },
          ),
        ],
      ),
    );
  }
}
