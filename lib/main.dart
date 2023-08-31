import 'package:flutter/material.dart';

/*
* Lake View App
* Step 0: Create a New Project(Lake View App)
Step 1: Download an lakeview image and add it to your project.
Add Image in pubspec.yml

Step 2: Replace/Remove the default Main.dart code

Step 3: Create a Class with  Widget state

Step 4: Create a subclass to maintain State

Step 5: Plug the stateful widget into the widget tree.
* */
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: EdgeInsets.all(30),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'Kandersteg Switzerland',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          FavWidget()
        ],
      ),
    );

    Widget buttonSection = SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
          _buildButtonColumn(Colors.blue, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(Colors.blue, Icons.share, 'SHARE')
        ],
      ),
    );

    Widget textSection = Container(
      padding: EdgeInsets.all(32),
      child: const Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lake View App'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/lake_view.jpg',
              width: 600,
              height: 250,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: color),
          ),
        )
      ],
    );
  }
}

class FavWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavWidgetState();
}

class _FavWidgetState extends State<FavWidget> {
  int _counter = 40;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
    );

    return Row(
      mainAxisSize: MainAxisSize.min,

      children: [
        const Align(
          child: Icon(Icons.favorite),
          alignment: Alignment.centerRight,
        ),
        // const Text(
        //   'You have pushed the button this many times:',
        // ),

        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
