import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intern2/WelcomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _errorText = '';
  String _validage = '';

  void _validateAge(String value) {
    final int? age = int.tryParse(value);

    if (age != null && (age < 18 || age > 25)) {
      setState(() {
        _errorText = 'Age must be between 18 and 25.';
      });
    }
    else if(age == null && (age! > 18 || age < 25)) {
      setState(() {
        _validage = 'You are not eligible';
      });
    }
    else {
      setState(() {
        _errorText = Null as String;
      });
    }
  }
  TextEditingController _name = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _phone = new TextEditingController();
  TextEditingController _age = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Name'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Email'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter PhoneNumber'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _age,
                onChanged: _validateAge,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Age',
                  errorText: _errorText,
                ),
              ),
            ),
            SizedBox(height: 28,),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>WelcomePage(name: _name.text, email: _email.text, phone: _phone.text, age: _age.text)
                  )
              );
            }, child: Text('Go to Second Page'))
          ],
        )
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('_errorText', _errorText));
  }
}