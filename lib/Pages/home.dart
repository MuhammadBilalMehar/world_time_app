import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};


  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    // print(data);

    String bgimage = data['isDayTime'] ? 'day.jpg':'night.jpg';
    

    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgimage'),
            fit:BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: SafeArea(
              child:Column(
                children: <Widget>[
                  ElevatedButton.icon(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState((){
                          data = {
                            'time': result['time'],
                            'location': result['loc'],
                            'isDayTime' : result['isDayTime'],
                            'flag': result['flag'],
                          };
                        });
                      },
                      icon: const Icon(Icons.edit_location),
                      label:const Text("Edit Location")),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                      data['location'],
                      style: const TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        letterSpacing: 2.0,
                      ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style:const TextStyle(
                      color: Colors.white,
                      fontSize: 60.0,
                    ),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}
