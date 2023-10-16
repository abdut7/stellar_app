import 'package:intl/intl.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/View/channel/channel_view/channel_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoCard extends StatefulWidget {
  final String? thumbnileUrl;
  final String userProfileUrl;
  final String duration;
  final String title;
  final String views;
  final DateTime time;
  const VideoCard({
    Key? key,
    required this.thumbnileUrl,
    required this.userProfileUrl,
    required this.duration,
    required this.title,
    required this.views,
    required this.time,
  }) : super(key: key);

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Get.to(() => const ChannelViewScreen());
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: Get.height * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: SColors.color8,
                        image: DecorationImage(
                            image: NetworkImage(widget.thumbnileUrl == null
                                ? 'https://img.freepik.com/premium-photo/woman-holding-camera-with-word-canon-front_853645-1568.jpg?w=1380'
                                : widget.thumbnileUrl!),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    right: 20.0,
                    bottom: 10.0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: SColors.color3),
                      child: Text(
                        widget.duration,
                        style: TextStyle(color: SColors.color4, fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: SColors.color9,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.userProfileUrl),
                        )),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: SColors.color3,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${widget.views} views - ${DateFormat('MMM •d, y').format(widget.time)}',
                        style: TextStyle(
                          color: SColors.color8,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.more_vert))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
