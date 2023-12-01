import 'dart:io';

import 'package:social_media_recorder/audio_encoder_type.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';
import 'package:stellar_chat/functions/get_random_file_directory.dart';
import 'package:stellar_chat/services/socket_service/group_chat_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stellar_chat/services/socket_service/private_chat_service.dart';
import 'package:path/path.dart' as path;

class ChatBottomFieldSent extends StatefulWidget {
  final String chatId;
  final TextEditingController controller;
  final VoidCallback onsent;
  final VoidCallback onCamera;
  final VoidCallback onAttach;
  final VoidCallback onSticker;
  final bool isGroup;
  const ChatBottomFieldSent({
    super.key,
    required this.controller,
    required this.onsent,
    required this.onCamera,
    required this.onAttach,
    required this.chatId,
    this.isGroup = false,
    required this.onSticker,
  });

  @override
  State<ChatBottomFieldSent> createState() => _ChatBottomFieldSentState();
}

bool isVoice = true;
bool isRecording = false;
FlutterSoundRecorder? _soundRecorder;
bool isRecorderInit = false;
// String myPath = "";
// late Directory tempderectory;

class _ChatBottomFieldSentState extends State<ChatBottomFieldSent> {
  @override
  void initState() {
    // getTempDerectory();
    super.initState();
  }

  // getTempDerectory() async {
  //   var tempDir = await getTemporaryDirectory();
  //   myPath = '${tempDir.path}/flutter_sound.aac';
  //   setState(() {});
  // }

  // void openAudio() async {
  //   final status = await Permission.microphone.request();
  //   if (status != PermissionStatus.granted) {
  //     throw RecordingPermissionException('Mic permission not allowed!');
  //   }
  //   await _soundRecorder!.openRecorder();
  //   isRecorderInit = true;
  // }

  // void recordAndSent({required bool startRecording}) async {
  // var tempDir = await getTemporaryDirectory();
  // var path = '${tempDir.path}/flutter_sound.aac';
  //   if (!isRecorderInit) {
  //     return;
  //   }
  //   if (!startRecording) {
  //     await _soundRecorder!.stopRecorder();
  //     if (widget.isGroup) {
  //       GroupChatService.sentGroupVoiceMessage(
  //           chatId: widget.chatId, path: path);
  //     } else {
  //       PrivateChatService.sentPersonalVoiceMessage(
  //           chatId: widget.chatId, path: path);
  //     }

  //     // sendFileMessage(File(path), MessageEnum.audio);
  //   } else {
  //     await _soundRecorder!.startRecorder(
  //       toFile: path,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: 50,
              margin: const EdgeInsets.only(left: 4.0, bottom: 6),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(236, 240, 240, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.onSticker();
                    },
                    child: SvgPicture.string(
                        """<svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g clip-path="url(#clip0_1045_4641)">
                            <path d="M8.99687 18C4.03762 18 0 13.9624 0 8.99687C0 4.03135 4.03762 0 8.99687 0C13.9561 0 17.9937 4.03762 17.9937 8.99687C17.9937 13.9561 13.9561 17.9937 8.99687 17.9937V18ZM8.99687 1.12226C4.65831 1.12226 1.12226 4.65831 1.12226 8.99687C1.12226 13.3354 4.65204 16.8715 8.99687 16.8715C13.3417 16.8715 16.8715 13.3417 16.8715 8.99687C16.8715 4.65204 13.3417 1.12226 8.99687 1.12226ZM14 10.9342C14.1379 10.6583 14.0251 10.326 13.7492 10.1818C13.4734 10.0439 13.1348 10.1505 12.9906 10.4263C12.9467 10.5078 11.9498 12.3699 8.9906 12.3699C6.03135 12.3699 5.04075 10.5141 4.9906 10.4263C4.85266 10.1505 4.51411 10.0376 4.23824 10.1755C3.96238 10.3135 3.84953 10.652 3.98746 10.9279C4.03762 11.0345 5.31035 13.4859 8.9906 13.4859C12.6708 13.4859 13.9436 11.0282 13.9937 10.9279L14 10.9342ZM11.8119 7.86834C11.1912 7.86834 10.6897 7.36677 10.6897 6.74608C10.6897 6.12539 11.1912 5.62382 11.8119 5.62382C12.4326 5.62382 12.9342 6.12539 12.9342 6.74608C12.9342 7.36677 12.4326 7.86834 11.8119 7.86834ZM6.18809 7.86834C5.5674 7.86834 5.06583 7.36677 5.06583 6.74608C5.06583 6.12539 5.5674 5.62382 6.18809 5.62382C6.80878 5.62382 7.31034 6.12539 7.31034 6.74608C7.31034 7.36677 6.80878 7.86834 6.18809 7.86834Z" fill="#ABA9A9"/>
                            </g>
                            <defs>
                            <clipPath id="clip0_1045_4641">
                            <rect width="18" height="18" fill="white"/>
                            </clipPath>
                            </defs>
                            </svg>
                            """),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: TextField(
                        onChanged: (v) {
                          if (v.isEmpty && !isVoice) {
                            setState(() {
                              isVoice = true;
                            });
                          }
                          if (v.isNotEmpty && isVoice) {
                            setState(() {
                              isVoice = false;
                            });
                          }
                        },
                        controller: widget.controller,
                        decoration: const InputDecoration(
                          hintText: 'Start typing...',
                          hintStyle: TextStyle(
                              fontFamily: 'Inter',
                              color: Color.fromARGB(142, 0, 0, 0)),
                          border: InputBorder.none,
                        ),
                        maxLines: 2, // Set a maximum of 3 lines
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.onAttach();
                    },
                    child: SvgPicture.string(
                        """<svg width="16" height="15" viewBox="0 0 16 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M4.17821 14.1545C1.87147 14.1552 0.000681155 12.3243 0 10.0656C0 8.97971 0.440367 7.93822 1.22472 7.17085L7.38951 1.13363C7.60237 0.925193 7.94738 0.925193 8.16024 1.13363C8.3731 1.34206 8.3731 1.67989 8.16024 1.88832L1.99476 7.92488C0.759488 9.07609 0.710785 10.99 1.88646 12.1996C3.06213 13.4092 5.01671 13.4569 6.25198 12.3056C6.28945 12.2706 6.32623 12.2346 6.36199 12.1979L14.325 4.40052C15.093 3.62415 15.0726 2.38489 14.2797 1.63286C13.5046 0.897846 12.2737 0.897846 11.4989 1.63286L5.07767 7.92488C4.72279 8.27238 4.72279 8.83531 5.07767 9.18281C5.43255 9.53031 6.00745 9.53031 6.36233 9.18281L10.4711 5.15889C10.6802 4.94678 11.0248 4.94078 11.2414 5.14555C11.458 5.35031 11.4642 5.68781 11.2551 5.89991C11.2506 5.90424 11.2462 5.90858 11.2418 5.91291L7.13237 9.93751C6.35211 10.7019 5.08687 10.7019 4.30626 9.93784C3.52566 9.17381 3.52566 7.93488 4.30592 7.17052L10.7289 0.885841C11.9349 -0.295058 13.8898 -0.295391 15.0958 0.885507C16.3017 2.06641 16.3021 3.98066 15.0961 5.16155L7.13306 12.9563C6.35109 13.726 5.28678 14.1575 4.17821 14.1545Z" fill="#ABA9A9"/>
                  </svg>
                  """),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.onCamera();
                    },
                    child: SvgPicture.string(
                        """<svg width="20" height="15" viewBox="0 0 20 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <g clip-path="url(#clip0_434_487)">
                  <path d="M19.993 5.55217C19.993 4.59811 19.5498 3.82956 18.7548 3.24652C18.2061 2.84237 17.5308 2.63035 16.8343 2.65023H14.3792C14.2948 2.21295 14.2314 1.80217 14.14 1.3914C13.9571 0.596343 13.2184 0.0199292 12.3531 5.29225e-05C10.8055 5.29225e-05 9.25079 5.29225e-05 7.69609 5.29225e-05C6.78157 -0.00657252 6.0007 0.609594 5.8389 1.45102C5.77559 1.74917 5.71931 2.04731 5.6771 2.35208C5.64896 2.57735 5.55047 2.66348 5.29722 2.65686C4.5445 2.6436 3.7988 2.65023 3.04608 2.65686C1.36476 2.68998 0.0140696 3.97532 0 5.56542V12.0716C0 13.6683 1.37179 14.9934 3.06718 14.9934C7.6961 15.0067 12.318 15.0067 16.9469 14.9934C18.6212 14.9934 20 13.6617 20 12.0849C20 9.90509 20 7.72532 20 5.55217H19.993ZM10.0106 12.9197C7.42877 12.9197 5.38164 10.9718 5.38867 8.527C5.39571 6.16834 7.49209 4.24034 10.0387 4.25359C12.5642 4.26684 14.5973 6.21472 14.5973 8.61975C14.5973 10.9784 12.522 12.9263 10.0106 12.9263V12.9197ZM16.6092 6.34723H16.5951C16.1308 6.34723 15.758 5.98945 15.765 5.55217C15.7791 5.12815 16.1449 4.79025 16.5951 4.78362C16.5951 4.78362 16.6233 4.78362 16.6444 4.78362C17.1017 4.79025 17.4675 5.15465 17.4604 5.5853C17.4534 6.01595 17.0665 6.36048 16.6092 6.35385V6.34723Z" fill="#ABA9A9"/>
                  </g>
                  <defs>
                  <clipPath id="clip0_434_487">
                  <rect width="20" height="15" fill="white"/>
                  </clipPath>
                  </defs>
                  </svg>
                  
                  """),
                  ),
                  const SizedBox(
                    width: 8,
                  )
                ],
              ),
            ),
          ),
        ),
        // const SizedBox(
        //   width: 10,
        // ),

        isVoice
            ? SocialMediaRecorder(
                encode: AudioEncoderType.AAC,
                recordIconWhenLockBackGroundColor: const Color(0xFF9FC4E8),
                recordIconWhenLockedRecord: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.string(
                    """<svg width="20" height="20" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M25.9349 13.9999C25.9349 14.8516 25.3854 15.6099 24.4299 16.0883L5.27324 25.6666C4.80657 25.8999 4.35157 26.0166 3.93157 26.0166C3.32374 26.0166 2.78824 25.7599 2.44874 25.3061C2.15824 24.9083 1.87824 24.2199 2.21657 23.0999L4.37491 15.9016C4.44491 15.6916 4.49157 15.4361 4.51491 15.1666H16.3332C16.9749 15.1666 17.4999 14.6416 17.4999 13.9999C17.4999 13.3583 16.9749 12.8333 16.3332 12.8333H4.51491C4.49041 12.5649 4.44374 12.3083 4.37491 12.0983L2.21657 4.89994C1.87824 3.77994 2.15824 3.09161 2.44991 2.69494C3.02157 1.92494 4.10657 1.74994 5.27324 2.33328L24.4311 11.9116C25.3866 12.3899 25.9349 13.1483 25.9349 13.9999Z" fill="white"/>
                    </svg>
                    """,
                  ),
                ),
                initRecordPackageWidth: 50,
                recordIconBackGroundColor: const Color(0xFF9FC4E8),
                recordIcon: const CircleAvatar(
                  backgroundColor: Color(0xFF9FC4E8),
                  radius: 50,
                  child: Icon(
                    Icons.mic,
                    color: Colors.white,
                  ),
                ),
                radius: BorderRadius.circular(20),
                sendRequestFunction: (soundFile, _) async {
                  if (widget.isGroup) {
                    GroupChatService.sentGroupVoiceMessage(
                        chatId: widget.chatId, path: soundFile.path);
                  } else {
                    await PrivateChatService.sentPersonalVoiceMessage(
                      chatId: widget.chatId,
                      path: soundFile.path,
                    );
                  }
                },
              )
            : GestureDetector(
                onTap: () {
                  if (widget.isGroup) {
                    GroupChatService.sentGroupTextMessage(
                      widget.chatId,
                      widget.controller.text,
                    );
                  } else {
                    PrivateChatService.sentPersonalTextMessage(
                      widget.chatId,
                      widget.controller.text,
                    );
                  }
                  widget.controller.clear();
                  isVoice = true;
                  setState(() {});
                },
                child: Container(
                  width: 37,
                  height: 37,
                  margin: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF9FC4E8), // Button background color
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.string(
                        """<svg width="20" height="20" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                          <path d="M25.9349 13.9999C25.9349 14.8516 25.3854 15.6099 24.4299 16.0883L5.27324 25.6666C4.80657 25.8999 4.35157 26.0166 3.93157 26.0166C3.32374 26.0166 2.78824 25.7599 2.44874 25.3061C2.15824 24.9083 1.87824 24.2199 2.21657 23.0999L4.37491 15.9016C4.44491 15.6916 4.49157 15.4361 4.51491 15.1666H16.3332C16.9749 15.1666 17.4999 14.6416 17.4999 13.9999C17.4999 13.3583 16.9749 12.8333 16.3332 12.8333H4.51491C4.49041 12.5649 4.44374 12.3083 4.37491 12.0983L2.21657 4.89994C1.87824 3.77994 2.15824 3.09161 2.44991 2.69494C3.02157 1.92494 4.10657 1.74994 5.27324 2.33328L24.4311 11.9116C25.3866 12.3899 25.9349 13.1483 25.9349 13.9999Z" fill="white"/>
                      </svg>
                      """,
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
