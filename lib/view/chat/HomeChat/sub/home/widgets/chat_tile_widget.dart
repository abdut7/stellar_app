import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/controllers/theme_controller.dart';

class ChatListItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final int unreadCount;
  final String avatarUrl;
  final String chatId;
  final VoidCallback ontap;

  const ChatListItem({
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
    required this.avatarUrl,
    required this.chatId,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    if (avatarUrl.contains("undefined") || avatarUrl.isEmpty) {}
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      horizontalTitleGap: 10,
      minVerticalPadding: 0,
      leading: CachedNetworkImage(
        imageUrl: avatarUrl.contains("undefined") || avatarUrl.isEmpty
            ? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
            : avatarUrl,
        imageBuilder: (context, imageProvider) => CircleAvatar(
          backgroundImage: imageProvider,
          radius: 25, // Adjust the size of the avatar
        ),
        placeholder: (context, url) => const CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey,
        ), // Display a placeholder while loading
        errorWidget: (context, url, error) => const Icon(
            Icons.error), // Display an error icon if the image fails to load
      ),
      title: Text(
        name,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: themeController.isDarkTheme.value ? Colors.white : null),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Row(
        children: [
          const Icon(
            Icons.check,
            size: 18,
            color: Colors.grey,
          ),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              message,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color:
                      themeController.isDarkTheme.value ? Colors.white : null),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: Get.width * 0.1,
          )
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            time,
            style: TextStyle(
                color: themeController.isDarkTheme.value ? Colors.white : null),
          ),
          SizedBox(
            height: 5,
          ),
          if (unreadCount > 0)
            CircleAvatar(
              radius: 12,
              backgroundColor: Colors.green, // You can use a different color
              child: Text(
                unreadCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          const Spacer(),
//           SvgPicture.string(
//               """<svg width="22" height="11" viewBox="0 0 22 11" fill="none" xmlns="http://www.w3.org/2000/svg">
// <g clip-path="url(#clip0_126_396)">
// <path d="M0 5.24035C0.0876562 5.06892 0.149531 4.87977 0.268125 4.7352C0.698958 4.21292 1.43458 4.20606 1.92958 4.71406C3.02233 5.83787 4.11182 6.96282 5.19807 8.08892L5.47365 8.37463C5.99786 7.83006 6.50146 7.28492 7.02854 6.76263C9.17965 4.63349 11.3327 2.50777 13.4876 0.385488C13.8354 0.0426311 14.2324 -0.0916546 14.7005 0.0649168C15.4785 0.32606 15.6836 1.29692 15.0855 1.89863C14.3848 2.60377 13.6709 3.29634 12.9657 3.99406C10.7351 6.19406 8.50552 8.39463 6.27687 10.5958C5.93312 10.9386 5.53667 11.0883 5.06974 10.9312C4.88859 10.8656 4.72494 10.7595 4.59135 10.6209C3.16632 9.16263 1.74854 7.69844 0.338021 6.22834C0.191354 6.07463 0.108854 5.85806 0 5.67063V5.24035Z" fill="#50924E"/>
// <path d="M22.0001 1.33958C21.913 1.66129 21.7073 1.89901 21.4741 2.12815C18.6164 4.94072 15.7602 7.7552 12.9056 10.5716C12.3178 11.155 11.695 11.143 11.1146 10.5367C10.8179 10.227 10.5182 9.92072 10.2232 9.60929C9.75454 9.11444 9.74537 8.43844 10.198 8.00244C10.6506 7.56644 11.3238 7.59158 11.8056 8.07901L12.115 8.39387C12.9428 7.53672 13.7478 6.67272 14.5825 5.84015C16.3952 4.03387 18.2349 2.25444 20.0384 0.439009C20.7259 -0.252991 21.7869 0.0692948 21.9685 0.896152C21.976 0.916517 21.9862 0.935751 21.9989 0.953295L22.0001 1.33958Z" fill="#50924E"/>
// </g>
// <defs>
// <clipPath id="clip0_126_396">
// <rect width="22" height="11" fill="white"/>
// </clipPath>
// </defs>
// </svg>
// """)
        ],
      ),
      onTap: () {
        // Handle tapping on the chat list tile
        ontap();
      },
    );
  }
}
