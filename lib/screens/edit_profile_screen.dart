// import 'package:flutter/material.dart';

// class SettingsUI extends StatelessWidget {
//   const SettingsUI({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Settings UI',
//       home: EditProfilePage(),
//     );
//   }
// }

// class EditProfilePage extends StatefulWidget {
//   const EditProfilePage({super.key});

//   @override
//   State<EditProfilePage> createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   bool showPassword = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         elevation: 1,
//         leading: IconButton(
//           onPressed: () {},
//           icon: const Icon(
//             Icons.settings,
//             color: Colors.grey,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.arrow_back,
//               color: Colors.grey,
//             ),
//           ),
//         ],
//       ),
//       body: Container(
//         padding: const EdgeInsets.only(left: 10, right: 16, top: 25),
//         child: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: ListView(
//             children: [
//               const Text(
//                 'Edit Profile',
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Center(
//                 child: Stack(
//                   children: [
//                     Container(
//                       width: 150,
//                       height: 150,
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                             width: 4,
//                             color: Theme.of(context).scaffoldBackgroundColor,
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                                 spreadRadius: 2,
//                                 blurRadius: 10,
//                                 color: Colors.black.withOpacity(0.1),
//                                 offset: const Offset(0, 10))
//                           ],
//                           shape: BoxShape.circle,
//                           image: const DecorationImage(
//                               fit: BoxFit.cover,
//                               image: NetworkImage(
//                                   'https://www.google.com/imgres?imgurl=https%3A%2F%2Fthumbs.dreamstime.com%2Fb%2Flockport-ny-usa-july-small-typical-american-house-small-typical-american-house-166514313.jpg&imgrefurl=https%3A%2F%2Fwww.dreamstime.com%2Fphotos-images%2Ftypical-american-house.html&tbnid=GcsUn_h0RZixuM&vet=12ahUKEwiD94rDh9j6AhVByRoKHX5zCGwQMygFegUIARDtAQ..i&docid=A-uypSph1URPaM&w=800&h=451&q=united%20states%20house%20pictures&ved=2ahUKEwiD94rDh9j6AhVByRoKHX5zCGwQMygFegUIARDtAQ'))),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: Container(
//                         height: 50,
//                         width: 50,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.grey,
//                           border: Border.all(
//                             width: 4,
//                             color: Theme.of(context).scaffoldBackgroundColor,
//                           ),
//                         ),
//                         child: const Icon(
//                           Icons.edit,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               BuildTextField('Full Name', 'Dar Alex', false),
//               BuildTextField('E-Mail', 'Alex@gmail.com', false),
//               BuildTextField('Password', '**********', true),
//               BuildTextField('Country', 'Nigeria', false),
//               SizedBox(height: 35),
//               Row(
//                 children: [
//                   OutlinedButton(
//                       onPressed: () {},
//                       child: Text(
//                         'Cancel',
//                         style: TextStyle(
//                             fontSize: 15,
//                             letterSpacing: 2.2,
//                             color: Colors.black),
//                       ))
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget BuildTextField(
//       String labelText, String placeholder, bool isPasswordTextField) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 35.0),
//       child: TextField(
//         obscureText: isPasswordTextField ? showPassword : false,
//         decoration: InputDecoration(
//             suffixIcon: isPasswordTextField
//                 ? IconButton(
//                     onPressed: () {
//                       setState(() {
//                         showPassword = !showPassword;
//                       });
//                     },
//                     icon: Icon(Icons.remove_red_eye))
//                 : null,
//             contentPadding: EdgeInsets.only(bottom: 3),
//             labelText: ' Full Name',
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             hintText: 'Dar Alex',
//             hintStyle: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black)),
//       ),
//     );
//   }
// }
