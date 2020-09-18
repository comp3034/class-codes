import 'package:app_exemplo/feature/home/screens/home_screen.dart';
import 'package:app_exemplo/feature/login/screens/login_screen.dart';
import 'package:app_exemplo/feature/message/screens/message_screen.dart';
import 'package:app_exemplo/feature/register/screens/register_screen.dart';
import 'package:app_exemplo/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  // Intl.defaultLocale = 'pt_BR';

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: AppColors.red,
        accentColor: AppColors.red,
        fontFamily: 'Lato',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          elevation: 3,
        ),
      ),
      debugShowCheckedModeBanner: false,
      // home: LoginScreen(),
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginScreen(),
        'register': (context) => RegisterScreen(),
        'home': (context) => HomeScreen(),
        'message': (context) => MessageScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Você pressionou o botão:',
            ),
            Text(
              '$_counter',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 36,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.access_alarms),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
