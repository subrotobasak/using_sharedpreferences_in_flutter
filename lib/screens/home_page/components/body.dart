import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // Creating a TextEditingController object named as textEditingController.
  //It is used to get TextField entered value.

  TextEditingController textEditingController = new TextEditingController();

  // Creating a SharedPreferences object named as sharedPreferences

  late SharedPreferences sharedPreferences;

  /*Creating a String variable named as name with empty value.
  It is used to store the saved shared preferences key and show into Text widget.*/

  String name = '';

/*Creating a ASYNC type of function named as _saveToSharedPreferences.
In this function we would first make Instance of shared preferences.
Now save the TextField entered value using KEY. */

  _saveToSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('key_1', textEditingController.text.toString());
  }

// Creating another function named as _showSavedValue().
//In this function we would retrieve the locally save value using the Key again and store into temp variable.

  _showSavedValue() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      name = sharedPreferences.getString('key_1').toString();
    });
  }

// Creating another function named as _deleteSharedPreferences().
//In this function we would delete the saved value.

  _deleteSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('key_1');
    setState(() {
      name = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              labelText: 'Enter your text here',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                _saveToSharedPreferences();
              },
              child: const Text('Store Value in Shared Preferences')),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                _showSavedValue();
              },
              child: const Text('Display Value Stored in Shared Preferences')),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                _deleteSharedPreferences();
              },
              child: const Text('Delete Value Stored in Shared Preferences')),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
