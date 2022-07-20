import 'package:flutter/material.dart';
import 'Inventory/inventory.dart';

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
  List<InventoryItem> currentInventory = [
    InventoryItem(
        itemName: 'picture 1', itemPicture: 'https://i.imgur.com/pFMWm6g.jpg'),
    InventoryItem(
        itemName: 'picture 2', itemPicture: 'https://i.imgur.com/tdfKRg3.jpeg'),
    InventoryItem(
        itemName: 'picture 3', itemPicture: 'https://i.imgur.com/HEVIZaA.jpeg'),
    InventoryItem(
        itemName: 'picture 4', itemPicture: 'https://i.imgur.com/FyQvCTP.jpeg'),
    InventoryItem(
        itemName: 'picture 5', itemPicture: 'https://i.imgur.com/qgcPQF3.jpeg'),
    InventoryItem(
        itemName: 'picture 6', itemPicture: 'https://i.imgur.com/anshnRQ.jpeg'),
    InventoryItem(
        itemName: 'picture 7', itemPicture: 'https://i.imgur.com/wckJYjk.jpeg'),
  ];

  Widget inventoryCardTemplate(itemName, itemPicture) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.amber.shade50,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 5.0),
      child: Row(
        children: [
          const SizedBox(width: 15),
          Image(
            isAntiAlias: true,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            image: NetworkImage('$itemPicture'),
            width: 150,
            height: 150,
          ),
          const SizedBox(
            width: 15,
          ),
          Text('$itemName',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Arima',
                fontSize: 18,
                color: Colors.grey[800],
              ))
        ],
      ),
    );
  }

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
              const Text('First Text'),
              const Text('Second Text'),
              const Text('Third Text'),
              ElevatedButton(
                onPressed: () {
                  print("you clicked on the elevated button");
                },
                child: Icon(Icons.mail),
              ),

              // column of quotes, mapping quotes to a list of text widgets
              Column(
                  children: currentInventory
                      .map((inventoryItem) => inventoryCardTemplate(
                          inventoryItem.itemName, inventoryItem.itemPicture))
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
