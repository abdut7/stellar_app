import 'package:stellar_chat/Settings/SImages.dart';
import 'package:stellar_chat/View/profile/public_profile/widgets/follow_details_widget.dart';
import 'package:stellar_chat/View/profile/widget/about_me_text.dart';
import 'package:stellar_chat/View/profile/widget/contact_through_options.dart';
import 'package:stellar_chat/models/api_models/user_details_model.dart';
import 'package:stellar_chat/services/api_services/public_profile_service.dart';
import 'package:flutter/material.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';
import 'package:stellar_chat/View/profile/widget/custom_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PublicProfileScreen extends StatefulWidget {
  final bool isFromChatScreen;

  final String uid;

  const PublicProfileScreen(
      {super.key, required this.uid, this.isFromChatScreen = false});

  @override
  State<PublicProfileScreen> createState() => _PublicProfileScreenState();
}

class _PublicProfileScreenState extends State<PublicProfileScreen> {
  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: SColors.color4,
      body: FutureBuilder(
          future: PublicProfileService().getPublicProfileData(uid: widget.uid),
          builder: (context, AsyncSnapshot<UserDetailsModel?> snapshot) {
            if (!snapshot.hasData || snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return DefaultTabController(
              length: 2,
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 250,
                    width: Get.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          snapshot.data!.strProfileUrl.isEmpty
                              ? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
                              : snapshot.data!.strProfileUrl,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(SSvgs.sv29),
                                )),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          snapshot.data!.strName,
                          style: TextStyle(
                            color: SColors.color3,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'PHONE NUMBER : ${snapshot.data!.strMobileNo}',
                          style: TextStyle(
                            color: SColors.color3,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (widget.isFromChatScreen) {
                              Get.back();
                            }
                          },
                          child: ContactThrough(
                              svgAsset: SImages.msgIcon, label: 'Message'),
                        ),
                        ContactThrough(
                            svgAsset: SImages.callIcon, label: 'Call'),
                        ContactThrough(
                            svgAsset: SImages.videoIcon, label: 'Video'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  FollowDetailsWidget(model: snapshot.data!, uid: widget.uid),
                  const SizedBox(
                    height: 20,
                  ),
                  const AboutMeText(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Divider(
                      color: SColors.color3,
                      thickness: 1,
                    ),
                  ),
                  TabBar(
                    indicatorColor: SColors.color9,
                    tabs: [
                      Tab(
                        icon: SvgPicture.asset(
                          SSvgs.flicksLogo,
                          width: 30,
                          height: 30,
                          color: selectedTabIndex == 0 ? null : Colors.grey,
                        ),
                      ),
                      Tab(
                        icon: SvgPicture.asset(
                          SSvgs.channelLogo,
                          width: 30,
                          height: 30,
                          color: selectedTabIndex == 1 ? null : Colors.grey,
                        ),
                      ),
                    ],
                    onTap: (index) {
                      setState(() {
                        selectedTabIndex = index;
                      });
                    },
                  ),
                  SizedBox(
                    height: 200,
                    child: IndexedStack(index: selectedTabIndex, children: [
                      Visibility(
                          visible: selectedTabIndex == 0,
                          child: CustomGridView(
                            icon: Icons.photo,
                          )),
                      Visibility(
                          visible: selectedTabIndex == 1,
                          child: CustomGridView()),
                    ]),
                  ),
                ],
              ),
            );
          }),
    ));
  }
}
