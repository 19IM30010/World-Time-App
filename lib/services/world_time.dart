import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDaytime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    //make the request
    Response response = await get('https://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    //print(data);
    // get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    // print(datetime);
    //print(offset);
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    isDaytime =  now.hour >5 && now.hour<18 ? true : false ;
    time = DateFormat.jm().format(now);
  }
}
