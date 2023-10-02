import 'package:stellar_chat/services/token_service/token_service.dart';

Future<Map<String, dynamic>> getHeader() async {
  String? token = await getJwtToken();
  Map<String, dynamic> headers = {
    'Accept': '*/*',
    'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
    'Content-Type': 'application/json',
    'Authorization': token,
  };
  return headers;
}
