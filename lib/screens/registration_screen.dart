import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController dobController = TextEditingController();
  TextEditingController joiningTimeController = TextEditingController();

  String selectedGender = 'Male';
  bool isChecked = false;
  List<String> listCity = <String>['Bardoli', 'Surat', 'Ahmedabad', 'Vadodara'];
  String selectedCity = 'Bardoli';
  var selectedDOB;
  var selectedJoiningTime;

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
                DropdownButton(
                    value: selectedCity,
                    icon: const Icon(Icons.arrow_downward_sharp),
                    items:
                        listCity.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(value: value, child: Text(value));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCity = newValue!;
                      });
                    }),
                const SizedBox(height: 10),
                TextField(
                  controller: dobController,
                  readOnly: true,
                  showCursor: true,
                  onTap: () async {
                    DateTime? datePicker = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2018),
                        lastDate: DateTime.now());

                    if (datePicker != null) {
                      selectedDOB = DateFormat("dd-MM-yyy").format(datePicker);
                      dobController.text = selectedDOB;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'DOB',
                    hintText: 'DOB',
                    suffixIcon: const Icon(Icons.calendar_month),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: joiningTimeController,
                  readOnly: true,
                  showCursor: true,
                  onTap: () async {
                    TimeOfDay? timePicker = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.dial);
                    final now = DateTime.now();
                    final time = DateTime(now.year, now.month, now.day,
                        timePicker!.hour, timePicker.minute);
                    selectedJoiningTime = DateFormat("HH:mm").format(time);
                    joiningTimeController.text = selectedJoiningTime;
                  },
                  decoration: InputDecoration(
                    labelText: 'Joining Time',
                    hintText: 'Joining Time',
                    suffixIcon: const Icon(Icons.timer_outlined),
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
                CheckboxListTile(
                  title: const Text(
                    'Terms and Condition Accept',
                    style: TextStyle(fontSize: 18),
                  ),
                  value: isChecked,
                  onChanged: (newValue) {
                    setState(
                      () {
                        isChecked = newValue!;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
