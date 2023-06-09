import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          MyCard(),
        ],
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            textDirection: TextDirection.ltr,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Icon(Icons.account_circle, size: 60),
              ),
              Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'Gerson Cruz',
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                  ),
                  Text(
                    'FrontEnd App Developer',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: Text(
                  '505 Main Street',
                  style: TextStyle(color: Colors.lightBlueAccent),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 13.0),
                child: Text(
                  '415-555-0000',
                  style: TextStyle(color: Colors.lightBlueAccent),
                ),
              ),

            ],
          ),
          const SizedBox(height: 16),
          Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(Icons.person_pin, size: 50, color: Colors.blueGrey,),
              Icon(Icons.timer, size: 50, color: Colors.blueGrey),
              Icon(Icons.settings_cell_rounded, size: 50, color: Colors.blueGrey),
              Icon(Icons.smartphone, size: 50, color: Colors.blueGrey),
            ],
          ),
        ],
      ),
    );
  }
}
