import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class CountdownScreen extends StatefulWidget {
  @override
  _CountdownScreenState createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  int _countdown = 15;
  int _randomNumber = 0;
  int _randomNumber2 =0;
  Timer? _timer;

  void startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _timer!.cancel();
          Random rand = Random();
          _randomNumber = 120 + rand.nextInt(5);
          _randomNumber2 = 80 + rand.nextInt(5);
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: Text('     Blood Pressure', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _countdown!=0?
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(child: Text('Turn on Flash Light and keep your finger on the camera', style: TextStyle(fontSize: 20),)),
              ),
              Stack(
                children: [
                  SizedBox(height: 50,),
                  Container(
                    child:Image.network('https://cdn.discordapp.com/attachments/1106511168358588417/1114946003989188618/IMG-20230604-WA0007.jpg'),

                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width/2 - 40,
                    top: MediaQuery.of(context).size.height/5,
                    child: Center(
                      child: Text(
                        '$_countdown ',
                        style: TextStyle(fontSize: 50),
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ):

          Column(
            children: [
              SizedBox(height: 30,),
              Text('Blood Pressure', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
              Stack(
                children: [
                  Container(
                    child:Image.network('https://cdn.discordapp.com/attachments/1106511168358588417/1114946003989188618/IMG-20230604-WA0007.jpg'),

                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width/2 - 50,
                    top: MediaQuery.of(context).size.height/5.5,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            '$_randomNumber',
                            style: TextStyle(fontSize: 40),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: Text(
                              '$_randomNumber2',
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
              Text('Your Blood Pressure is in normal Range', style: TextStyle(fontSize: 15),)
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(_countdown!=0) {
            startCountdown();
          }else{
            setState(() {
              _countdown=15;
              startCountdown();
            });

          }
        },
        child: Icon(Icons.timer),
      ),
    );
  }
}