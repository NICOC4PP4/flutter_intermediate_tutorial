import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  String _value = "Hello World";
  int counter = 0;
  List<Widget> _list = [];

  void _onClicked() => setState(() => _value = DateTime.now().toString());

  @override
  void initState() {
    for (int i = 0; i < 5; i++) {
      Widget child = _newItem(i);
      _list.add(child);
    }
  }

  void _onClicked2() {
    Widget child = _newItem(counter);
    setState(() => _list.add(child));
  }

  // Widget _newItem(int i) => Text("Item $i");
  Widget _newItem(int i) {
    Key key = Key("item_$i");
    Container child = Container(
      key: key,
      padding: EdgeInsets.all(10.0),
      child: Chip(
        label: Text("$i Name here"),
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: "Delete",
        onDeleted: () => _removeItem(key),
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: Text(i.toString()),
        ),
      ),
    );
    counter++;
    return child;
  }

  // remove the item clicked
  void _removeItem(Key key) {
    for (int i = 0; i < _list.length; i++) {
      Widget child = _list.elementAt(i);
      if (child.key == key) {
        setState(() => _list.removeAt(i));
        print("Removing ${key.toString()}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful Widget"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClicked2,
        child: Icon(Icons.add),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_value),
              IconButton(
                icon: Icon(Icons.timer),
                onPressed: _onClicked,
                tooltip: "Click me",
              ),
              Expanded(
                child: ListView(children: _list),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
