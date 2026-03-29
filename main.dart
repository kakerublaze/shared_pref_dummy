import 'package:flutter/material.dart';
import 'core/storage/preference_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PreferenceService.init(); // 🔥 IMPORTANT

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(child: Text("App Started")),
      ),
    );
  }
}

// Save Data
// PreferenceService.isLoggedIn = true;
// PreferenceService.email = "taher@gmail.com";
// PreferenceService.token = "abc123";

// Get Data
// bool isLogin = PreferenceService.isLoggedIn;
// String email = PreferenceService.email;

// Save Custom Data 
// PreferenceService.user = UserModel(
//   name: "Taher",
//   email: "taher@gmail.com",
// );

// Get Custom Data 
// UserModel user = PreferenceService.user;
// print(user.name);

// Save List
// PreferenceService.productList = [
//   ProductModel(title: "iPhone", price: 1000),
//   ProductModel(title: "Laptop", price: 2000),
// ];

// Get List
// final products = PreferenceService.productList;

// for (var p in products) {
//   print(p.title);
// }

// Clear Logout 
// await PreferenceService.clearAll();
