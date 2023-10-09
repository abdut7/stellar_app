import 'package:stellar_chat/Settings/SColors.dart';
import 'package:stellar_chat/services/api_services/account_services.dart';
import 'package:flutter/material.dart';

showBlockAndReportBottomSheet(BuildContext context, String id) {
  return showModalBottomSheet(
    backgroundColor: SColors.color11,
    shape: const RoundedRectangleBorder(
      // <-- SEE HERE
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15.0),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return Wrap(
        children: <Widget>[
          ListTile(
            //leading: Icon(Icons.block),
            title: Center(
              child: Text('View Profile',style: TextStyle(color: SColors.color12, fontSize: 11, fontWeight: FontWeight.w500,
              ),),
            ),
            onTap: ()  {},
          ),
          ListTile(
           // leading: Icon(Icons.report),
            title: Center(child: Text('Search',style: TextStyle(color: SColors.color12, fontSize: 11, fontWeight: FontWeight.w500,),)),
            onTap: ()  {},
          ),
          ListTile(
            // leading: Icon(Icons.report),
            title: Center(child: Text('Mute Notification',style: TextStyle(color: SColors.color12, fontSize: 11, fontWeight: FontWeight.w500,),)),
            onTap: () {
              showCustomBottomSheet2(context);
            },
          ),
          ListTile(
            //leading: Icon(Icons.block),
            title: Center(child: Text('Block User',style: TextStyle(color: SColors.color12, fontSize: 11, fontWeight: FontWeight.w500,),)),
            onTap: ()  {
              showCustomBottomSheet(
                context,
                'Do You want to',
                ' Block the user',
                'Cancel',
                'OK',
                    () {
                  Navigator.of(context).pop();
                  // Function to execute when the "Cancel" button is tapped.
      },
                    () async {
                  await AccountServices.blockUser(id);
                  Navigator.of(context).pop();
                  // Function to execute when the "Ok" button is tapped.
                },
              );
              },

          ),
          ListTile(
            // leading: Icon(Icons.report),
            title: Center(child: Text('Clear All Chat',style: TextStyle(color: SColors.color12, fontSize: 11, fontWeight: FontWeight.w500,),)),
            onTap: () {
              showCustomBottomSheet(
                context,
                'Do You want to Clear all',
                ' Call Logs',
                'Cancel',
                'OK',
                    () {
                  // Function to execute when the "Cancel" button is tapped.
                   },
                    () {
                  // Function to execute when the "Ok" button is tapped.
                       },
              );

            },
          ),
          ListTile(
            // leading: Icon(Icons.report),
            title:Center(child: Text('Report User',style: TextStyle(color: SColors.color12, fontSize: 11, fontWeight: FontWeight.w500,),)),
            onTap: ()  {
              showCustomBottomSheet(
                context,
                'Do You want to',
                ' Report the user',
                'Cancel',
                'OK',
                    () {
                      Navigator.of(context).pop();
                      // Function to execute when the "Cancel" button is tapped.
                   },
                    () async {
                      await AccountServices.unBlockUser(id);
                      Navigator.of(context).pop();
                      // Function to execute when the "Ok" button is tapped.
                },);},
          ),
        ],
      );
    },
  );
}


void showCustomBottomSheet(BuildContext context, String text1, String text2, String buttonText1, String buttonText2, VoidCallback onTap1, VoidCallback onTap2) {
  showModalBottomSheet(
    backgroundColor: SColors.color11,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15.0),),),
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              text1, style: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600,),),
            Text(
              text2,
              style: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600,),),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: onTap1,
                  child: Container(width: MediaQuery.of(context).size.width * 0.25,
                    height: 30,
                    decoration: BoxDecoration(color: SColors.color11, borderRadius: BorderRadius.circular(9),),
                    child: Center(
                      child: Text(buttonText1, style: TextStyle(color: SColors.color12, fontSize: 17, fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onTap2,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 30,
                    decoration: BoxDecoration(color: const Color.fromRGBO(0, 51, 142, 1), borderRadius: BorderRadius.circular(9),
                    ),
                    child: Center(
                      child: Text(buttonText2, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w400,),),
                    ),
                  ),
                ),],),],),);},);
}
void showCustomBottomSheet2(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: SColors.color4,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15.0),),),
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Mute Notification', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600,),),
            const SizedBox(height: 10,),
            const Text('Other participants will not see', style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400,
              ),
            ),
            const Text(
              'that you muted this chat',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 30.0),
           selectionRow('8 hours'),
           const SizedBox(height: 10,),
           selectionRow('One Weeks'),
            const SizedBox(height: 10,),
           selectionRow('Always'),
            const SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 30,
                    decoration: BoxDecoration(color: SColors.color4, borderRadius: BorderRadius.circular(9),),
                    child: Center(
                      child: Text(
                        'Cancel', style: TextStyle(color: SColors.color12, fontSize: 17, fontWeight: FontWeight.w400,),),),),),
                GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 30, decoration: BoxDecoration(color: const Color.fromRGBO(0, 51, 142, 1), borderRadius: BorderRadius.circular(9),),
                    child: const Center(
                      child: Text(
                        'OK',
                        textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w400,),
                      ),
                    ),
                  ),
                ),],),],),);},);
}
Widget selectionRow( String text){
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 130),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          height: 14, width: 14, decoration: BoxDecoration(shape: BoxShape.circle, color: SColors.color11,),),
        Text(text,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black),),
      ],
    ),
  );
}

