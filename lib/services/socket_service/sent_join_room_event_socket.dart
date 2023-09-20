import 'package:base_project/services/socket_service/private_chat_service.dart';
import 'package:base_project/services/socket_service/socket_service.dart';

void sentRoomJoinSocket({required String chatId, required String type}) {
  SocketService socketService = SocketService();
  socketService.socket.emit('join_room', {
    'strChatId': chatId,
    'strType': type,
  });
  PrivateChatService.recievePersonalMessage();
}

void sentRoomLeftSocket() {}
