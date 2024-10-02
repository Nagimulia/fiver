import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vitaliy/services/NotificationService.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedGender = 'None selected';
  TimeOfDay selectedTime = TimeOfDay.now();
  bool value = false;
  bool? isChecked3 = false;
  bool? isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2))]),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RadioMenuButton(
                        value: 'Female',
                        groupValue: selectedGender,
                        onChanged: (selectedValue) {
                          setState(() {
                            selectedGender = selectedValue!;
                          });
                        },
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          elevation: const WidgetStatePropertyAll(2),
                          backgroundColor: const WidgetStatePropertyAll(
                              Color.fromARGB(255, 230, 210, 217)),
                        ),
                        child: Image.asset('images/f.png'),
                      ),
                      const SizedBox(
                        width: 45,
                      ),
                      RadioMenuButton(
                        value: 'Male',
                        groupValue: selectedGender,
                        onChanged: (selectedValue) {
                          setState(() {
                            selectedGender = selectedValue!;
                          });
                        },
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          elevation: const WidgetStatePropertyAll(2),
                          backgroundColor: const WidgetStatePropertyAll(
                              Color.fromARGB(255, 230, 210, 217)),
                        ),
                        child: Image.asset('images/m.png'),
                      ),
                    ]),
                const SizedBox(
                  height: 150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Checkbox(
                          value: isChecked3,
                          onChanged: (val) {
                            setState(() {
                              isChecked3 = val;
                            });
                          }),
                      onPressed: () {
                        NotificationService.showInstantNotification(
                            "Instant Notification",
                            "This shows an instant notifications");
                      },
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final TimeOfDay? timeOfDay = await showTimePicker(
                            context: context,
                            initialTime: selectedTime,
                            initialEntryMode: TimePickerEntryMode.dial);
                        if (timeOfDay != null) {
                          setState(() {
                            selectedTime = timeOfDay;
                          });
                        }
                      },
                      child:
                          Text('${selectedTime.hour}: ${selectedTime.minute}'),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Checkbox(
                          value: isChecked2,
                          onChanged: (val) {
                            setState(() {
                              isChecked2 = val;
                            });
                          }),
                      onPressed: () {
                        NotificationService.showInstantNotification(
                            "Instant Notification",
                            "This shows an instant notifications");
                      },
                      // child: const Text('Show Notification'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final TimeOfDay? timeOfDay = await showTimePicker(
                            context: context,
                            initialTime: selectedTime,
                            initialEntryMode: TimePickerEntryMode.dial);
                        if (timeOfDay != null) {
                          setState(() {
                            selectedTime = timeOfDay;
                          });

                       
                        }
                      },
                      child:
                          Text('${selectedTime.hour}: ${selectedTime.minute}'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
