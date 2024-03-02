import 'package:flutter/material.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({Key? key}) : super(key: key);

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text(
              'Initial Setup',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Proxima-Nova',
                fontSize: 28,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: Text('Username'),
        ),
        TextFormField(
          decoration: const InputDecoration(
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: Text('Email Address'),
        ),
        TextFormField(
          decoration: const InputDecoration(
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: Text('Preferred Theme'),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Light Theme'),
                Switch(
                  value: true,
                  onChanged: (bool newValue) {},
                ),
                const Text('Dark Theme')
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Align(
            alignment: Alignment.center,
            child: ElevatedButton(  
              onPressed: () {},
              child: const Text('Save'),
            ),
          ),
        ),
      ],
    );
  }
}
