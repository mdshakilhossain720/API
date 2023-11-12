
import 'package:flutter/material.dart';
import 'package:flutterapptracker/services/servicesstate.dart';
import 'package:flutterapptracker/view/details_screen.dart';

class WorldCounter extends StatefulWidget {
  const WorldCounter({super.key});

  @override
  State<WorldCounter> createState() => _WorldCounterState();
}

class _WorldCounterState extends State<WorldCounter> {
  SearchController searchController=SearchController();

  TextEditingController textEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    StateServices stateServices=StateServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back)),
      ),

      body:Column(
        children: [
          TextFormField(
            controller: textEditingController,
            onChanged: (value){
              setState(() {

              });
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              hintText: 'search for country',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),

              ),
            ),
          ),

          Expanded(
            child: FutureBuilder(future: stateServices.CountryApi(),
                builder: (context,AsyncSnapshot<List<dynamic>>snapshot){
                       if(!snapshot.hasData){
                         return Center(child: CircularProgressIndicator());
                       }else{
                         return ListView.builder(

                             itemCount: snapshot.data!.length,
                             itemBuilder: (context,index){
                               String name=snapshot.data![index]['country'];
                               if(searchController.text.isEmpty){
                                 return Column(
                                   children: [
                                     InkWell(
                                       onTap:(){
                                         Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailsScreen(
                                             image: snapshot.data![index]['country']['flag'],
                                           name: snapshot.data![index]['country'],
                                           todayRecovered: snapshot.data![index]['todayRecovered'],
                                           todayDeaths: snapshot.data![index]['todayDeaths'],
                                           tests: snapshot.data![index]['tests'],
                                           critical: snapshot.data![index]['critical'],
                                           active: snapshot.data![index]['active'],
                                           recovered: snapshot.data![index]['recovered'],
                                           population:snapshot.data![index]['population'],
                                           todayCases: snapshot.data![index]['todayCases'],
                                           totalcase: snapshot.data![index]['totalcase'],



                                         )));
                                       },
                                       child: ListTile(
                                         title: Text(snapshot.data![index]['country'].toString()),
                                         subtitle: Text(snapshot.data![index]['cases'].toString()),
                                         leading: Image(
                                             height: 50,
                                             width: 50,
                                             image: NetworkImage(snapshot.data![index]['countryInfo']['flag'])),
                                       ),
                                     )
                                   ],
                                 );
                               }else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                                 return Column(
                                   children: [
                                     ListTile(
                                       title: Text(snapshot.data![index]['country'].toString()),
                                       subtitle: Text(snapshot.data![index]['cases'].toString()),
                                       leading: Image(
                                           height: 50,
                                           width: 50,
                                           image: NetworkImage(snapshot.data![index]['countryInfo']['flag'])),
                                     )
                                   ],
                                 );
                               }
                               else{
                                 return Container();

                               }


                         });
                       }

            }),
          ),


        ],
      ),
    );
  }
}
