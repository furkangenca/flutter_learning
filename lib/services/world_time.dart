import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

  String? location; // location name for the UI

  String time = "";

  String? flag; //url to assets flag icon

  String? url; //location url for api endpoint

  bool? isDayTime; //true or false


  WorldTime( {this.location, this.flag, this.url});

  Future<void> getTime() async {

    try {
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      // get prop from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      //create datetime object

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset) ));

      //set the time property
      time = DateFormat.jm().format(now);

      //night or day
      isDayTime = now.hour > 6 && now.hour < 9;

    }

    catch (e) {
      print('caught error: $e');
      time = "couldn't get the data";
    }


  }
}

