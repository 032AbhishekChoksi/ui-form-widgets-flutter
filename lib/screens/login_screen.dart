import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              CircleAvatar(
                backgroundColor: Colors.grey.shade100,
                maxRadius: 50,
                child: const Icon(
                  Icons.person_2_outlined,
                  size: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
