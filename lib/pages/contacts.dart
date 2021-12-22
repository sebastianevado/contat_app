// ignore: unused_import
import 'package:animate_do/animate_do.dart';
import 'package:contact_app/models/reqres_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContactPage extends StatefulWidget {
  ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pinimg.com/originals/b6/40/e4/b640e4a2f9a5b9be08256b0564129454.jpg'),
              radius: 30.0,
              
            ),
          ),
        ],
        title: Text('Contact App', style: TextStyle( color: Colors.black)),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))
          
        ),
        elevation: 0,
        
      ),   
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
                'assets/image/stackedsteps.png'),
            fit: BoxFit.cover),
      ),
        child: FutureBuilder(
              future: getUsuarios(),
              builder:
                  (BuildContext context, AsyncSnapshot<ReqResRespuesta> snapshot) {
                // Haciendo el loading
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical:25.0, horizontal:20.0),
                    child: _ListaUsuarios(snapshot.data!.data)
                    );
                }
              }),
      ),
      
    );
  }

  textStyle() {}
}

class _ListaUsuarios extends StatelessWidget {
  final List<Usuario> usuarios;

  _ListaUsuarios(this.usuarios);

  @override
  Widget build(BuildContext context) {
    print(this.usuarios);
    return ListView.builder(
      itemCount: usuarios.length,
      itemBuilder: (BuildContext context, int index) {
        final usuario = usuarios[index];

        return Card(
          color: Colors.grey.shade200,
          shadowColor: Colors.black,
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(

            children: [
              ListTile(
                title: Text('${usuario.firstName} ${usuario.lastName}'),
                subtitle: Text(usuario.email),
                trailing: CircleAvatar(
                  backgroundImage: NetworkImage(usuario.avatar),
                )
              ),
            ]
          ),
        );

      },
    );
  }
}

Future<ReqResRespuesta> getUsuarios() async {
  final resp = await http.get(Uri.parse('https://reqres.in/api/users/'));
  return reqResRespuestaFromJson(resp.body);
}
