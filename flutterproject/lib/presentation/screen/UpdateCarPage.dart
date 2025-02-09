import 'package:flutterproject/presentation/screen/admin_page.dart';
import 'package:flutter/material.dart';

class UpdateCarPage extends StatefulWidget {
  final Car car;

  UpdateCarPage({required this.car});

  @override
  _UpdateCarPageState createState() => _UpdateCarPageState();
}

class _UpdateCarPageState extends State<UpdateCarPage> {
  String _photo = '';
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
        title: Text('Update Car'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Card(
          color: Colors.blue,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Car: ${widget.car.name}',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Photo URL',
                      labelStyle: TextStyle(color: Colors.white)),
                  onChanged: (value) {
                    setState(() {
                      _photo = value;
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
                    // Implement update functionality
                  },
                  child: Text('Update Car'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
