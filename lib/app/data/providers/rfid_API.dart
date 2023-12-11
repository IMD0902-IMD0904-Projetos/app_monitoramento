import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:PresenceMonitor/app/data/models/adafruit_get.dart';
import 'package:http/http.dart' as http;


class AdafruitAPI {
  static String username = 'fawnbr';
  static String aioKey = dotenv.env["API_KEY"].toString();
  static String acessoFeed = 'projetomonitoramento.acesso';
  static String alteracaoEstadoFeed = 'projetomonitoramento.alteracaoestado';
  static String mainURL = 'https://io.adafruit.com/api/v2/';

  static Future<AdafruitGETAcesso> getUltimoAcesso() async {
    http.Response response = await http.get(
      Uri.parse('$mainURL$username/feeds/$acessoFeed'),
      headers: <String, String>{'X-AIO-Key': aioKey},
    );
    if (response.statusCode == 200) {
      return AdafruitGETAcesso.fromRawJson(response.body);
    } else {
      throw Error();
    }
  }

  static Future<AdafruitGETEstado> getUltimoEstado() async {
    http.Response response = await http.get(
      Uri.parse('$mainURL$username/feeds/$alteracaoEstadoFeed'),
      headers: <String, String>{'X-AIO-Key': aioKey},
    );
    if (response.statusCode == 200) {
      return AdafruitGETEstado.fromRawJson(response.body);
    } else {
      throw Error();
    }
  }
}