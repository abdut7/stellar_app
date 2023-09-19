import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  late io.Socket _socket;

  // Private constructor for the singleton pattern
  SocketService._private();

  // Singleton instance
  static final SocketService _instance = SocketService._private();

  // Factory constructor to access the singleton instance
  factory SocketService() {
    return _instance;
  }

  void initializeSocket(String serverUrl, String token) {
    _socket = io.io(
      serverUrl,
      io.OptionBuilder()
          .setTransports(['websocket']).setQuery({'token': token}).build(),
    );

    

    _socket.onConnect((_) {
      print('Connected to the Socket.io server');
    });

    _socket.onDisconnect((_) {
      print('Disconnected from the Socket.io server');
    });
  }

  io.Socket get socket => _socket;
}
