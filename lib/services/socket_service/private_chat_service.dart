import 'package:base_project/services/socket_service/socket_service.dart';
import 'package:socket_io_client/socket_io_client.dart';

class PrivateChatService {
  static void sentPersonalMessage(String chatId, String message) {
    Socket socket = SocketService().socket;
    socket.emit('send_message', {'strChatId': chatId, 'strMessage': message});
  }
}
