import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SSvgs.dart';
import 'package:base_project/View/profile/edit_profile/edit_profile.dart';
import 'package:base_project/View/profile/widget/about_me_text.dart';
import 'package:base_project/View/profile/widget/custom_grid_view.dart';
import 'package:base_project/View/profile/widget/profile_buttons.dart';
import 'package:base_project/View/profile/widget/profile_status.dart';
import 'package:base_project/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainProfile extends StatefulWidget {
  const MainProfile({Key? key}) : super(key: key);

  @override
  State<MainProfile> createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    UserController controller = Get.find();
    return SafeArea(
      child: Scaffold(
        backgroundColor: SColors.color4,
        body: DefaultTabController(
          length: 2,
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 250,
                    child: Stack(
                      children: <Widget>[
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
                              stops: [0.0, 0.5], begin: Alignment.bottomLeft, end: Alignment.topCenter,).createShader(bounds);
                          },
                          
                          blendMode: BlendMode.dstIn,
                          child:
                          Image.network(
                            controller.userDetailsModel.value!.strProfileUrl, fit: BoxFit.fill, width: Get.width, height: Get.width,
                          ),
                        ),
                        Positioned(
                          bottom: 50, left: 180,
                          child: Text(
                            controller.userDetailsModel.value!.strName,
                            style: TextStyle(color: SColors.color3, fontSize: 14, fontWeight: FontWeight.w800,),),
                        ),
                        Positioned(
                          bottom: 30, left: 120,
                          child: Text(
                            'PHONE NUMBER : ${ controller.userDetailsModel.value!.strMobileNo}',
                            style: TextStyle(color: SColors.color3, fontSize: 11, fontWeight: FontWeight.w600,),),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(onTap: (){}, child: SvgPicture.asset(SSvgs.sv29)),
                  ),],),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child:
                  Row(
                    children: [
              ProfileStatus(count: '09', label: 'Posts'),
              ProfileStatus(count: "${controller.userDetailsModel.value!.followingCount}", label: 'Following'),
              ProfileStatus(count: "${controller.userDetailsModel.value!.followersCount}", label: 'Followers'),
            ],
          ),
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 ProfileButton(buttonText: 'Edit Profile', onPressed: (){Get.to(()=>const EditProfile());}),
                  ProfileButton(buttonText: 'Settings', onPressed: (){})
                ],
              ),
              const SizedBox(height: 20,),
              const AboutMeText(),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 25), child: Divider(color: SColors.color9,thickness: 1,),),
              TabBar(
               indicatorColor: SColors.color9,
                tabs: [
                  Tab(
                    icon: SvgPicture.asset(SSvgs.flicksLogo, width: 30, height: 30,
                      color: selectedTabIndex == 0 ? null : Colors.grey,
                    ),
                  ),
                  Tab(
                    icon: SvgPicture.asset(SSvgs.channelLogo, width: 30, height: 30,
                    color: selectedTabIndex == 1 ? null : Colors.grey,),
                  ),
                ],
                onTap: (index) {
                  setState(() {selectedTabIndex = index;});
                },
              ),
        SizedBox(
          height: 200,
          child: IndexedStack(
              index: selectedTabIndex,
              children: [
                Visibility(visible: selectedTabIndex == 0, child:CustomGridView(icon: Icons.photo,)),
                Visibility(visible: selectedTabIndex == 1, child: CustomGridView()
                ),
              ]
      ),
        ),
      ],
    ),
    ),
      )
    );
  }
}

