import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  int bodyPercent = 59;
  int mindPercent = 25;
  int spiritPercent = 16;
  Color bodyColor = Color.fromRGBO(203, 220, 65, 50);
  Color mindColor = Color.fromRGBO(130, 77, 214, 50);
  Color spiritColor = Color.fromRGBO(60, 119, 217, 50);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  _indicatorBlock(int flex, Color color,
      {double tL = 0, double bL = 0, double tR = 0, double bR = 0}) {
    return Flexible(
      flex: flex,
      fit: FlexFit.tight,
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(tL),
              topRight: Radius.circular(tR),
              bottomLeft: Radius.circular(bL),
              bottomRight: Radius.circular(bR),
            )),
        height: 20,
      ),
    );
  }

  _progresIndicator() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          _indicatorBlock(
            widget.bodyPercent,
            widget.bodyColor,
            tL: 25,
            bL: 25,
          ),
          _indicatorBlock(widget.mindPercent, widget.mindColor),
          _indicatorBlock(widget.spiritPercent, widget.spiritColor,
              tR: 25, bR: 25),
        ],
      ),
    );
  }

  _indicatorHistory() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _colorDot(widget.bodyColor),
              Container(child: Text("Body ${widget.bodyPercent} %")),
            ],
          ),
          Row(
            children: [
              _colorDot(widget.mindColor),
              Container(child: Text("Mind ${widget.mindPercent} %")),
            ],
          ),
          Row(
            children: [
              _colorDot(widget.spiritColor),
              Container(child: Text("Spirit ${widget.spiritPercent} %")),
            ],
          ),
        ],
      ),
    );
  }

  _colorDot(Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 8,
        width: 8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: color),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Health balance",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              Row(
                children: [
                  const Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "Last week",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/double_arrow.png',
                      color: Colors.white,
                      height: 18,
                      width: 18,
                    ),
                  ),
                ],
              )
            ],
          ),
          body: Container(
            height: 100,
            child: Card(
              child: Column(
                children: [
                  _indicatorHistory(),
                  _progresIndicator(),
                ],
              ),
            ),
          )),
    );
  }
}
