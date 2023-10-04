import 'package:share_plus/share_plus.dart';

void shareLink(String link) {
  Share.share(link, subject: 'Get to Stellar Chat');
}
