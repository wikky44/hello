import 'package:flutter/material.dart';
import 'package:minto/booking.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
   List hotels=[
     "Malabar"
   ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Hotels"),
      ),
       body: ListView(
         children: [
           Center(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: SizedBox(
                 width: 500,
                 height: 70,
                 child: ListView.builder(
                     itemCount:hotels.length,
                     itemBuilder: (BuildContext context, int index) {
                       return     Card(
                         child: ListTile(
                             leading: Icon(Icons.house
                             ),
                             isThreeLine: true,
                             title: Text("${hotels[index]}"),
                             subtitle:Text("Book your Seats"),
                             trailing:Padding(
                               padding: const EdgeInsets.only(top: 15),
                               child: Icon(Icons.arrow_forward_ios_outlined,size: 14,),
                             ),
                             onTap: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => Booking()),
                               );
                             }


                         ),
                       );
                     }),
               ),
             ),
           ),

         ],
       ),


    );
  }
}
