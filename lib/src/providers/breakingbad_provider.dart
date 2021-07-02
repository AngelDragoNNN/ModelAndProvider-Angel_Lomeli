import 'package:calix/src/model/breakingbad_models.dart';
import 'package:dio/dio.dart';

class BreakingBadProvider {
  final _url = 'https://breakingbadapi.com/api/characters';
  final _http = Dio();

  Future<List<BreakingBadModel>> obtenerPersonajes() async {
    final response = await _http.get(_url);
    List<dynamic> data = response.data;
    return data
        .map((personaje) => BreakingBadModel.transformarInstancia(personaje))
        .toList();
  }
}
