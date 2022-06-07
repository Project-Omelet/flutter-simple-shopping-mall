import 'package:flutter/material.dart';
import 'package:simple_shopping/models/model_item_provider.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);
    return FutureBuilder(
      future: itemProvider.fetchItems(),
      builder: (context, snapshot) {
        if (itemProvider.items.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.5,
              ),
              itemCount: itemProvider.items.length,
              itemBuilder: (context, index) {
                return GridTile(
                  child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/detail',
                            arguments: itemProvider.items[index]);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(itemProvider.items[index].imageUrl),
                            Text(
                              itemProvider.items[index].title,
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                                '${itemProvider.items[index].price.toString()} won',
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.red)),
                          ],
                        ),
                      )),
                );
              });
        }
      },
    );
  }
}
