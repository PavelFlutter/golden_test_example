import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_test/avatar.dart';
import 'package:golden_test/test_keys.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, _ ) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );
    });
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Image _avatar_path = Image.asset('assets/images/face.png');

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeAvatar() {
    setState(() {
      _avatar_path = Image.asset('assets/images/face2.png');
    });
  }

  void _removeAvatar() {
    setState(() {
      _avatar_path = Image.asset('assets/images/null.png');
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
            AvatarCircle(
              image: _avatar_path,
            ),
            Container(height: 10.h,),
            ElevatedButton(key: AppKeys.avatar_btn, onPressed: (){ _changeAvatar();}, child: Container(child: Text('change'),)),
            ElevatedButton(key: AppKeys.remove_avatar_btn, onPressed: (){_removeAvatar();}, child: Container(child: Text('remove'),)),
            const Text(
              'You have pushed the button this many times:You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: AppKeys.increment_btn,
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
