import 'package:base_project/services/socket_service/socket_service.dart';
import 'package:socket_io_client/socket_io_client.dart';

class PrivateChatService {
  static void sentPersonalTextMessage(String chatId, String message) {
    print(chatId);
    print(message);
    Socket socket = SocketService().socket;

    socket.emit('send_message', {
      'strChatId': chatId,
      'strMessage': message,
      "strMessageType": "text",
      "strType": "private",
    });
  }

  static void recievePersonalMessage() {
    Socket socket = SocketService().socket;
    print(socket.connected);
    socket.on('get_message', (data) {
      // Print the received message as a JSON string
      print('Server says: ${data.toString()}');
    });
  }
}