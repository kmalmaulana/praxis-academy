import 'package:erico_provider/aplication_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<ApplicationColor>(
        builder: (context) => ApplicationColor(),
        child: Scaffold(
          appBar: AppBar(
            title: Consumer<ApplicationColor>(
              builder: (context, applicationColor, _) => Text(
                'Provider',
                style: TextStyle(color: applicationColor.color),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<ApplicationColor>(
                  builder: (context, applicationColor, _) => AnimatedContainer(
                    margin: EdgeInsets.all(5),
                    width: 100,
                    height: 100,
                    color: applicationColor.color,
                    duration: Duration(milliseconds: 500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text('AB'),
                    ),
                    Consumer<ApplicationColor>(
                      builder: (context, applicationColor, _) => Switch(
                        value: applicationColor.isLightBlue,
                        onChanged: (newValue) {
                          applicationColor.isLightBlue = newValue; 
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text('LB'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
