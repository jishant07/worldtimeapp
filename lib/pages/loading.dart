import 'package:flutter/material.dart';
import '../services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupTime() async  {
    WorldTime obj = WorldTime(location: 'Asia',flag: 'kolkata.png',url: 'Asia/Kolkata');
    await obj.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments:{
      'time': obj.time,
      'location': obj.location,
      'flag':obj.flag,
      'isDaytime': obj.isDaytime
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body:Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 80.0,
        ),
      )
    );
  }
}
