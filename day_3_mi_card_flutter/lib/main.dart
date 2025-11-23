import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
            // This is for the initial container familiarization
            // child: Container(
            //   margin: EdgeInsets.fromLTRB(30, 100, 0, 0),
            //   padding: EdgeInsets.only(top: 60, left: 70),
            //   height: 140.0,
            //   width: 200.0,
            //   color: Colors.white,
            //   child: Text('I am a hero'),
            // ),

            // The course had a layout challenge that we have to replicate
            // It is commented after completion to give room for the main project
            // but by commenting the others and only keeping this, we can see the desired result
            // https://drive.google.com/uc?export=download&id=1k7oW5qVLJqzw_lEFsOFS_qKmkGjBX1pL
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   crossAxisAlignment: CrossAxisAlignment.stretch,
            //   children: <Widget>[
            //     Container(width: 100.0, color: Colors.red),
            //     Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         Container(width: 100.0, height: 100.0, color: Colors.yellow),
            //         Container(width: 100.0, height: 100.0, color: Colors.green),
            //       ]
            //     ),
            //     Container(width: 100.0, color: Colors.blue),
            //   ]
            // )

            // Now we need to actually build the project, which is all in a column
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              CircleAvatar(
                radius: 50,
                foregroundImage: AssetImage('images/me.jpg'),
              ),
              Text('Arun Chandra Bhusal',
                  style: TextStyle(
                      fontFamily: 'Quantico',
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              Text('Versatile Engineer'.toUpperCase(),
                  style: TextStyle(
                      fontFamily: 'Source Sans 3',
                      fontSize: 23,
                      color: Colors.blue.shade100,
                      fontWeight: FontWeight.bold)),
              // Apparently we can use the toUpperCase() method on string to make it upper case, the course uses upper case directly
              // blue[100] is the same as blue.shade100

              // Now we need the two cards which are containers that contain a row with an icon and some text
              // Container(
              //     color: Colors.white,
              //     margin:
              //         EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              //     padding: EdgeInsets.all(10.0),
              //     child: Row(
              //       children: <Widget>[
              //         Icon(Icons.phone, color: Colors.blue),
              //         SizedBox(width: 10.0),
              //         Text('+977 987-654-3210',
              //             style: TextStyle(
              //                 color: Colors.blue.shade900,
              //                 fontFamily: 'Source Sans 3',
              //                 fontSize: 20.0))
              //       ],
              //     )),
              // Container(
              //     color: Colors.white,
              //     margin:
              //         EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              //     padding: EdgeInsets.all(10.0),
              //     child: Row(
              //       children: <Widget>[
              //         Icon(Icons.email, color: Colors.blue),
              //         SizedBox(width: 10.0),
              //         Text('acb@acb.com',
              //             style: TextStyle(
              //                 color: Colors.blue.shade900,
              //                 fontFamily: 'Source Sans 3',
              //                 fontSize: 20.0))
              //       ],
              //     )),

                  SizedBox(height: 20.0, width: 150.0, child: Divider(color: Colors.blue.shade100)),
              // We can simply use cards instead with ListTile
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: Icon(Icons.phone, color: Colors.blue),
                      title: Text(
                        '+977 987 654 3210',
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontFamily: 'Source Sans 3',
                            fontSize: 20.0),
                      ),
                    )),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: Icon(Icons.email, color: Colors.blue),
                      title: Text(
                        'acb@acb.com',
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontFamily: 'Source Sans 3',
                            fontSize: 20.0),
                      ),
                    )),
              ),
            ])),
      ),
    );
  }
}
