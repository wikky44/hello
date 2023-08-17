import 'package:flutter/material.dart';
import 'package:minto/homescreen.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  List tables = [
    "Table 1",
    "Table 2",
    "Table 3",
    "Table 4",
  ];
  List mylist = [];
bool checkbox=false;



  bool checkinlist(int index) {
    bool yes = false;
    for (int i = 0; i < mylist.length; i++) {
      if (mylist[i] == index) {
        yes = true;
        return yes;
      }
    }
    return yes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: tables.length,
            itemBuilder: (BuildContext ctx, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _showDialog(context);
                    mylist.add(index);
                  });

                },

                child: Container(
                  width: 150,
                  height: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: checkinlist(index) ? Colors.green : Colors.grey,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text("${tables[index]}"),
                ),
              );
            }),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    List foods = [
      "Chicken Biriyani",
      "Kuzhi Mandhi",
      "Shawarma Plate",
      "Shawarma Roll",
    ];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: 300,
            height: 200,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: foods.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Checkbox(
                      value: checkbox,
                      onChanged: (value) {
                        setState(() {
                          checkbox=value!;

                        });
                      },
                    ),


                  );
                }),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 50, right: 80, bottom: 10),
              child: ElevatedButton(
                child: Text("continue"),
                onPressed: () {
                  Navigator.pop(context);

                }, style: ElevatedButton.styleFrom(
                  primary: Colors.green
              ),
              ),
            ),
          ],
        );
      },
    );
  }
}