import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey
      ),
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _view = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: <Widget>[
            SideBar(
              view: _view,
              onTap: (selectedView) => setView(selectedView)
            ),
            Content(view: _view)
          ],
        ),
      )
    );
  }

  setView(String view) {
    setState(() {
      _view = view;
    });
  }
}

class SideBar extends StatelessWidget {
  final String view;
  final Function(String) onTap;

  SideBar({this.view, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.2,
      color: Color(0xffeeeeee),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Color(0xffdddddee),
              foregroundColor: Colors.white70,
              child: Text(
                'B',
                style: TextStyle(
                  fontSize: 100.0,
                  fontWeight: FontWeight.bold
                )
              ),
              radius: 100.0
            ),
            Text('BENJAMIN UDOH'),
            buildNav('HOME', 'home'),
            buildNav('ABOUT ME', 'about'),
            buildNav('RESUME', 'resume'),
            buildNav('CONTACT ME', 'contact'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(Icons.face),
                Icon(Icons.shopping_cart),
                Icon(Icons.whatshot)
              ]
            )
          ]
        )
      )
    );
  }

  Widget buildNav(String label, String view) {
    return GestureDetector(
      child: Text(
        label,
        style: TextStyle(
          color: this.view == view ? Colors.blue : Colors.black,
          fontSize: this.view == view ? 18.0 : 14.0
        )
      ),
      onTap: () => this.onTap(view)
    );
  }
}

class Content extends StatelessWidget {
  final String view;

  Content({this.view});

  @override
  Widget build(BuildContext context) {
    if (this.view == 'home') {
      return Home();
    } else return Center(
      child: Text(this.view)
    );
    // return this.view == 'home' ? Home() : SizedBox();
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.network('assets/bg.jpg'),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Benjamin Udoh',
              style: TextStyle(
                color: Colors.white,
                wordSpacing: 5.0,
                fontSize: 48.0
              )
            ),
            Text(
              'I am a FullStack Software Developer (mostly backend)',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0
              )
            )
          ]
        )
      ]
    );
  }
}

enum View {
  Home, About, Resume
}
