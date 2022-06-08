import 'package:flutter/material.dart';
import 'package:simple_shopping/models/model_item_provider.dart';
import 'package:simple_shopping/models/model_query.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);
    final searchQuery = Provider.of<SearchQuery>(context);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            TextField(
              onChanged: (text) {
                searchQuery.updateText(text);
              },
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Input search word',
                border: InputBorder.none,
              ),
              maxLines: 1,
              cursorColor: Colors.grey,
              cursorWidth: 1.5,
            )
          ],
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {
              itemProvider.search(searchQuery.text);
            },
          )
        ],
      ),
      body: Column(children: [
        Expanded(
            child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.5,
          ),
          itemCount: itemProvider.searchItems.length,
          itemBuilder: (BuildContext context, int index) {
            return GridTile(
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/detail',
                          arguments: itemProvider.searchItems[index]);
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                                itemProvider.searchItems[index].imageUrl),
                            Text(itemProvider.searchItems[index].title,
                                style: const TextStyle(fontSize: 18)),
                            Text(
                              '${itemProvider.searchItems[index].price.toString()} won',
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.red),
                            ),
                          ],
                        ))));
          },
        ))
      ]),
    );
  }
}
