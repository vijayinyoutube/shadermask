import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  double myvalue = 150.0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                elevation: 3.0,
                onPressed: () {
                  showDialog(
                    context: context,
                    child: AlertDialog(
                      title: const Text('Pick a color!'),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: pickerColor,
                          onColorChanged: changeColor,
                          showLabel: true,
                          pickerAreaHeightPercent: 0.8,
                        ),
                        // Use Material color picker:

                        //    MaterialPicker(
                        //     pickerColor: pickerColor,
                        //     onColorChanged: changeColor,
                        //  //   showLabel: true, // only on portrait mode
                        //   ),

                        // Use Block color picker:

                        //  BlockPicker(
                        //   pickerColor: currentColor,
                        //   onColorChanged: changeColor,
                        // ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: const Text('Got it'),
                          onPressed: () {
                            setState(() => currentColor = pickerColor);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Change me'),
                color: currentColor,
                textColor: useWhiteForeground(currentColor)
                    ? const Color(0xffffffff)
                    : const Color(0xff000000),
              ),
              ShaderMask(
                shaderCallback: (bound) {
                  Image.asset(
                    "assets/images/Flutter.png",
                    color: Colors.blue,
                  );

                  return LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomCenter,
                    colors: [
                      (Color.fromRGBO(myvalue.toInt(), myvalue.toInt(),
                          myvalue.toInt(), 0.8)),
                      (Color.fromRGBO(myvalue.toInt(), myvalue.toInt(),
                          myvalue.toInt(), 0.8)),
                    ],
                  ).createShader(bound);
                },
                blendMode: BlendMode.colorBurn,
                child: Image.asset(
                  "assets/images/FlutterLogo.png",
                  fit: BoxFit.cover,
                ),
              ),
              Slider(
                activeColor: Colors.white,
                inactiveColor: Colors.grey,
                value: myvalue,
                min: 10,
                max: 255,
                onChanged: (double value) {
                  setState(() {
                    //seekToSecond(value.toInt());

                    value = value;
                    myvalue = value;
                  });
                },
              ),
              Image.asset(
                "assets/images/FlutterLogo.png",
                color: Colors.indigo,
                colorBlendMode: BlendMode.colorDodge,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
              Image.asset(
                "assets/images/FlutterLogo.png",
                color: Colors.yellow,
                colorBlendMode: BlendMode.colorBurn,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
              Image.asset(
                "assets/images/FlutterLogo.png",
                color: Colors.blue,
                colorBlendMode: BlendMode.color,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
              Image.asset(
                "assets/images/FlutterLogo.png",
                color: Colors.green,
                colorBlendMode: BlendMode.lighten,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
              Image.asset(
                "assets/images/FlutterLogo.png",
                color: Colors.pink,
                colorBlendMode: BlendMode.overlay,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
              Image.asset(
                "assets/images/FlutterLogo.png",
                color: Colors.deepPurpleAccent,
                colorBlendMode: BlendMode.plus,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }
}
