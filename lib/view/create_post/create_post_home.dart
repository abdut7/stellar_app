import 'dart:async';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/view/create_post/flicks/function/pick_from_storage.dart';
import 'package:stellar_chat/view/create_post/flicks/video_player/video_player_screen.dart';
import 'package:stellar_chat/view/create_post/flicks/widgets/upload_to_selection_widget.dart';
import 'package:stellar_chat/functions/show_snackbar.dart';

List<CameraDescription> cameras = [];

enum UploadTo { flicks, channel, live }

class AddFilesHomePage extends StatefulWidget {
  const AddFilesHomePage({super.key});

  @override
  State<AddFilesHomePage> createState() => _AddFilesHomePageState();
}

bool isBackCamera = true;

class _AddFilesHomePageState extends State<AddFilesHomePage> {
  late CameraController controller;
  @override
  void initState() {
    super.initState();
    controller = CameraController(
        isBackCamera ? cameras.first : cameras[1], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isRecording = false;
  bool isFlashOn = false;
  UploadTo uploadTo = UploadTo.flicks;
  Timer? timer;
  String formattedTime = '00:00';

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    timer = Timer.periodic(oneSecond, (timer) {
      final secondsElapsed = timer.tick;
      final minutes = (secondsElapsed ~/ 60).toString().padLeft(2, '0');
      final seconds = (secondsElapsed % 60).toString().padLeft(2, '0');
      setState(() {
        formattedTime = '$minutes:$seconds';
      });
    });
  }

  void stopTimer() {
    timer?.cancel();
    setState(() {
      formattedTime = '00:00';
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: CameraPreview(controller),
          ),
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.07,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(),
                    //recording time
                    Container(
                      width: Get.width * 0.2,
                      height: 25,
                      decoration: BoxDecoration(
                        color: isRecording
                            ? const Color.fromRGBO(255, 43, 66, 0.7)
                            : const Color.fromRGBO(0, 0, 0, 0.7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        formattedTime,
                        style: const TextStyle(color: Colors.white),
                      )),
                    ),
                    //flash
                    isBackCamera && !isRecording
                        ? GestureDetector(
                            onTap: () {
                              if (isFlashOn) {
                                controller.setFlashMode(FlashMode.off);
                              } else {
                                controller.setFlashMode(FlashMode.torch);
                              }
                              setState(() {
                                isFlashOn = !isFlashOn;
                              });
                            },
                            child: SvgPicture.string(isFlashOn
                                ? """<svg width="17" height="24" viewBox="0 0 17 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M16.0362 9.53112C16.2453 9.28561 16.2907 8.94364 16.1453 8.66306V8.64552C15.9998 8.36493 15.6998 8.18957 15.3816 8.18957H10.8726L14.418 2.02542C14.5726 1.77114 14.5726 1.45548 14.418 1.2012C14.2635 0.946913 13.9817 0.797852 13.6817 0.797852H7.71814C7.39997 0.797852 7.11816 0.96445 6.9727 1.23627L1.00918 11.9073C0.945543 12.0213 0.90918 12.1529 0.90918 12.2932C0.90918 12.7491 1.29099 13.1174 1.75462 13.1174H5.70909L2.60006 22.7363C2.57279 22.8239 2.56369 22.9204 2.56369 23.0081C2.58188 23.464 2.98187 23.8148 3.45459 23.7972C3.70913 23.7972 3.94549 23.6832 4.10912 23.4903L16.0271 9.53112H16.0362Z" fill="#99C7FF"/>
</svg>
"""
                                : """<svg width="17" height="23" viewBox="0 0 17 23" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M3.20945 7.02344L9.70024 16.0548L4.03671 22.6925C3.87307 22.8854 3.63671 22.9906 3.38217 22.9994C2.90945 23.0169 2.51855 22.6662 2.49128 22.2102C2.49128 22.1138 2.49128 22.0261 2.52764 21.9384L5.63667 12.3195H1.6822C1.20949 12.3195 0.827674 11.9513 0.836765 11.4953C0.836765 11.3638 0.873128 11.2323 0.936763 11.1095L3.21854 7.02344H3.20945ZM16.0638 7.84767C15.9183 7.56708 15.6183 7.39172 15.3001 7.39172H10.7911L14.3365 1.22757C14.4911 0.973286 14.4911 0.657626 14.3365 0.403344C14.182 0.149062 13.9002 0 13.6002 0H7.63664C7.31846 0 7.03665 0.166599 6.8912 0.438417L5.0276 3.77916L11.9456 13.4243L15.9547 8.7245C16.1638 8.47899 16.2092 8.13702 16.0638 7.85644V7.8389V7.84767ZM16.8456 21.6929L11.382 14.0995L4.57306 4.58584L1.52766 0.350734C1.23676 0 0.700404 -0.0701468 0.327684 0.21044C-0.0177643 0.464722 -0.099581 0.929445 0.127687 1.28895L3.66399 6.21676L10.2639 15.406L15.4547 22.6399C15.7274 23.0081 16.2547 23.1046 16.6365 22.8415C17.0183 22.5785 17.1183 22.0699 16.8456 21.7017V21.6841V21.6929Z" fill="#99C7FF"/>
                    </svg>
                    """),
                          )
                        : const SizedBox()
                  ],
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    isRecording
                        ? const SizedBox()
                        : GestureDetector(
                            onTap: () {
                              //Open gallary
                              pickVideoFromStorage(isFromChannel: false);
                            },
                            child: SvgPicture.string(
                                """<svg width="42" height="42" viewBox="0 0 42 42" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <circle cx="21" cy="21" r="18" fill="white"/>
                    <path d="M21 0C9.40154 0 0 9.40154 0 21C0 32.5985 9.40154 42 21 42C32.5985 42 42 32.5985 42 21C41.9838 9.40961 32.5904 0.0161538 21 0ZM33.4465 21.4765C32.8165 20.8465 31.7908 20.8465 31.1608 21.4765L24.2227 28.4146L12.4385 16.6304C11.8085 16.0004 10.7827 16.0004 10.1527 16.6304L3.40038 23.3827C3.28731 22.5912 3.23077 21.7996 3.22269 21C3.20654 11.1865 11.1542 3.21462 20.9677 3.20654C30.7812 3.19846 38.7531 11.1381 38.7612 20.9515C38.7612 22.68 38.5108 24.4004 38.0181 26.0562L33.4385 21.4765H33.4465Z" fill="#00338E"/>
                    <path d="M27.4616 13.3265C28.5768 13.3265 29.4808 12.4225 29.4808 11.3073C29.4808 10.1921 28.5768 9.28809 27.4616 9.28809C26.3464 9.28809 25.4424 10.1921 25.4424 11.3073C25.4424 12.4225 26.3464 13.3265 27.4616 13.3265Z" fill="#00338E"/>
                    </svg>
                    """),
                          ),
                    GestureDetector(
                      onTap: () async {
                        try {
                          //on capture button
                          if (isRecording) {
                            //stop recording
                            XFile file = await controller.stopVideoRecording();
                            stopTimer();
                            Get.to(() => VideoPlayerScreen(
                                  isFromChannel: false,
                                  videoFilePath: file.path,
                                ));
                            //take to video preview screen
                          } else {
                            //start recording
                            await controller.startVideoRecording();
                            startTimer();
                          }
                          setState(() {
                            isRecording = !isRecording;
                          });
                        } catch (e) {
                          showCustomSnackbar(title: "Error", message: "");
                        }
                      },
                      child: SvgPicture.string(isRecording
                          ? """<svg width="81" height="81" viewBox="0 0 81 81" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M72.4337 45.9359C75.296 28.4373 63.431 11.9315 45.9324 9.06911C28.4338 6.20674 11.928 18.0717 9.0656 35.5704C6.20322 53.069 18.0682 69.5748 35.5668 72.4372C53.0654 75.2995 69.5713 63.4345 72.4337 45.9359Z" fill="#D73636"/>
<path d="M40.74 79.48C62.1355 79.48 79.48 62.1355 79.48 40.74C79.48 19.3445 62.1355 2 40.74 2C19.3445 2 2 19.3445 2 40.74C2 62.1355 19.3445 79.48 40.74 79.48Z" stroke="#D73636" stroke-width="3" stroke-miterlimit="10"/>
</svg>
"""
                          : """<svg width="81" height="81" viewBox="0 0 81 81" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M72.4337 45.9359C75.296 28.4373 63.431 11.9315 45.9324 9.06911C28.4338 6.20674 11.928 18.0717 9.0656 35.5704C6.20322 53.069 18.0682 69.5748 35.5668 72.4372C53.0654 75.2995 69.5713 63.4345 72.4337 45.9359Z" fill="white"/>
                    <path d="M40.74 79.48C62.1355 79.48 79.48 62.1355 79.48 40.74C79.48 19.3445 62.1355 2 40.74 2C19.3445 2 2 19.3445 2 40.74C2 62.1355 19.3445 79.48 40.74 79.48Z" stroke="#D73636" stroke-width="3" stroke-miterlimit="10"/>
                    </svg>
                    """),
                    ),
                    isRecording
                        ? const SizedBox()
                        : GestureDetector(
                            onTap: () async {
                              //rotate camera
                              isBackCamera = !isBackCamera;
                              controller = CameraController(
                                  isBackCamera ? cameras.first : cameras[1],
                                  ResolutionPreset.max);
                              await controller.initialize();
                              setState(() {});
                            },
                            child: SvgPicture.string(
                                """<svg width="41" height="41" viewBox="0 0 41 41" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M36.2273 24.5139C38.354 15.5733 32.8302 6.60159 23.8896 4.47494C14.949 2.34829 5.97728 7.87207 3.85063 16.8126C1.72399 25.7532 7.24776 34.725 16.1883 36.8516C25.1289 38.9783 34.1007 33.4545 36.2273 24.5139Z" stroke="white" stroke-miterlimit="10"/>
                    <path d="M27.6498 20.7695C27.6698 20.9995 27.6799 21.2395 27.6799 21.4795C27.6799 25.6095 24.3298 28.9595 20.1998 28.9595C17.6798 28.9595 15.4398 27.7095 14.0898 25.7895" stroke="white" stroke-miterlimit="10"/>
                    <path d="M27.6297 18.0098L25.9897 20.8498H29.2697L27.6297 18.0098Z" fill="white"/>
                    <path d="M12.7598 20.81C13.0998 17 16.2998 14 20.2098 14C22.4298 14 24.4198 14.97 25.7898 16.5" stroke="white" stroke-miterlimit="10"/>
                    <path d="M12.64 23.6603L11 20.8203H14.28L12.64 23.6603Z" fill="white"/>
                    </svg>
                    """),
                          )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    width: Get.width * 0.8,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(159, 196, 232, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        UploadToSelectionWidget(
                          onTap: (val) {
                            setState(() {
                              uploadTo = val;
                            });
                          },
                          selectedValue: uploadTo,
                          value: UploadTo.flicks,
                        ),
                        UploadToSelectionWidget(
                          onTap: (val) {
                            pickVideoFromStorage(isFromChannel: true);
                          },
                          selectedValue: uploadTo,
                          value: UploadTo.channel,
                        ),
                        UploadToSelectionWidget(
                          onTap: (val) {
                            setState(() {
                              uploadTo = val;
                            });
                          },
                          selectedValue: uploadTo,
                          value: UploadTo.live,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
