import 'package:base_project/Settings/SColors.dart';
import 'package:base_project/Settings/SImages.dart';
import 'package:base_project/widgets/custom_elevated_button.dart';
import 'package:base_project/widgets/edit_profile_textfield.dart';
import 'package:flutter/material.dart';
class EditProfileUi extends StatefulWidget {
  static const routeName = '/EditProfileUi';
  const EditProfileUi({Key? key}) : super(key: key);

  @override
  State<EditProfileUi> createState() => _EditProfileUiState();
}

class _EditProfileUiState extends State<EditProfileUi> {
  Widget editPhoto(Function () onpress){
    return  GestureDetector(
        onTap: onpress,
        child: Center(child: Image(image: AssetImage(SImages.image2))));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.color4,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'EDIT PROFILE',
          style: TextStyle(color: SColors.color3, fontSize: 13, fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.cancel_rounded,color: SColors.color3,),
          onPressed: () {},
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 50,),
         editPhoto(() {}),
          const SizedBox(height: 50,),
          const EditProfileTextField(keyboardType: TextInputType.text, labelText: 'USERNAME'),
          const EditProfileTextField(keyboardType: TextInputType.emailAddress, labelText: 'EMAIL ID'),
          const EditProfileTextField(keyboardType: TextInputType.phone, labelText: 'PHONE'),
          const EditProfileTextField(keyboardType: TextInputType.visiblePassword, labelText: 'PASSWORD'),
          const SizedBox(height: 150,),
          CustomElevatedButton(
            text: 'Update',
            textColor: SColors.color4,
            foregroundColor: SColors.color4,
            backgroundColor: SColors.color12,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    backgroundColor: SColors.color11,
                    content: Text(
                      'Profile Updated',
                      style: TextStyle(
                        color: SColors.color3,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    actions: [
                      CustomElevatedButton(
                          text: 'Continue',
                          textColor: SColors.color4,
                          foregroundColor: SColors.color4,
                          backgroundColor: SColors.color12,
                          onPressed: (){
                            Navigator.of(context).pop();
                          }
                      )
                    ],
                  );
                },
              );
            },
          ),

        ],
      ),
    );
  }
}
