import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kiểm tra số nguyên tố',
      home: PrimeNumberScreen(),
    );
  }
}

class PrimeNumberScreen extends StatefulWidget {
  @override
  _PrimeNumberScreenState createState() => _PrimeNumberScreenState();
}

class _PrimeNumberScreenState extends State<PrimeNumberScreen> {
  TextEditingController _numberController = TextEditingController();
  bool _isPrime = false;

  bool isPrimeNumber(int number) {
    if (number <= 1) return false;
    if (number == 2) return true;

    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  void _checkPrime() {
    int number = int.tryParse(_numberController.text) ?? 0;

    setState(() {
      _isPrime = isPrimeNumber(number);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kiểm tra số nguyên tố'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter a number',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkPrime,
              child: Text('Kiểm tra số nguyên tố'),
            ),
            SizedBox(height: 20),
            _isPrime
                ? Text(
              'Đây là số nguyên tố.',
              style: TextStyle(fontSize: 18, color: Colors.green),
            )
                : Text(
              'Đây không phải là số nguyên tố.',
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
