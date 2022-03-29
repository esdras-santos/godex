import 'package:flutter/material.dart';

class Proposals extends StatefulWidget {
  const Proposals({ Key? key }) : super(key: key);

  @override
  State<Proposals> createState() => _ProposalsState();
}

class _ProposalsState extends State<Proposals> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Text(_items[index]["id"]),
              title: Text(_items[index]["name"]),
              subtitle: Text(_items[index]["description"]),
            ),
          );
        },
      ),
    );
  }
}