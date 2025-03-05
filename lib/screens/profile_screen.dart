import 'package:afro_caribbean/screens/settings_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_nav_bar.dart';
// ignore: unused_import

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  static const routeName = '/profile';

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SettingPage()),
            );
          },
          icon: const Icon(Icons.settings, color: Colors.grey),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.arrow_back,
        //       color: Colors.grey,
        //     ),
        //   ),
        // ],
      ),
      bottomNavigationBar: const BottomNavBar(index: 2, selectedCountry: 'ng'),
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        children: const [_ProfilePage()],
      ),
    );
  }
}

class _ProfilePage extends StatefulWidget {
  // ignore: unused_element
  const _ProfilePage();

  @override
  State<_ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<_ProfilePage> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 16, top: 25),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            const Text(
              'Edit Profile',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 10),
                        ),
                      ],
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://www.google.com/imgres?imgurl=https%3A%2F%2Fthumbs.dreamstime.com%2Fb%2Flockport-ny-usa-july-small-typical-american-house-small-typical-american-house-166514313.jpg&imgrefurl=https%3A%2F%2Fwww.dreamstime.com%2Fphotos-images%2Ftypical-american-house.html&tbnid=GcsUn_h0RZixuM&vet=12ahUKEwiD94rDh9j6AhVByRoKHX5zCGwQMygFegUIARDtAQ..i&docid=A-uypSph1URPaM&w=800&h=451&q=united%20states%20house%20pictures&ved=2ahUKEwiD94rDh9j6AhVByRoKHX5zCGwQMygFegUIARDtAQ',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                      child: const Icon(Icons.edit, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            BuildTextField('Full Name', 'Dar Alex', false),
            BuildTextField('E-Mail', 'Alex@gmail.com', false),
            BuildTextField('Password', '**********', true),
            BuildTextField('Country', 'Nigeria', false),
            const SizedBox(height: 25),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 2.2,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 2.2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BuildTextField(
    String labelText,
    String placeholder,
    bool isPasswordTextField,
  ) {
    bool showPassword = false;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Expanded(
        child: TextField(
          obscureText: isPasswordTextField ? showPassword : false,
          decoration: InputDecoration(
            suffixIcon:
                isPasswordTextField
                    ? IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: const Icon(Icons.remove_red_eye),
                    )
                    : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
