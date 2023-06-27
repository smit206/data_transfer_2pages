import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {

  String name, email, phone, age;


  WelcomePage({required this.name,required this.email,required this.phone,required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Column(
        children: [Text('Email: ${email}'),
          Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('User Details'),
                      content: Text('Name: ${name}\nEmail: ${email}\nPhone: ${phone}\nAge: ${age}'),

                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Show Details'),
            ),
          ),
        ],
      ),
    );
  }
}




// Widget build(BuildContext context) {
//   return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Name: ${name}'),
//             Text('Email: ${email}'),
//             Text('Phone: ${phone}'),
//             Text('Age: ${age}'),
//           ],
//         ),
//       )
//   );
// }