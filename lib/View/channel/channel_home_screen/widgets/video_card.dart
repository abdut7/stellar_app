import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/View/channel/channel_view/channel_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class VideoCard extends StatefulWidget {
  const VideoCard({Key? key}) : super(key: key);

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: (){
            Get.to(()=>const ChannelViewScreen());
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 175,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: SColors.color8,
                          image: const DecorationImage(
                              image: NetworkImage('https://img.freepik.com/premium-photo/woman-holding-camera-with-word-canon-front_853645-1568.jpg?w=1380'), fit: BoxFit.cover)
                      ),
                    ),
                    Positioned(
                      right: 20.0,
                      bottom: 10.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),color: SColors.color3
                        ),
                        child: Text('17:45',style: TextStyle(color: SColors.color4,fontSize: 10),),
                      ),
                    ),
                  ],),
                const SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration:  BoxDecoration(shape: BoxShape.circle, color: SColors.color9, image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://img.freepik.com/premium-photo/woman-holding-camera-with-word-canon-front_853645-1568.jpg?w=1380'),)
                      ),
                    ),
                    const SizedBox(width: 12,),
                    Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'The Beauty of Existence - Heart Touching Nasheed',
                              style: TextStyle(
                                color: SColors.color3, fontSize: 14, fontWeight: FontWeight.w500,),
                            ),
                            const SizedBox(height: 5,),
                            Text(
                              '19,210,251 views - Jul •1, 2016',
                              style: TextStyle(color:  SColors.color8, fontSize: 12, fontWeight: FontWeight.w500,),
                            ),
                          ],
                        )
                    ),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
  }

