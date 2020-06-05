import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/chooseLocation.dart';
import 'package:worldtimeapp/pages/loading.dart';
import './pages/home.dart';

void main() => runApp(
  MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context)=>Loading(),
      '/home':(context)=>Home(),
      '/location':(context)=>ChooseLocation()
    },
  )
);
