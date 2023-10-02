import 'package:stellar_chat/services/socket_service/socket_service.dart';

void sentRoomJoinSocket({required String chatId, required String type}) {
  SocketService socketService = SocketService();
  socketService.socket.emit('join_room', {
    'strChatId': chatId,
    'strType': type,
  });
}

void sentRoomLeftSocket() {}
