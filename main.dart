import 'package:flutter/material.dart';
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
        child : ElevatedButton(
          onPressed: _fonlsiyonadi, // bir fonksiyon tetikler
          child: Text('GİT'), // Buton üzerindeki yazıyı belirler
        ),
      ),
    );
  }
}


class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  late String GelenID;
  Future<void> MusteriID_Getir() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      GelenID = sharedPreferences.getString("GELENID") ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    MusteriID_Getir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EXZAMPLE"),
      ),
      body:  Center(
        child: Text(GelenID,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
