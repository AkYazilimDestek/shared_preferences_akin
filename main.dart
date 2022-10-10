import 'package:flutter/material.dart';
import 'SecondRoute.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : _Vucut(),
    );
  }
}


class _Vucut extends StatefulWidget {
  const _Vucut({Key? key}) : super(key: key);

  @override
  State<_Vucut> createState() => _VucutState();
}

class _VucutState extends State<_Vucut> {

  Future<void> _fonlsiyonadi() async {
     var sharedPreferences = await SharedPreferences.getInstance();
     sharedPreferences.setString("GELENID", "182");
     Navigator.push(
       context,
       MaterialPageRoute(builder: (context) => const SecondRoute()),
     );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("shared_preferences"),
      ),
      body : Center(
        child :  RaisedButton(
          onPressed: _fonlsiyonadi, // bir fonksiyon tetikler
          textColor: Colors.white, // Yazı rengi
          color: Colors.green,
          padding: const EdgeInsets.all(0.0), // içten boşluk
          child: Text('BUTTON'), // Buton üzerindeki yazıyı belirler
        ),
      ),
    );
  }
}

