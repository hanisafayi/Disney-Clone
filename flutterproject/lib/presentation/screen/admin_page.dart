import 'package:flutterproject/presentation/screen/AddCarPage.dart';
import 'package:flutterproject/presentation/screen/UpdateCarPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Car Rental App',
    home: AdminPage(),
  ));
}

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<Car> cars = [
    Car(
      name: 'Marcedes',
      photoAsset: 'assets/images/car1.jpg',
      color: 'Red',
      gearbox: 'Automatic',
      seat: 5,
      motor: 'V6',
      speed: 200,
      topSpeed: 250,
    ),
    Car(
      name: 'BMW',
      photoAsset: 'assets/images/car2.jpg',
      color: 'Blue',
      gearbox: 'Manual',
      seat: 4,
      motor: 'V8',
      speed: 220,
      topSpeed: 270,
    ),
    Car(
      name: 'KIA',
      photoAsset: 'assets/images/car3.jpg',
      color: 'Green',
      gearbox: 'Automatic',
      seat: 7,
      motor: 'V4',
      speed: 180,
      topSpeed: 210,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: cars.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.blue,
              child: ListTile(
                leading: Image.asset(
                  cars[index].photoAsset,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  cars[index].name,
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Color: ${cars[index].color}\n'
                  'Gearbox: ${cars[index].gearbox}\n'
                  'Seat: ${cars[index].seat}\n'
                  'Motor: ${cars[index].motor}\n'
                  'Speed: ${cars[index].speed}\n'
                  'Top Speed: ${cars[index].topSpeed}',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UpdateCarPage(car: cars[index]),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          cars.removeAt(index);
                        });
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCarPage(),
            ),
          );
        },
        label: Text('Add Car'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class Car {
  final String name;
  final String photoAsset;
  final String color;
  final String gearbox;
  final int seat;
  final String motor;
  final int speed;
  final int topSpeed;

  Car({
    required this.name,
    required this.photoAsset,
    required this.color,
    required this.gearbox,
    required this.seat,
    required this.motor,
    required this.speed,
    required this.topSpeed,
  });
}
