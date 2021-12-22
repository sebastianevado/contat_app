import 'package:contact_app/pages/contacts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blueGrey,
        icon: Icon(Icons.account_circle_outlined),
        onPressed: (){

        },
        label: Text('Sign Up'),
      ),
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
                'assets/image/stackedsteps.png'),
            fit: BoxFit.cover),
      ),
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: NetworkImage(
      //             ''),
      //         fit: BoxFit.cover),
      //   ),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 200.0),
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
              child: _addEmail()),
          Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
              color: Colors.transparent),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
              child: _addPassword()),
          Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
              color: Colors.transparent),
          _signin(),
          Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
              color: Colors.transparent),
        ],
      ),
    ));
  }

  Widget _addEmail() {
    String _email = '';
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'correoejemplo@gmail.com',
        labelText: 'Email ',
        suffixIcon: Icon(Icons.alternate_email),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
        ),
        hintStyle: TextStyle(
          color: Colors.white,

        ),
        labelStyle: TextStyle(
          color: Colors.white,
        ),

        // icon: Icon(Icons.email),
      ),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _addPassword() {
    String _password = '';
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Password',
        labelText: 'Password ',
        suffixIcon: Icon(Icons.lock),
                fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
        ),
        hintStyle: TextStyle(
          color: Colors.white,

        ),
        
        // icon: Icon(Icons.lock_outlined),
      ),
      onChanged: (valor) {
        setState(() {
          _password = valor;
        });
      },
    );
  }

  Widget _signin() {
    return AnimatedContainer(
      padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 10),
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all<Color>(Colors.deepOrangeAccent),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
          shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
        ),
        onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactPage()),
          );
        },
        child: Text('Sign In',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
