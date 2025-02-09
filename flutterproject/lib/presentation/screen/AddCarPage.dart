import 'package:flutterproject/presentation/screen/AddCarPage.dart';
import 'package:flutter/material.dart';

class AddCarPage extends StatefulWidget {
  @override
  _AddCarPageState createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  String _photoAsset = '';
  String _color = '';
  String _gearbox = '';
  int _seat = 0;
  String _motor = '';
  int _speed = 0;
  int _topSpeed = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Car'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16.0),
        ),
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: 'Photo URL',
                  labelStyle: TextStyle(color: Colors.white)),
              onChanged: (value) {
                setState(() {
                  _photoAsset = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Color',
                  labelStyle: TextStyle(color: Colors.white)),
              onChanged: (value) {
                setState(() {
                  _color = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Gearbox',
                  labelStyle: TextStyle(color: Colors.white)),
              onChanged: (value) {
                setState(() {
                  _gearbox = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Seat',
                  labelStyle: TextStyle(color: Colors.white)),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _seat = int.tryParse(value) ?? 0;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Motor',
                  labelStyle: TextStyle(color: Colors.white)),
              onChanged: (value) {
                setState(() {
                  _motor = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Speed',
                  labelStyle: TextStyle(color: Colors.white)),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _speed = int.tryParse(value) ?? 0;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Top Speed',
                  labelStyle: TextStyle(color: Colors.white)),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _topSpeed = int.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement add functionality
                // Add the new car to the list of cars
                Navigator.pop(context);
              },
              child: Text('Add Car'),
            ),
          ],
        ),
      ),
    );
  }
}
