import 'dart:ui';

import 'package:calix/src/model/breakingbad_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetalleBreakingBadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BreakingBadModel breakingBad =
        ModalRoute.of(context)!.settings.arguments as BreakingBadModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        elevation: 5.0,
        title: Text(
          'ID de personaje: ${breakingBad.charId.toString()}',
          style: TextStyle(fontSize: 22,  shadows: [
            Shadow(
                blurRadius: 10.0,
                color: Colors.pinkAccent,
                offset: Offset(3.0, 2.0),
                ),
            ],
        ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.topCenter,
            children: [
              _ImgBreakingBadFondo(),
              _CirculoImagen(breakingBad),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 1.0, left: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _DatosBreakingBadPortrayed(breakingBad),
                Text(
                  'Mejor conocido en la serie de Breaking Bad como:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                _DatosBreakingBadName(breakingBad),
                Text(
                  'Fecha de nacimiento:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                _DatosBreakingBadBirthday(breakingBad)
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: _botonHome(context),
    );
  }
}

Widget _botonHome(BuildContext context) {
  return FloatingActionButton(
    backgroundColor: Colors.green[800],
    splashColor: Colors.pinkAccent,
    foregroundColor: Colors.black,
    onPressed: () {
      Navigator.pushNamed(context, '/');
    },
    child: Icon(Icons.home),
  );
}

class _DatosBreakingBadName extends StatelessWidget {
  final BreakingBadModel breakingBad;
  _DatosBreakingBadName(this.breakingBad);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        breakingBad.name!,
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      color: Colors.green[800],
    );
  }
}

class _DatosBreakingBadPortrayed extends StatelessWidget {
  final BreakingBadModel breakingBad;
  _DatosBreakingBadPortrayed(this.breakingBad);
  @override
  Widget build(BuildContext context) {
    return Text(
      breakingBad.portrayed!,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class _DatosBreakingBadBirthday extends StatelessWidget {
  final BreakingBadModel breakingBad;
  _DatosBreakingBadBirthday(this.breakingBad);
  @override
  Widget build(BuildContext context) {
    return Text(
      breakingBad.birthday!,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}

class _CirculoImagen extends StatelessWidget {
  final BreakingBadModel breakingBad;
  _CirculoImagen(this.breakingBad);
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: _mediaQuery.width * 1.1,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(breakingBad.img!),
          ),
        ),
      ),
    );
  }
}

class _ImgBreakingBadFondo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return Positioned(
      right: _mediaQuery.width * 0.01,
      top: _mediaQuery.width * -0.20,
      child: Container(
        child: Opacity(
          opacity: 0.3,
          child: Image.asset(
            'assets/cargandoimagen2.gif',
            fit: BoxFit.cover,
            height: _mediaQuery.height * 0.50,
          ),
        ),
      ),
    );
  }
}
