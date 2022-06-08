import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(ElBarrio());
class ElBarrio extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/17.jpg'),
            fit: BoxFit.cover
          ),
        ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            title: Text('El barrio de los animalitos'),
          elevation: 20,
          backgroundColor: Colors.purple.shade200,
          leading: Container(
            child: Image.asset('assets/17.jpg'),
          ),
        ),
        body: Barrio(),
      ),
    ),
    );
  }
}

class Barrio extends StatefulWidget {
  @override
  State<Barrio> createState() => _BarrioState();
}

class _BarrioState extends State<Barrio> {
  @override

  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1),
        scrollDirection: Axis.vertical,
        itemCount: 17,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context){
                 return PaginaImagen(index);
                    },
                ),
              );
            },
            child: Image.asset('assets/$index.jpg'),

          );
        },
    );
  }
}

class PaginaImagen extends StatelessWidget {
  final index;
  PaginaImagen(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
        appBar: AppBar(
          title: Text('Mas información'),
            backgroundColor: Colors.purple.shade200,
        ),
      body: SingleChildScrollView(
          child: Column(
          children: [
            Container(
              child: Text('Disponible: \n', style: TextStyle(fontSize: 20)),
            ),
            Container(
              child: Text('Prenda: \nPrecio: \n', style: TextStyle(fontSize: 20)),
            ),
            Container(
            child: Image.asset('assets/$index.jpg'),
          ),
            Container(
              child: Text('Contacto: ', style: TextStyle(fontSize: 20, )),
            ),
            Container(
              child: InkWell(
                child: Text('@elbarriodelosanimalitos', style: TextStyle(fontSize: 30)),
                onTap: () => launch('https://www.instagram.com/elbarriodelosanimalitos/'),
              ),
            ),
        ]
        ),
      ),
    );
  }
}
