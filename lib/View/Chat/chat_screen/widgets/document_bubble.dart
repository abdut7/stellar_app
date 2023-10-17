import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/services/download_and_open_file.dart';
import 'package:stellar_chat/utils/colors.dart';

class DocumentBubble extends StatefulWidget {
  final bool isGroup;
  final bool isSent;
  final String message;
  final String senterName;
  final String url;
  final bool isSenting;
  final String createdTime;
  const DocumentBubble(
      {super.key,
      required this.isSent,
      required this.message,
      required this.url,
      required this.isSenting,
      required this.createdTime,
      required this.isGroup,
      required this.senterName});

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
            height: 70,
            decoration: BoxDecoration(
                color: widget.isSent
                    ? const Color.fromRGBO(233, 244, 255, 1)
                    : const Color.fromRGBO(244, 244, 244, 1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 4, bottom: 4),
                  child: Text(
                    widget.isSent ? "" : widget.senterName,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
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
          child: Row(
            mainAxisAlignment:
                widget.isSent ? MainAxisAlignment.end : MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0, right: 5, left: 5),
                child: Text(
                  widget.createdTime,
                  style: const TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ),
              widget.isSent
                  ? SvgPicture.string(
                      """<svg width="10" height="5" viewBox="0 0 10 5" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M0 2.38197C0.0398437 2.30405 0.0679687 2.21808 0.121875 2.15236C0.317708 1.91496 0.652083 1.91185 0.877083 2.14275C1.37378 2.65358 1.86901 3.16492 2.36276 3.67678L2.48802 3.80665C2.7263 3.55912 2.95521 3.31133 3.19479 3.07392C4.17257 2.10613 5.15122 1.1399 6.13073 0.175222C6.2888 0.0193778 6.46927 -0.0416612 6.68203 0.0295076C7.03568 0.148209 7.12891 0.589508 6.85703 0.863014C6.53854 1.18353 6.21406 1.49834 5.89349 1.81548C4.8796 2.81548 3.86615 3.81574 2.85312 4.81626C2.69687 4.97211 2.51667 5.04016 2.30443 4.96873C2.22209 4.93891 2.1477 4.89066 2.08698 4.82769C1.43924 4.16483 0.794792 3.49929 0.153646 2.83107C0.0869792 2.7612 0.0494792 2.66275 0 2.57756V2.38197Z" fill="#00338E"/>
<path d="M10.0001 0.608279C9.96049 0.754513 9.867 0.862565 9.76101 0.96672C8.46205 2.24516 7.16379 3.52447 5.86622 4.80464C5.59903 5.06984 5.31596 5.06438 5.05215 4.7888C4.91726 4.64802 4.78106 4.5088 4.64695 4.36724C4.43393 4.1423 4.42976 3.83503 4.63549 3.63685C4.84122 3.43867 5.14721 3.4501 5.36622 3.67166L5.50684 3.81477C5.88314 3.42516 6.24903 3.03243 6.62846 2.65399C7.45241 1.83295 8.28861 1.02412 9.1084 0.198928C9.4209 -0.115617 9.9032 0.0308762 9.98575 0.40672C9.98911 0.415977 9.99376 0.42472 9.99955 0.432694L10.0001 0.608279Z" fill="#00338E"/>
</svg>
""")
                  : const SizedBox(),
              const SizedBox(
                width: 8,
              )
            ],
          ),
        ),
      ],
    );
  }
}
