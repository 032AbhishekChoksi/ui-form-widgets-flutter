import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String selectedGender = 'Male';
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: SingleChildScrollView(
        child: Center(
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
                const SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: InputDecoration(
                    labelText: 'Enter Contact No',
                    hintText: 'Contact No',
                    prefixIcon: const Icon(Icons.person_pin),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    labelText: 'Enter Password',
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.password_outlined),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                RadioListTile(
                  title: const Text(
                    'Male',
                    style: TextStyle(fontSize: 18),
                  ),
                  value: 'Male',
                  groupValue: selectedGender,
                  onChanged: (newValue) {
                    setState(() {
                      selectedGender = newValue!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text(
                    'Female',
                    style: TextStyle(fontSize: 18),
                  ),
                  value: 'Female',
                  groupValue: selectedGender,
                  onChanged: (newValue) {
                    setState(() {
                      selectedGender = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 10),
                CheckboxListTile(
                    title: const Text(
                      'Terms and Condition Accept',
                      style: TextStyle(fontSize: 18),
                    ),
                    value: isChecked,
                    onChanged: (newValue) {
                      setState(() {
                        isChecked = newValue!;
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
