import 'package:flutter/material.dart';
import 'package:inventory_management_app/Inventory/inventory.dart';
import 'package:inventory_management_app/main.dart';

class AddNewInventoryItem {
  String itemPicture = '';
  String itemName = '';

  Widget addNewItemPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Item to Inventory',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Arima',
              fontSize: 20,
              color: Colors.purple[800],
            )),
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.amber.shade50,
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: Column(children: [
                // Adding item picture link
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    onChanged: (text) {
                      print('text field item picture: $text');
                      itemPicture = text;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Add the item\'s picture',
                    ),
                  ),
                ),

                // Adding item description or name
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    onChanged: (text) {
                      print('text field item description: $text');
                      itemName = text;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Add the item name or description',
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add a new item with the entered details then navigate back to first route when tapped.
                    print(
                        'adding the item to the inventory, name is $itemName, pic link is $itemPicture');

                    InventoryItem invItem = InventoryItem(
                        itemName: itemName, itemPicture: itemPicture);

                    /**
                     * TODO -
                     * After checking to make sure the textfields are not empty,
                     * on onpress, pass a func as an arg to add an item to the 
                     * list, then context.pop to go back to the page
                     */

                    Navigator.pop(context);
                  },
                  child: const Text('Add Item'),
                ),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate back to first route when tapped.
                    Navigator.pop(context);
                  },
                  child: const Text('Exit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
