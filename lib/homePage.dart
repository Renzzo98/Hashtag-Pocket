import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:hashtag_generator/common/hashtag_generator.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  HomePage();

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> hashArr = [];
  bool visible = false;
  double _currentSliderValue = 5;

  void _updateHashTags() {
    setState(() {
      var generator = HashtagGenerator();
      List<String> tempArr =
          generator.grabRandomHashes(_currentSliderValue.toInt());
      hashArr = List<String>.from(tempArr);
      visible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.background,
          centerTitle: false,
          title: Text(
            "Hashtag Pocket",
            textAlign: TextAlign.start,
            style: GoogleFonts.cairo(
              fontSize: 30,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        body: Center(
            child: Column(children: [
          visible
              ? Expanded(
                  child: ListView.builder(
                      itemCount: hashArr.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('${hashArr[index]}'),
                        );
                      }),
                )
              : Expanded(
                  child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Press Generate to Create Hashtags",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    )
                  ],
                )),
          Column(
            children: [
              Slider(
                value: _currentSliderValue,
                min: 0,
                max: 20,
                divisions: 5,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _updateHashTags(),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.only(bottomLeft: Radius.circular(6)),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        height: 80,
                        child: Center(
                          child: Text(
                            'Generate',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mavenPro(
                                color: Theme.of(context).colorScheme.background,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      // Create an inner BuildContext so that the onPressed methods
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () => {
                            Clipboard.setData(new ClipboardData(
                                text: hashArr
                                    .toString()
                                    .replaceAll(RegExp("\\[|\\]"), ''))),
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Hashtags Copied'))),
                                    
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Theme.of(context).primaryColor,
                                    Color.fromARGB(255, 249, 133, 98)
                                  ]),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(6)),
                            ),
                            height: 80,
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'Tap to Copy',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mavenPro(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          )
        ])));
  }
}
