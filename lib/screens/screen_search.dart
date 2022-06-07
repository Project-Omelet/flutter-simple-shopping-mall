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
      body: const Center(
        child: Text('Search?'),
      ),
    );
  }
}
