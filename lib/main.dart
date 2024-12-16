//Name: Ahmad Abedalrahman ID: 52230064
import 'package:flutter/material.dart';
import 'package:unit_converter/LengthConversionScreen.dart';
import 'package:unit_converter/TemperatureConversionScreen.dart';
import 'package:unit_converter/WeightConversionScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Unit Converter",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Length Conversion'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LengthConversionScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Weight Conversion'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Weightconversionscreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Temperature Conversion'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TemperatureConversionScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
