import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/View/flicks/widget/fliq_video_player_widget.dart';
import 'package:stellar_chat/utils/colors.dart';

import '../../../models/api_models/flick_model.dart';

class FlickItemWidget extends StatefulWidget {
  final FlickItem flickItem;

  FlickItemWidget({required this.flickItem});

  @override
  _FlickItemWidgetState createState() => _FlickItemWidgetState();
}

class _FlickItemWidgetState extends State<FlickItemWidget> {
  bool isLiked = false;
  int likeCount = 1234;
  int commentCount = 32;
  // Implement autoplay logic here.
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        VideoPlayerScreen(
          videoUrl: widget.flickItem.strFileUrl,
        ),
        Container(
          width: Get.width,
          height: Get.height - 1,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Spacer(),
                //like button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLiked = !isLiked;
                      if (isLiked) {
                        likeCount++;
                      } else {
                        likeCount--;
                      }
                    });
                  },
                  child: SvgPicture.string(
                    """<svg width="42" height="39" viewBox="0 0 42 39" fill="none" xmlns="http://www.w3.org/2000/svg">
                          <g filter="url(#filter0_d_2421_3090)">
                          <path d="M19.1469 34.0069C20.1001 34.6874 21.3792 34.6874 22.3325 34.0069C27.0965 30.606 31.6587 26.6933 34.8146 21.6863C36.3957 19.1779 37.0584 17.1493 37.3191 15.4905C37.4243 14.9064 37.4794 14.3038 37.4794 13.6878C37.4794 8.33739 33.3269 4 28.2047 4C25.1435 4 22.4288 5.54905 20.7397 7.93763C19.0505 5.54905 16.3358 4 13.2747 4C8.15242 4 4 8.33739 4 13.6878C4 14.3038 4.05504 14.9064 4.16027 15.4905C4.42093 17.1493 5.08365 19.1779 6.66472 21.6863C9.82064 26.6933 14.3828 30.606 19.1469 34.0069Z" fill="#FBFBFB"/>
                          <path d="M19.1469 29.9347C20.1001 30.6152 21.3792 30.6152 22.3325 29.9347C27.577 27.1055 29.4632 26.1624 34.8146 21.6863C36.3957 19.1779 37.0584 17.1493 37.3191 15.4905C37.4243 14.9064 37.4794 14.3038 37.4794 13.6878C37.4794 8.33739 33.3269 4 28.2047 4C25.1435 4 22.4288 5.54905 20.7397 7.93763C19.0505 5.54905 16.3358 4 13.2747 4C8.15242 4 4 8.33739 4 13.6878C4 14.3038 4.05504 14.9064 4.16027 15.4905C4.42093 17.1493 5.08365 19.1779 6.66472 21.6863C12.4877 26.1624 14.3739 27.1055 19.1469 29.9347Z" fill="white"/>
                          </g>
                          <defs>
                          <filter id="filter0_d_2421_3090" x="0" y="0.33" width="41.4785" height="38.5176" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                          <feFlood flood-opacity="0" result="BackgroundImageFix"/>
                          <feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"/>
                          <feOffset dy="0.33"/>
                          <feGaussianBlur stdDeviation="2"/>
                          <feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.1 0"/>
                          <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_2421_3090"/>
                          <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_2421_3090" result="shape"/>
                          </filter>
                          </defs>
                          </svg>
                          """,
                    color: isLiked ? colorPrimary : null,
                  ),
                ),
                Text(
                  "$likeCount ",
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.string(
                      """<svg width="41" height="40" viewBox="0 0 41 40" fill="none" xmlns="http://www.w3.org/2000/svg">
<g filter="url(#filter0_d_1516_6785)">
<path fill-rule="evenodd" clip-rule="evenodd" d="M20.8097 31.347C20.708 31.3486 20.606 31.3493 20.5039 31.3493C11.3891 31.3493 4 25.227 4 17.6747C4 10.1224 11.3891 4 20.5039 4C29.6188 4 37.0078 10.1224 37.0078 17.6747C37.0078 19.5847 36.5352 21.4032 35.6816 23.0544C34.5364 25.3888 32.7688 27.4721 30.8514 29.2693C27.93 32.0077 24.5498 34.0748 22.1428 35.2398C21.5061 35.548 20.8097 35.0655 20.8097 34.3934V31.347ZM14.8454 18.382C14.8454 19.6841 13.7898 20.7397 12.4877 20.7397C11.1856 20.7397 10.13 19.6841 10.13 18.382C10.13 17.0799 11.1856 16.0243 12.4877 16.0243C13.7898 16.0243 14.8454 17.0799 14.8454 18.382ZM20.5039 20.7397C21.806 20.7397 22.8616 19.6841 22.8616 18.382C22.8616 17.0799 21.806 16.0243 20.5039 16.0243C19.2018 16.0243 18.1462 17.0799 18.1462 18.382C18.1462 19.6841 19.2018 20.7397 20.5039 20.7397ZM30.8778 18.382C30.8778 19.6841 29.8222 20.7397 28.5201 20.7397C27.218 20.7397 26.1624 19.6841 26.1624 18.382C26.1624 17.0799 27.218 16.0243 28.5201 16.0243C29.8222 16.0243 30.8778 17.0799 30.8778 18.382Z" fill="#FBFBFB"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M20.5039 31.3493C29.6188 31.3493 37.0078 25.227 37.0078 17.6747C37.0078 10.1224 29.6188 4 20.5039 4C11.3891 4 4 10.1224 4 17.6747C4 25.227 11.3891 31.3493 20.5039 31.3493ZM12.4877 20.7397C13.7898 20.7397 14.8454 19.6841 14.8454 18.382C14.8454 17.0799 13.7898 16.0243 12.4877 16.0243C11.1856 16.0243 10.13 17.0799 10.13 18.382C10.13 19.6841 11.1856 20.7397 12.4877 20.7397ZM22.8616 18.382C22.8616 19.6841 21.806 20.7397 20.5039 20.7397C19.2018 20.7397 18.1462 19.6841 18.1462 18.382C18.1462 17.0799 19.2018 16.0243 20.5039 16.0243C21.806 16.0243 22.8616 17.0799 22.8616 18.382ZM28.5201 20.7397C29.8222 20.7397 30.8778 19.6841 30.8778 18.382C30.8778 17.0799 29.8222 16.0243 28.5201 16.0243C27.218 16.0243 26.1624 17.0799 26.1624 18.382C26.1624 19.6841 27.218 20.7397 28.5201 20.7397Z" fill="white"/>
</g>
<defs>
<filter id="filter0_d_1516_6785" x="0" y="0.33" width="41.0078" height="39.335" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
<feFlood flood-opacity="0" result="BackgroundImageFix"/>
<feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"/>
<feOffset dy="0.33"/>
<feGaussianBlur stdDeviation="2"/>
<feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.1 0"/>
<feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_1516_6785"/>
<feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_1516_6785" result="shape"/>
</filter>
</defs>
</svg>
"""),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    "$commentCount",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SvgPicture.string(
                    """<svg width="41" height="34" viewBox="0 0 41 34" fill="none" xmlns="http://www.w3.org/2000/svg">
<g filter="url(#filter0_d_1516_6779)">
<path d="M35.8278 17.7544C36.2331 17.3884 36.2438 16.7558 35.8512 16.3763L23.322 4.26684C22.7234 3.68831 21.7235 4.11249 21.7235 4.94496V9.99997C17.0402 9.92758 13.5216 11.1525 10.9069 13.0297C8.25121 14.9362 6.55915 17.4927 5.51647 19.9706C4.47476 22.4461 4.07331 24.8612 4.00938 26.5171C3.97786 27.3337 4.02655 28.0077 4.14357 28.4194C4.17347 28.5247 4.21388 28.6351 4.27195 28.7328C4.32308 28.8187 4.43124 28.9684 4.62777 29.0309C4.86423 29.1061 5.06493 29.0096 5.18126 28.9097C5.28625 28.8196 5.35681 28.7034 5.40563 28.6057L5.41184 28.5933L5.41683 28.5817L5.4173 28.5806L5.4185 28.5779L5.42812 28.5569C5.43742 28.537 5.45256 28.5055 5.47398 28.4635C5.51683 28.3794 5.58477 28.2535 5.68139 28.0948C5.87468 27.7772 6.18237 27.329 6.63307 26.8219C7.53333 25.8092 9.00701 24.5585 11.2891 23.6457C12.5881 23.1261 14.7533 22.8896 16.8762 22.8514C18.902 22.8148 20.7914 22.9598 21.7235 23.1653V28.3685C21.7235 29.1857 22.6921 29.6161 23.2986 29.0684L35.8278 17.7544Z" fill="#FBFBFB"/>
<path d="M31.968 16.4085C32.873 15.3564 31.968 13.8557 31.968 13.8557L30.4062 11.1173L23.322 4.26684C22.7234 3.68831 21.7235 4.11249 21.7235 4.94496V9.99997C17.0402 9.92758 13.5217 11.1525 10.9069 13.0297C8.25121 14.9362 6.55915 17.4927 5.51647 19.9705C4.47476 22.4461 4.07331 24.8612 4.00938 26.5171C3.97786 27.3337 4.02655 28.0077 4.14357 28.4194C4.17347 28.5247 4.21388 28.6351 4.27195 28.7328C4.32308 28.8187 4.43124 28.9684 4.62777 29.0309C4.86423 29.1061 5.06493 29.0096 5.18126 28.9097C5.28625 28.8196 5.35681 28.7034 5.40563 28.6057L5.41184 28.5933L5.41683 28.5817L5.4173 28.5806L5.4185 28.5779L5.42812 28.5569C5.43742 28.537 5.45256 28.5055 5.47398 28.4635C5.51683 28.3794 5.58477 28.2535 5.68139 28.0948C5.87468 27.7772 6.18237 27.329 6.63307 26.8219C7.53333 25.8092 12.5285 22.2648 15.3577 20.8502C17.7154 19.4356 21.7235 18.4925 21.7235 18.4925V24.151C21.7235 24.9682 22.6921 25.3986 23.2986 24.8509L31.968 16.4085Z" fill="white"/>
</g>
<defs>
<filter id="filter0_d_1516_6779" x="0" y="0.33" width="40.1387" height="33.3135" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
<feFlood flood-opacity="0" result="BackgroundImageFix"/>
<feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"/>
<feOffset dy="0.33"/>
<feGaussianBlur stdDeviation="2"/>
<feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.1 0"/>
<feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_1516_6779"/>
<feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_1516_6779" result="shape"/>
</filter>
</defs>
</svg>
"""),
                const Text(
                  "SHARE",
                  style: TextStyle(color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "@${widget.flickItem.strCreatedBy}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.flickItem.strDescription,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SvgPicture.string(
                                """<svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M4.88889 9.76923V2.50968L10.6667 1.5097V8.30773H8.96293C7.98681 8.30773 7.11111 8.87609 7.11111 9.76923C7.11111 10.6624 7.98681 11.2308 8.96293 11.2308H10.1482C11.1243 11.2308 12 10.6624 12 9.76923V9.00005V0.692472C12 0.264671 11.63 -0.0607384 11.2237 0.00959066L4.11262 1.24034C3.79116 1.29598 3.55556 1.5848 3.55556 1.92322V9.07694H1.85185C0.875698 9.07694 0 9.64536 0 10.5385C0 11.4317 0.875698 12 1.85185 12H3.03704C4.01319 12 4.88889 11.4317 4.88889 10.5385V10.2308V9.76923Z" fill="white"/>
</svg>
"""),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Own Audio",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
