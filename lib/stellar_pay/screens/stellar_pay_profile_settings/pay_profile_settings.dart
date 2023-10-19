import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/Settings/SSvgs.dart';

class PayProfileSettings extends StatefulWidget {
  const PayProfileSettings({Key? key}) : super(key: key);

  @override
  State<PayProfileSettings> createState() => _PayProfileSettingsState();
}

class _PayProfileSettingsState extends State<PayProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: Get.width, height: Get.height * 0.1, decoration:  BoxDecoration(color: SColors.color21),
                  child: Row(
                    children: [
                      Padding(padding: const EdgeInsets.only(left: 20.0), child: SvgPicture.asset(SSvgs.logoStellar,),),
                      const SizedBox(width: 10,),
                      Padding(padding: const EdgeInsets.only(top: 8), child: Text(
                        'Chozhiath', style: TextStyle(color: SColors.color20, fontSize: 18, fontWeight: FontWeight.w800,
                        ),
                      ),),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 35),
                       child: headText(head: 'Your Account'),
                     ),
                     const SizedBox(height: 20,),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 35),
                       child: Text(
                         'Personal Information\n+971 222-555-666',
                         style: TextStyle(color: SColors.color3, fontSize: 16, fontWeight: FontWeight.w400,),),
                     ),
                     const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: cardField(
                          field: 'Cards',
                          ontap: (){}
                      ),
                    ),
                     const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: countryField(
                          field: 'Country',
                          yourCountry: 'UAE',
                          onTap: (){}
                      ),
                    ),
                     const SizedBox(height: 10,),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 18),
                       child: const Divider(thickness: 1,color: Colors.black,),
                     ),
                     const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: headText(head: 'Delete my Account'),
                    ),
                     const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: deleteMyAccount(
                          text: 'LOG OUT My Stellar Pay Account',
                          onTap: (){}
                      ),
                    ),
                     const SizedBox(height: 20,),

                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 35),
                       child: deleteMyAccount(text: 'Delete my Stellar Pay Account',
                           onTap: (){}
                       ),
                     ),
                     const SizedBox(height: 25,),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 18),
                       child: const Divider(thickness: 1,color: Colors.black,),
                     ),

                   ],
                 )

              ],
            ),

            // Profile image
            Positioned(
              left: Get.width * 0.68,
              top: Get.height * 0.02,
              child: Container(
                width: Get.width * 0.2,
                height: Get.width * 0.2,
                decoration: ShapeDecoration(
                  image: const DecorationImage(image: NetworkImage("https://cdn.quotesgram.com/img/8/72/1135141999-074f6884b9f34be89538782d2fc98f8e.jpg"), fit: BoxFit.cover,),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Get.width * 0.1),),),),),
          ],
        ),
      ),
    );
  }
}

Widget deleteMyAccount({required String text , required Function() onTap}){
  return  GestureDetector(
    onTap:onTap,
    child: Text(
      text,
      style: TextStyle(
        color: SColors.color17,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
Widget headText({required String head}){
  return Text(
    head,
    style: TextStyle(color: SColors.color24, fontSize: 18, fontWeight: FontWeight.w700,),
  );
}

Widget countryField( {required String field, required String yourCountry, required Function()onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        field,
        style: TextStyle(color: SColors.color3, fontSize: 16, fontWeight: FontWeight.w400,),
      ),
      Row(
        children: [
          Text(
            yourCountry,
            style: TextStyle(color:SColors.color3, fontSize: 16, fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 5,),
          GestureDetector(
              onTap: onTap,
              child: const Icon(Icons.arrow_forward_ios,size: 12,color: Colors.black,)),
        ],
      ),
    ],
  );
}

Widget cardField({required String field , required Function() ontap}){
  return  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        field, style: TextStyle(color:SColors.color3, fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      ),
      GestureDetector(
          onTap: ontap,
          child: const Icon(Icons.arrow_forward_ios,size: 12,color: Colors.black,)),
    ],
  );
}