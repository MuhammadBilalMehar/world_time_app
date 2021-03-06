import 'package:flutter/material.dart';
import 'package:word_time/services/world.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setWorldTime() async {
    WorldTime instance = WorldTime(loc:'Berlin', flag: 'germeny.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.loc,
      'flag': instance.flag,
      'time':instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState(){
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black26,
      body:Padding(padding: EdgeInsets.all(50.0),
      child: Center(
        child:
        SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      ),
      ),
    );
  }
}
