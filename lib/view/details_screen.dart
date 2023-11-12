import 'package:flutter/material.dart';
import 'package:flutterapptracker/modules/worldstatepage/component/resuable_row.dart';
class DetailsScreen extends StatefulWidget {
  String name;
  String image;
  int totalcase,todayDeaths,todayCases,recovered,todayRecovered,active,critical,tests,population;
   DetailsScreen({
    required this.name,required this.image,
    required this.todayRecovered,required this.todayDeaths,
    required this.tests,
    required this.critical,
    required this.active,
    required this.recovered,
    required this.population,
    required this.todayCases,
    required this.totalcase,

    super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name),),


      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Card(
                child: Column(
                  children: [
                    ResuableRow(title: 'Case',value: widget.totalcase.toString(),),
                    ResuableRow(title: 'totalcase',value: widget.todayDeaths.toString(),),
                    ResuableRow(title: 'population',value: widget.population.toString(),),
                    ResuableRow(title: 'active',value: widget.active.toString(),),
                    ResuableRow(title: 'critica',value: widget.critical.toString(),),
                    ResuableRow(title: 'tests',value: widget.tests.toString(),),
                    

                  ],
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )

        ],
      ),

    );
  }
}
