
import 'package:calix/src/model/breakingbad_models.dart';
import 'package:calix/src/providers/breakingbad_provider.dart';
import 'package:get/get.dart';

class BreakingBadState extends GetxController{
  
  List<BreakingBadModel> personajes = [];
    final breakingBadProvider = BreakingBadProvider();
   
  Future<void> obtenerPersonajes()async{
    personajes.addAll(await breakingBadProvider.obtenerPersonajes());
    update();
  }
}