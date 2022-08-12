import 'package:flutter/material.dart';
import 'package:inventory_management_app/Inventory/inventory.dart';

class InventoryCard extends StatelessWidget {
  final InventoryItem invItem;
  final Function delete;

  InventoryCard({required this.invItem, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.amber.shade50,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 5.0),
      child: Column(
        children: [
          Row(
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
                image: NetworkImage(invItem.itemPicture),
                width: 150,
                height: 150,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(invItem.itemName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Arima',
                    fontSize: 18,
                    color: Colors.grey[800],
                  )),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton.icon(
                onPressed: () {
                  delete();
                  print('removing the item "$invItem.itemName"');
                },
                icon: const Icon(Icons.delete),
                label: const Text('Delete')),
            const SizedBox(
              width: 15,
            ),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit),
                label: const Text('Edit')),
          ]),
        ],
      ),
    );
  }
}
