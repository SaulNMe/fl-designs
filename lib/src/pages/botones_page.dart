import 'dart:ui';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _titulos(),
                _gridButtons(context),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ]
        )
      ),
    );

    final pinkBox = Transform.rotate(
      angle: 1,
      child: Container(
        width: 380.0,
        height: 380.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset(0.0, 0.5),
            end: FractionalOffset(1.0, 1.0),
            colors: [
              Color.fromRGBO(241, 142, 175, 1.0),
              Color.fromRGBO(236, 98, 188, 1.0), 
            ]
          ),
          color: Colors.pink,
          borderRadius: BorderRadius.circular(80.0),
        ),
      )
    );

    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
          top: -100,
          child: pinkBox
        )
      ],
    );

  }
  
  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Clasified transaction', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0),
            Text('Clasified this transaction into a particular category', style: TextStyle(color: Colors.white, fontSize: 20.0)),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(
          caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0))
        )
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, size: 30.0,),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bubble_chart, size: 30.0,),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle, size: 30.0,),
            title: Container(),
          ),
        ]
      ),
    );
  }
  
  Widget _gridButtons(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            _createRoundedBoxButton(context, "car", Icons.directions_car, Colors.orange),
            _createRoundedBoxButton(context, "Subway", Icons.directions_subway, Colors.pink),
          ]
        ),
        TableRow(
          children: [
            _createRoundedBoxButton(context, "Airplane", Icons.airplanemode_active, Colors.pinkAccent),
            _createRoundedBoxButton(context, "Trash", Icons.restore_from_trash, Colors.blue),
          ]
        ),
        TableRow(
          children: [
            _createRoundedBoxButton(context, "Alarm", Icons.alarm, Colors.green),
            _createRoundedBoxButton(context, "Clip", Icons.attach_file, Colors.cyanAccent),
          ]
        ),
        TableRow(
          children: [
            _createRoundedBoxButton(context, "Folder", Icons.folder, Colors.blue[400]),
            _createRoundedBoxButton(context, "Favorite", Icons.favorite, Colors.redAccent),
          ]
        ),
      ],
    );
  }

  Widget _createRoundedBoxButton(BuildContext context, String text, IconData icon, Color color){

    return
     Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          SizedBox(width: 10.0,),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(62, 66, 107, 0.7),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: color,
                        radius: 30.0,
                          child: Icon(icon, color: Colors.white, size: 30.0,),
                      ),
                      SizedBox(height: 20.0,),
                      Text(text, style: TextStyle(color: color, fontSize: 16.0, fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0,),
        ],
      ),
    );

    // return ClipRRect(
    //   child: Container(
    //     height: 180.0,
    //     margin: EdgeInsets.all(15.0),
    //     child: Stack(
    //       children: <Widget>[
    //         BackdropFilter(
    //           filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
    //           child: Container(
    //             decoration: BoxDecoration(
    //               color: Color.fromRGBO(62, 66, 107, 0.7),
    //               borderRadius: BorderRadius.circular(20.0),
    //             ),
    //           )
    //         ),
    //         Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             CircleAvatar(
    //               backgroundColor: Colors.pinkAccent,
    //               radius: 35.0,
    //               child: Icon(Icons.toys, color: Colors.white, size: 30.0,),
    //             ),
    //             SizedBox(height: 15.0,), 
    //             Text('Cosa', style: TextStyle(color: Colors.pink),)
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

}