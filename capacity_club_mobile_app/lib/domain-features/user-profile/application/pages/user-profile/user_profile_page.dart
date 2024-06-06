import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informations Utilisateur'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserInfoCard(
              name: 'John Doe',
              address: '1234 Rue Principale\nVille, Pays\nCode Postal',
              email: 'john.doe@example.com',
              onEdit: () {
                // Navigate to edit user information page
              },
              image: _image,
              onImagePick: _pickImage,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigate to health metrics
                },
                icon: Icon(Icons.health_and_safety),
                label: Text('Métriques de Santé'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Background color of the card
                  foregroundColor: Colors.grey[800], // Text color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigate to subscription details
                },
                icon: Icon(Icons.subscriptions),
                label: Text('Détails de l\'Abonnement'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Background color of the card
                  foregroundColor: Colors.grey[800], // Text color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigate to workout history
                },
                icon: Icon(Icons.history),
                label: Text('Historique des Séances'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Background color of the card
                  foregroundColor: Colors.grey[800], // Text color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigate to reservations
                },
                icon: Icon(Icons.event),
                label: Text('Sessions Réservées'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Background color of the card
                  foregroundColor: Colors.grey[800], // Text color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigate to tips & advice
                },
                icon: Icon(Icons.lightbulb),
                label: Text('Astuces & Conseils'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Background color of the card
                  foregroundColor: Colors.grey[800], // Text color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserInfoCard extends StatelessWidget {
  final String name;
  final String address;
  final String email;
  final VoidCallback onEdit;
  final File? image;
  final VoidCallback onImagePick;

  const UserInfoCard({
    Key? key,
    required this.name,
    required this.address,
    required this.email,
    required this.onEdit,
    this.image,
    required this.onImagePick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white, // Background color of the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onImagePick,
              child: Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: image != null
                      ? FileImage(image!)
                      : NetworkImage('https://via.placeholder.com/150')
                          as ImageProvider,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Nom: $name',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Adresse:\n$address',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Email: $email',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: onEdit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
