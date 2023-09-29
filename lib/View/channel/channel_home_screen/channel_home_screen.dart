
  import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SSvgs.dart';
import 'package:base_project/View/channel/channel_home_screen/widgets/flicks_suggestions.dart';
import 'package:base_project/View/channel/channel_home_screen/widgets/video_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

  class ChannelHomeScreen extends StatefulWidget {
    const ChannelHomeScreen({Key? key}) : super(key: key);

    @override
    State<ChannelHomeScreen> createState() => _ChannelHomeScreenState();
  }

  class _ChannelHomeScreenState extends State<ChannelHomeScreen> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: SColors.color4,
        body: ListView(
          children: [
          ListTile(
            leading:Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: SColors.color9, image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://img.freepik.com/premium-photo/woman-holding-camera-with-word-canon-front_853645-1568.jpg?w=1380',),
              )
              ),
            ),
            title:  Text(
              'RAJMOHAN CHOZHIATH',
              style: TextStyle(color: SColors.color3, fontSize: 12, fontWeight: FontWeight.w600,),
            ),
            subtitle: Text(
              'Rajmohan_C',
              style: TextStyle(color: SColors.color3, fontSize: 11, fontWeight: FontWeight.w400,),
            ),

        trailing: IconButton(icon: Icon(Icons.search,color: SColors.color3,size: 30,),onPressed: (){},)
          ),
             Padding(padding:const  EdgeInsets.symmetric(horizontal: 25), child: Divider(color: SColors.color3,thickness: 1,),
            ),
            const VideoCard(),
            const VideoCard(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(SSvgs.flicksLogo,),
                      const SizedBox(width: 10),
                      Text('Flicks',
                        style: TextStyle(color: SColors.color3, fontSize: 10, fontWeight: FontWeight.w500,),),
                    ],),
                  SizedBox(
                    height: 100,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                      ),
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (){},
                            child: FlickSuggestions());
                      },
                    ),
                  ),
                ],
              ),
            ),
            const VideoCard()
          ],
        ),
      );
    }
  }

