import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SImages.dart';
import 'package:flutter/material.dart';
class VideoCardChannelView extends StatefulWidget {
  const VideoCardChannelView({Key? key}) : super(key: key);

  @override
  State<VideoCardChannelView> createState() => _VideoCardChannelViewState();
}

class _VideoCardChannelViewState extends State<VideoCardChannelView> {
  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: (){},
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 175,
                    decoration: BoxDecoration(
                        color: SColors.color8,
                        image: const DecorationImage(image: NetworkImage('https://img.freepik.com/premium-photo/woman-holding-camera-with-word-canon-front_853645-1568.jpg?w=1380'), fit: BoxFit.cover)
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                            const SizedBox(height: 10,),
                            Text(
                              '19,210,251 views - Jul •1, 2016',
                              style: TextStyle(color:  SColors.color8, fontSize: 12, fontWeight: FontWeight.w500,),
                            ),
                          ],
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: (){},
                              child: Image.asset(SImages.shareIcon)),
                          Text(
                            'Share',
                            style: TextStyle(
                              color: SColors.color3,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
  }
}

