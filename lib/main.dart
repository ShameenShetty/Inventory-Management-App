import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Inventory(),
  ));
}

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  List<String> currentInventory = [
    'garam masala',
    'chole masala',
    'red chilli powder',
    'turmeric powder',
    'kheer powder',
    'potato chips',
    'tortillas',
    'besan flour',
    'rajma'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inventory Management App',
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Arima'),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text('First Text'),
              Text('Second Text'),
              Text('Third Text'),
              ElevatedButton(
                onPressed: () {
                  print("you clicked on the elevated button");
                },
                child: Icon(Icons.mail),
              ),

              // column of quotes, mapping quotes to a list of text widgets
              Column(
                  children: currentInventory
                      .map((inventoryItem) => Text(inventoryItem))
                      .toList()),

              // icon button
              IconButton(
                  iconSize: 50.0,
                  onPressed: () {
                    print("you pressed the icon button\n");
                  },
                  icon: const Icon(Icons.addchart_rounded))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Image.asset('assets/images/add_item_to_inventory.png'),
        onPressed: () {
          print('adding a new item to the inventory');
        },
      ),
    );
  }
}
