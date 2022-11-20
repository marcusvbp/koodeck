import 'package:flutter/material.dart';
import 'package:koodeck/widgets/column_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Koodeck',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Koodeck'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();

  List<Widget> columns = [
    const ColumnList(title: 'Koos', icon: Icons.add_comment),
    const ColumnList(title: 'Replies', icon: Icons.comment),
    const ColumnList(title: '#something', icon: Icons.alarm_on),
    const ColumnList(title: '#something', icon: Icons.alarm_on),
    const ColumnList(title: '#something', icon: Icons.alarm_on),
  ];

  void _updateColumns(int oldPos, int newPos) {
    setState(() {
      var column = columns[oldPos];
      columns.removeAt(oldPos);
      columns.insert(newPos > oldPos ? newPos - 1 : newPos, column);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 72,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CircleAvatar(
            child: Icon(Icons.person),
          ),
        ),
        title: Text(
          widget.title,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Row(
          children: [
            NavigationRail(
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person),
                  label: Text('Contacts'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.message),
                  label: Text('Messages'),
                ),
              ],
              selectedIndex: 0,
            ),
            const VerticalDivider(
              thickness: 1,
              width: 1,
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Scrollbar(
                    thumbVisibility: true,
                    controller: _scrollController,
                    child: ReorderableListView(
                      scrollController: _scrollController,
                      scrollDirection: Axis.horizontal,
                      onReorder: _updateColumns,
                      buildDefaultDragHandles: true,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        for (final column in columns)
                          Container(
                            width: constraints.maxWidth / 3,
                            key: ValueKey(columns.indexOf(column)),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: column,
                          )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
