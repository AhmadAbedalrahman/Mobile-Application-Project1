//Name: Ahmad Abedalrahman ID: 52230064
import 'package:flutter/material.dart';

class Weightconversionscreen extends StatefulWidget {
  const Weightconversionscreen({super.key});

  @override
  State<Weightconversionscreen> createState() => _WeightconversionscreenState();
}

class _WeightconversionscreenState extends State<Weightconversionscreen> {
  double inputValue = 0;
  double convertedValue = 0;
  String fromUnit = 'Kilograms';
  String toUnit = 'Pounds';
  final units = ['Kilograms', 'Pounds', 'Grams', 'Ounces'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weight Conversion',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                inputValue = double.tryParse(value) ?? 0;
                setState(() {}); // Update UI
              },
              decoration: InputDecoration(
                labelText: 'Enter value in $fromUnit',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "From: ",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                DropdownButton<String>(
                  value: fromUnit,
                  onChanged: (value) {
                    setState(() {
                      fromUnit = value!;
                      convertedValue = 0; // Reset converted value
                    });
                  },
                  items: units.map((String unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "To: ",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                DropdownButton<String>(
                  value: toUnit,
                  onChanged: (value) {
                    setState(() {
                      toUnit = value!;
                      convertedValue = 0; // Reset converted value
                    });
                  },
                  items: units.map((String unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (inputValue < 0) {
                      // Optional: Handle negative values if necessary
                      return;
                    }

                    // Conversion logic
                    if (fromUnit == 'Kilograms') {
                      if (toUnit == 'Pounds') {
                        convertedValue = inputValue * 2.20462;
                      } else if (toUnit == 'Grams') {
                        convertedValue = inputValue * 1000;
                      } else if (toUnit == 'Ounces') {
                        convertedValue = inputValue * 35.274;
                      } else {
                        convertedValue = inputValue; // Same unit
                      }
                    } else if (fromUnit == 'Pounds') {
                      if (toUnit == 'Kilograms') {
                        convertedValue = inputValue / 2.20462;
                      } else if (toUnit == 'Grams') {
                        convertedValue = inputValue / 0.00220462;
                      } else if (toUnit == 'Ounces') {
                        convertedValue = inputValue * 16;
                      } else {
                        convertedValue = inputValue; // Same unit
                      }
                    } else if (fromUnit == 'Grams') {
                      if (toUnit == 'Kilograms') {
                        convertedValue = inputValue / 1000;
                      } else if (toUnit == 'Pounds') {
                        convertedValue = inputValue * 0.00220462;
                      } else if (toUnit == 'Ounces') {
                        convertedValue = inputValue * 0.035274;
                      } else {
                        convertedValue = inputValue; // Same unit
                      }
                    } else if (fromUnit == 'Ounces') {
                      if (toUnit == 'Kilograms') {
                        convertedValue = inputValue * 0.0283495;
                      } else if (toUnit == 'Pounds') {
                        convertedValue = inputValue / 16;
                      } else if (toUnit == 'Grams') {
                        convertedValue = inputValue * 28.3495;
                      } else {
                        convertedValue = inputValue; // Same unit
                      }
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Icon(Icons.calculate),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Converted Value: $convertedValue $toUnit',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
