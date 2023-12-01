import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChatAppBarTitleWidget extends StatelessWidget {
  final String name;
  final bool isOnline;
  final String? profileImage;

  const ChatAppBarTitleWidget({
    super.key,
    required this.name,
    required this.isOnline,
    this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: SvgPicture.string(
              """<svg width="44" height="44" viewBox="0 0 44 44" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M25.6095 13.0575C26.1302 13.5782 26.1302 14.4224 25.6095 14.9431L18.5523 22.0003L25.6095 29.0575C26.1302 29.5782 26.1302 30.4224 25.6095 30.9431C25.0888 31.4638 24.2446 31.4638 23.7239 30.9431L15.7239 22.9431C15.2032 22.4224 15.2032 21.5782 15.7239 21.0575L23.7239 13.0575C24.2446 12.5368 25.0888 12.5368 25.6095 13.0575Z" fill="white"/>
              </svg>
              """),
        ),
        CachedNetworkImage(
          imageUrl: profileImage ?? "",
          imageBuilder: (context, imageProvider) => CircleAvatar(
            backgroundImage: imageProvider,
            radius: 20,
          ),
          placeholder: (context, url) => const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          errorWidget: (context, url, error) => const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.error,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        Flexible(
          child: Text(
            name,
            style: const TextStyle(
                fontFamily: 'Inter', fontSize: 16, color: Color(0xFF2E3192)),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
