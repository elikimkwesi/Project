import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  String username;
  String surname;
  String otherNames;
  String primaryContact;
  String secondaryContact;

  ProfileScreen({
    Key? key,
    required this.username,
    required this.surname,
    required this.otherNames,
    required this.primaryContact,
    this.secondaryContact = '',
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _surnameController = TextEditingController(text: widget.surname);
    _otherNamesController = TextEditingController(text: widget.otherNames);
    _secondaryContactController = TextEditingController(text: widget.secondaryContact);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _surnameController.dispose();
    _otherNamesController.dispose();
    _secondaryContactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Color.fromARGB(255, 6, 80, 8), // Dark Red color
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
              color: Color.fromARGB(255, 6, 80, 8), // Dark Red color
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/images/placeholder_profile.png"),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.surname,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.otherNames,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Tab bar section
            Container(
              color: Color.fromARGB(255, 6, 80, 8), // Dark Red color
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
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProfileItem("Username", widget.username),
                        _buildProfileItem("Surname", _isEditingPersonal ? null : widget.surname),
                        _buildProfileItem("Other Names", _isEditingPersonal ? null : widget.otherNames),
                        if (_isEditingPersonal) ...[
                          _buildEditableProfileItem("Surname", _surnameController),
                          _buildEditableProfileItem("Other Names", _otherNamesController),
                        ],
                      ],
                    ),
                  ),
                  // Contact Section
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProfileItem("Primary Contact", widget.primaryContact),
                        _buildProfileItem("Secondary Contact", _isEditingContact ? null : widget.secondaryContact),
                        if (_isEditingContact)
                          _buildEditableProfileItem("Secondary Contact", _secondaryContactController),
                      ],
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
                  onPressed: () {
                    setState(() {
                      if (_tabController.index == 0) {
                        if (_isEditingPersonal) {
                          // Save changes to personal info
                          setState(() {
                            widget.surname = _surnameController.text;
                            widget.otherNames = _otherNamesController.text;
                          });
                        }
                        _isEditingPersonal = !_isEditingPersonal;
                      } else {
                        if (_isEditingContact) {
                          // Save changes to contact info
                          setState(() {
                            widget.secondaryContact = _secondaryContactController.text;
                          });
                        }
                        _isEditingContact = !_isEditingContact;
                      }
                    });
                  },
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: Text(_isEditingPersonal || _isEditingContact ? 'Save' : 'Edit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 6, 80, 8), // Dark Red color
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

  Widget _buildProfileItem(String title, String? value) {
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
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 4),
          if (value != null)
            Text(
              value.isNotEmpty ? value : 'N/A',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          const Divider(color: Colors.black26),
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
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          const Divider(color: Colors.black26),
        ],
      ),
    );
  }
}
