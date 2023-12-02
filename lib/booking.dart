import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TableSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Selection'),
      ),
      body: Consumer<TableProvider>(
        builder: (context, tableProvider, _) {
          return GridView.builder(
            itemCount: tableProvider.tables.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0
            ),
            itemBuilder: (BuildContext context, int index){
              var table = tableProvider.tables[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {

                    if (!table.isOccupied) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MenuScreen()),
                      );
                    } else {
                      // Show some message indicating the table is occupied
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Table ${index + 1} is occupied!')),
                      );
                    }
                  },
                  child: Container(
                    height: 150,

                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/ss.jpg'),
                        fit: BoxFit.scaleDown,
                      ),
                      border: Border.all(
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                            top: 5,
                            left: 10,
                            child:  Text(table.isOccupied ? 'Occupied' : 'Open',style: TextStyle(color: table.isOccupied ? Colors.red : Colors.green,fontWeight: FontWeight.bold),))
                      ],
                    ),
                  ),
                ),
              );
            },
          );




        },
      ),
    );
  }
}



class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Center(
        child: Text('Menu Screen'),
      ),
    );
  }
}

class TableModel {
  final int id;
  bool isOccupied;

  TableModel({required this.id, this.isOccupied = false});
}
class TableProvider extends ChangeNotifier {
  List<TableModel> _tables = [TableModel(id: 1,isOccupied:true),
    TableModel(id: 1,isOccupied:true),
    TableModel(id: 2,isOccupied:false),
    TableModel(id: 3,isOccupied:false),
    TableModel(id: 4,isOccupied:true),
    TableModel(id: 5,isOccupied:true),
    TableModel(id: 6,isOccupied:false),
    TableModel(id: 7,isOccupied:true)
  ];

  List<TableModel> get tables => _tables;

  void occupyTable(int tableId) {
    _tables[tableId].isOccupied = true;
    notifyListeners();
  }
}