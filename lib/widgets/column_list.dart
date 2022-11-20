import 'package:flutter/material.dart';
import 'package:koodeck/widgets/koo_tile.dart';

class ColumnList extends StatelessWidget {
  final String title;
  final IconData icon;
  const ColumnList({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(icon),
        title: Text(title),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.all(10),
          child: KooTile(
            child: Text('$index something awesome'),
          ),
        ),
      ),
    );
  }
}
