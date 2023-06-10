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
  int _randomTile = 0;
  int _correctTile = 0;

  int generateRandomNumber() {
    //generate a random number between 0 and 8
    int _randomTile = DateTime.now().millisecond % 8;
    return _randomTile;
  }

  @override
  void initState() {
    super.initState();
    // print this number to console
    _randomTile = generateRandomNumber();
    // print to console
    print(_randomTile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tile Game"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(9, (index) {
                  return Container(
                    child: ElevatedButton(
                      onPressed: () {
                        //if the user clicks on the correct tile
                        if (index == _correctTile) {
                          //print to console
                          print("Correct");
                          //generate a new random number
                          _correctTile = generateRandomNumber();
                          //print to console
                          print(_correctTile);
                          //update the UI
                          setState(() {});
                        } else {
                          //print to console
                          print("Incorrect");
                        }
                      },
                      child: Text("Tile $index"),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
