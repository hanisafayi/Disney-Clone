import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _cardNumber = '';
  String _expiryDate = '';
  String _cvv = '';
  String _amount = '';

  void _confirmPayment() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Confirmation'),
          content: Text('Payment confirmed successfully!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment page',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade500,
            ],
          ),
        ),
        child: IntrinsicHeight(
          child: Card(
            elevation: 30.0,
            margin: EdgeInsets.all(30.0),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Enter Payment Information',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'acccount number',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _cardNumber = value;
                      });
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'reciever account number',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _expiryDate = value;
                      });
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Amount (ETB)',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _cvv = value;
                      });
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'payment password',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _amount = value;
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: _confirmPayment,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text('Confirm Payment'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Car Rental App',
    home: PaymentPage(),
  ));
}
