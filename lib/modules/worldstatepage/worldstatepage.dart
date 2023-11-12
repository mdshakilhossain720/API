import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterapptracker/modules/counterworld/world_counter.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../model/worldstate.dart';
import '../../services/servicesstate.dart';
import 'component/resuable_row.dart';
class WorldStatePage extends StatefulWidget {
  const WorldStatePage({super.key});

  @override
  State<WorldStatePage> createState() => _WorldStatePageState();
}

class _WorldStatePageState extends State<WorldStatePage> with TickerProviderStateMixin {


  late final AnimationController _controller =AnimationController(
      duration: Duration(seconds: 3),
      vsync: this)..repeat();

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  final colorlist=<Color>[
    Colors.red,
  Colors.blue,
  Colors.green,

  ];


  @override
  Widget build(BuildContext context) {
    StateServices stateServices=StateServices();
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*.01,),

             FutureBuilder(future: StateServices().fetchworldstate(), builder: (context,AsyncSnapshot<Worldstate>snapshot){
               if(!snapshot.hasData){
                 return Expanded(
                   flex: 1,

                     child: SpinKitFadingCircle(
                       color: Colors.white,
                       size: 50,
                       controller: _controller,
                     )


                 );

               }else{
                 return Column(
                   children: [
                     PieChart(dataMap: {
                       "Total":double.parse(snapshot.data!.cases!.toString()),
                       "Recover":double.parse(snapshot.data!.recovered!.toString()),
                       "Detais":double.parse(snapshot.data!.deaths!.toString()),
                     },
                       chartValuesOptions: ChartValuesOptions(
                         showChartValuesInPercentage: true,
                       ),
                       animationDuration: Duration(milliseconds: 1200),
                       legendOptions: LegendOptions(
                         legendPosition: LegendPosition.left,
                       ),
                       chartType: ChartType.ring,
                       colorList: colorlist,
                     ),
                     SizedBox(height: MediaQuery.of(context).size.height*0.03,),

                     Card(
                       child: Column(
                         children: [
                           ResuableRow(title: 'Total',value: snapshot.data!.cases!.toString(),),
                           ResuableRow(title: 'Total',value: snapshot.data!.deaths!.toString(),),
                           ResuableRow(title: 'Total',value: snapshot.data!.active!.toString(),),
                           ResuableRow(title: 'Total',value: snapshot.data!.active!.toString(),),
                           ResuableRow(title: 'Total',value: snapshot.data!.critical!.toString(),),
                           ResuableRow(title: 'Total',value: snapshot.data!.todayDeaths!.toString(),),
                           ResuableRow(title: 'Total',value: snapshot.data!.todayRecovered!.toString(),),
                         ],
                       ),
                     ),
                     SizedBox(height: MediaQuery.of(context).size.height*.02,),
                     InkWell(
                       onTap:(){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>WorldCounter()));
                       },

                       child: Container(
                         height: 50,
                         decoration: BoxDecoration(
                           color: Colors.green,
                           borderRadius: BorderRadius.circular(10),

                         ),
                         child: Center(
                           child: Text("GO To Country TRACKER "),
                         ),
                       ),
                     )
                   ],
                 );

               }
             }),




            ],
          ),
        ),
      ),
    );
  }
}


