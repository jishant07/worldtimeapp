import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map arguments = {};

  @override
  Widget build(BuildContext context) {

    arguments = arguments.isNotEmpty ? arguments : ModalRoute.of(context).settings.arguments ;
    String bgImage = arguments['isDaytime'] ? 'day.jpeg' : 'night.jpeg';
    Color color = Colors.white;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('./assets/$bgImage'),
              fit: BoxFit.cover
            )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      dynamic res = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        arguments = {
                          'time': res['time'],
                          'location': res['location'],
                          'isDaytime': res['isDaytime'],
                          'flag': res['flag'],
                        };
                      });
                    },
                    icon: Icon(
                        Icons.edit_location,
                      color: Colors.grey,
                    ),
                    label: Text(
                        "Edit Location",
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 20.0
                      ),
                    )
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        arguments['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: color
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
                Text(
                  arguments['time'],
                  style: TextStyle(
                      fontSize: 66.0,
                    color: color
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
