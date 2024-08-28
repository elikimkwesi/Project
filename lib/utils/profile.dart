import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    Key? key,
    required String username,
    required String surname,
    required String otherNames,
    required String primaryContact,
    required String secondaryContact,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _surnameController;
  late TextEditingController _otherNamesController;
  late TextEditingController _secondaryContactController;
  bool _isEditingPersonal = false;
  bool _isEditingContact = false;
  File? _avatarImage;
  String _username = '';
  String _primaryContact = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _surnameController = TextEditingController();
    _otherNamesController = TextEditingController();
    _secondaryContactController = TextEditingController();
    _loadProfileData();
    _loadAvatarImage();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _surnameController.dispose();
    _otherNamesController.dispose();
    _secondaryContactController.dispose();
    super.dispose();
  }

  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');

    if (userId != null) {
      final response = await http.get(Uri.parse('http://backend-sw02.onrender.com/user/$userId'));

      if (jsonDecode(response.body)['status'] == 'SUCCESS') {
        final data = jsonDecode(response.body)['data'];
        setState(() {
          _username = data['email'] ?? ''; // Ensuring null safety
          _primaryContact = data['phone'] ?? '';
          _surnameController.text = data['surname'] ?? '';
          _otherNamesController.text = data['other_names'] ?? '';
          _secondaryContactController.text = data['secondary_contact'] ?? '';
        });
        // Save to SharedPreferences
        await prefs.setString('surname', _surnameController.text);
        await prefs.setString('otherNames', _otherNamesController.text);
        await prefs.setString('secondaryContact', _secondaryContactController.text);
      } else {
        print('Failed to load user data');
        // Load from SharedPreferences if data fetching fails
        setState(() {
          _surnameController.text = prefs.getString('surname') ?? '';
          _otherNamesController.text = prefs.getString('otherNames') ?? '';
          _secondaryContactController.text = prefs.getString('secondaryContact') ?? '';
        });
      }
    } else {
      print('User ID not found in SharedPreferences');
      // Load from SharedPreferences if no userId
      setState(() {
        _surnameController.text = prefs.getString('surname') ?? '';
        _otherNamesController.text = prefs.getString('otherNames') ?? '';
        _secondaryContactController.text = prefs.getString('secondaryContact') ?? '';
      });
    }
  }

  Future<void> _loadAvatarImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('avatarImagePath');
    if (imagePath != null) {
      setState(() {
        _avatarImage = File(imagePath);
      });
    }
  }

  Future<void> _saveAvatarImage(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('avatarImagePath', path);
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _avatarImage = File(pickedFile.path);
      });
      await _saveAvatarImage(pickedFile.path);
      _notifyAvatarChange();
    }
  }

  void _notifyAvatarChange() {
    // Notify other parts of the app about the avatar change
  }

  Future<void> _updateProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');

    if (userId != null) {
      final response = await http.post(
        Uri.parse('http://backend-sw02.onrender.com/user/update_profile'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'userId': userId,
          'surname': _surnameController.text,
          'other_names': _otherNamesController.text,
          'secondary_contact': _secondaryContactController.text,
        }),
      );

      if (response.statusCode == 200) {
        print('Profile updated successfully');
        // Save to SharedPreferences
        await prefs.setString('surname', _surnameController.text);
        await prefs.setString('otherNames', _otherNamesController.text);
        await prefs.setString('secondaryContact', _secondaryContactController.text);
      } else {
        print('Failed to update profile');
      }
    } else {
      print('User ID not found in SharedPreferences');
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = const Color.fromARGB(255, 6, 80, 8);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Container(
              color: primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: _avatarImage != null
                          ? FileImage(_avatarImage!)
                          : const AssetImage("assets/images/placeholder_profile.png") as ImageProvider,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      '${_surnameController.text} ${_otherNamesController.text}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            // Tab bar section
            Container(
              color: primaryColor,
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                indicatorColor: Colors.white,
                tabs: const [
                  Tab(text: 'Personal'),
                  Tab(text: 'Contact'),
                ],
              ),
            ),

            // Tab view content
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Personal Section
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildProfileItem("Username", _username),
                          if (!_isEditingPersonal) ...[
                            _buildProfileItem("Surname", _surnameController.text),
                            _buildProfileItem("Other Names", _otherNamesController.text),
                          ],
                          if (_isEditingPersonal) ...[
                            _buildEditableProfileItem("Surname", _surnameController),
                            _buildEditableProfileItem("Other Names", _otherNamesController),
                          ],
                        ],
                      ),
                    ),
                  ),
                  // Contact Section
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildProfileItem("Primary Contact", _primaryContact),
                          if (!_isEditingContact)
                            _buildProfileItem("Secondary Contact", _secondaryContactController.text),
                          if (_isEditingContact)
                            _buildEditableProfileItem("Secondary Contact", _secondaryContactController),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Edit Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    setState(() {
                      if (_tabController.index == 0) {
                        if (_isEditingPersonal) {
                          // Save changes to personal info
                          _updateProfileData();
                        }
                        _isEditingPersonal = !_isEditingPersonal;
                      } else {
                        if (_isEditingContact) {
                          // Save changes to contact info
                          _updateProfileData();
                        }
                        _isEditingContact = !_isEditingContact;
                      }
                    });
                  },
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: Text(_isEditingPersonal || _isEditingContact ? 'Save' : 'Edit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditableProfileItem(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
