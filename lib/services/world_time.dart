import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time;
  String flag;
  String url;
  bool isDaytime;

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async
  {
    try {
      Response res = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(res.body);

      String hours = data['utc_offset'].substring(1,3);
      String minutes = data['utc_offset'].substring(4);
      String dateTime = data['datetime'];

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(hours),minutes: int.parse(minutes)));

      isDaytime = now.hour > 6 && now.hour <20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print("Error Caught $e");
      time = "Error in the URL";
    }
  }

}

