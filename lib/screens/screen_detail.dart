import 'package:flutter/material.dart';
import 'package:simple_shopping/models/model_item.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: ListView(
        children: [
          Image.network(item.imageUrl),
          const Padding(padding: EdgeInsets.all(3)),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Text(
              item.title,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${item.price.toString()} won',
                      style: const TextStyle(fontSize: 18, color: Colors.red),
                    ),
                    Text(
                      'Brand: ${item.brand}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Register date: ${item.registerDate}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: const [
                      Icon(
                        Icons.add,
                        color: Colors.blue,
                      ),
                      Text(
                        'Add',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Text(item.description, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
