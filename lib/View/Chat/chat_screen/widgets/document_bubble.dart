import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/services/download_and_open_file.dart';
import 'package:stellar_chat/utils/colors.dart';

class DocumentBubble extends StatefulWidget {
  final bool isSent;
  final String message;
  final String url;
  final bool isSenting;
  const DocumentBubble(
      {super.key,
      required this.isSent,
      required this.message,
      required this.url,
      required this.isSenting});

  @override
  State<DocumentBubble> createState() => _DocumentBubbleState();
}

bool isDownloading = false;

class _DocumentBubbleState extends State<DocumentBubble> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            if (await isFileCached(widget.url)) {
              downloadCacheAndOpenFile(widget.url.trim());
            }
          },
          child: Container(
            width: Get.width * 0.6,
            height: 60,
            decoration: BoxDecoration(
                color: widget.isSent
                    ? const Color.fromRGBO(233, 244, 255, 1)
                    : const Color.fromRGBO(244, 244, 244, 1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                SvgPicture.string(
                    """<svg width="24" height="32" viewBox="0 0 24 32" fill="none" xmlns="http://www.w3.org/2000/svg">
        <g clip-path="url(#clip0_1745_4211)">
        <path d="M4.17088 0H14.9119L24 9.45391V27.84C24 30.1357 22.1308 32 19.8221 32H4.17088C1.86922 32 0 30.1357 0 27.84V4.16C0 1.86435 1.86922 0 4.17088 0Z" fill="#313131"/>
        <path opacity="0.3" fill-rule="evenodd" clip-rule="evenodd" d="M14.898 0V9.37739H24L14.898 0Z" fill="white"/>
        </g>
        <defs>
        <clipPath id="clip0_1745_4211">
        <rect width="24" height="32" fill="white"/>
        </clipPath>
        </defs>
        </svg>
        """),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: Get.width * 0.3,
                  child: Text(
                    widget.message,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                widget.isSenting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : FutureBuilder(
                        future: isFileCached(widget.url),
                        builder: (context, AsyncSnapshot<bool> snapshot) {
                          if (!snapshot.hasData ||
                              snapshot.data == null ||
                              snapshot.data!) {
                            return const SizedBox();
                          }

                          return snapshot.data!
                              ? Text(
                                  "open",
                                  style: TextStyle(color: colorPrimary),
                                )
                              : GestureDetector(
                                  onTap: () async {
                                    isDownloading = true;
                                    setState(() {});
                                    await downloadCacheAndOpenFile(
                                        widget.url.trim());
                                    isDownloading = false;
                                    setState(() {});
                                  },
                                  child: isDownloading
                                      ? const SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        )
                                      : Icon(
                                          Icons.download,
                                          color: colorPrimary,
                                        ),
                                );
                        })
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: widget.isSent
                ? const Color.fromRGBO(197, 229, 255, 1)
                : const Color.fromRGBO(224, 224, 224, 1),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(widget.isSent ? 10 : 0),
                bottomRight: Radius.circular(widget.isSent ? 0 : 10)),
          ),
          width: Get.width * 0.6,
          height: 20,
        ),
      ],
    );
  }
}
