import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool toggleValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('ANIMATED TOGGLE', style: TextStyle(color: Colors.orange)),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          height: 40,
          width: 80.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: toggleValue
                  ? Colors.greenAccent[100]
                  : Colors.redAccent[100].withOpacity(0.5)),
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeIn,
                top: 3.0,
                left: toggleValue ? 40.0 : 0.0,
                right: toggleValue ? 0.0 : 40.0,
                child: InkWell(
                  onTap: toggleButton,
                  child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 1000),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(child: child, scale: animation);
                      },
                      child: toggleValue
                          ? Icon(Icons.check_circle,
                              color: Colors.green, size: 35.0, key: UniqueKey())
                          : Icon(Icons.remove_circle_outline,
                              color: Colors.red,
                              size: 35.0,
                              key: UniqueKey()) //
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  toggleButton() {
    setState(() {
      toggleValue = !toggleValue;
    });
  }
}
