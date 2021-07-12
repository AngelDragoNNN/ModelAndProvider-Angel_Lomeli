import 'package:calix/src/model/breakingbad_models.dart';
import 'package:get/get.dart';
import 'package:calix/src/providers/breakingbad_state.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State {

  @override
  void initState() {
    final breakinBadState = Get.put(BreakingBadState());
    breakinBadState.obtenerPersonajes();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _ImgBreakingBadFondo(),
            _StructuraTargetaBreakingBad(),
          ],
        ),
      ),
      
    );
  }
}

class _StructuraTargetaBreakingBad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BreakingBadState>(
        builder: (BreakingBadState breakingBadState) {
      return GridView.builder(
        itemCount: breakingBadState.personajes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 3, crossAxisSpacing: 4),
        itemBuilder: (BuildContext context, int i) {
          final _breakingBad = breakingBadState.personajes[i];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/detalles',
                arguments: _breakingBad),
            child: Container(
              child: Stack(
                children: [
                  _TargetaBreakingBad(_breakingBad),
                  _ImagenBreakingBad(_breakingBad),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}

class _ImagenBreakingBad extends StatelessWidget {
  final BreakingBadModel _breakingBad;
  _ImagenBreakingBad(this._breakingBad);
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;

    return Positioned(
      bottom: _mediaQuery.width * 0.06,
      right: _mediaQuery.height * 0.04,
      child: Container(
        child: FadeInImage(
          fit: BoxFit.cover,
          height: _mediaQuery.height * 0.11,
          placeholder: AssetImage('assets/cargandoimagen.gif'),
          image: NetworkImage(_breakingBad.img!),
        ),
      ),
    );
  }
}

class _TargetaBreakingBad extends StatelessWidget {
  final BreakingBadModel _breakingBad;
  _TargetaBreakingBad(this._breakingBad);
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: _mediaQuery.height * 0.16,
      width: double.infinity,
      child: Card(
        elevation: 10.0,
        shadowColor: Colors.pinkAccent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Colors.green[800],
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Datos de:',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                _breakingBad.name!,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
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
      bottom: _mediaQuery.width * -.08,
      child: Container(
        child: Opacity(
          opacity: 0.99,
          child: Image.asset(
            'assets/cargandoimagen4.gif',
            fit: BoxFit.cover,
            height: _mediaQuery.height * 0.50,
          ),
        ),
      ),
    );
  }
}
