import 'dart:async';

import 'dart:math'as math;

import 'package:flutter/material.dart';


import '../modules/worldstatepage/worldstatepage.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with TickerProviderStateMixin{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    WorldStatePage()
            )
        )
    );




  }

  late final AnimationController _controller =AnimationController(
    duration: Duration(seconds: 3),

      vsync:this)..repeat();

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
          AnimatedBuilder(animation: _controller,
              child: Container(
                height: 200,
                width: 200,
                child: Center(
                  child: Image.asset("assets/image/virus.jpg"),
                ),

              ),

              
              builder: (BuildContext context,Widget? child){
                 return Transform.rotate(angle: _controller.value*2*0*math.pi,child: child,);
          }),
          // SizedBox(height: MediaQuery.of(context).size.height*.0,),
           Align(
               alignment: Alignment.center,
               child: Text("Covid 19\n Tracker",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),

         ],
       ),
      ),
    );
  }
}
