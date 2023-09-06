import 'package:base_project/features/setup/login/view_model/login_view_model.dart';
import 'package:base_project/utils/app_build_methods.dart';
import 'package:base_project/utils/colors.dart';
import 'package:base_project/utils/extensions.dart';
import 'package:base_project/utils/styles.dart';
import 'package:base_project/widgets/primary_button.dart';
import 'package:base_project/widgets/text_input_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/SplashScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => LoginViewmodel(),
          )
        ],
        builder: (context, _) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: colorWhite,
              body: SingleChildScrollView(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 20.spMin),
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 200.spMin),
                      Center(
                        child: Container(
                          height: 100.spMin,
                          width: 200.spMin,
                          child: Placeholder(),
                        ),
                      ),
                      SizedBox(height: 40.spMin),
                      Text(
                        "User Name",
                        style: tsS13W500.copyWith(color: colorTextBlack),
                      ),
                      SizedBox(height: 8.spMin),
                      TextInputFormField(
                        textType: TextInputType.text,
                        controller: _nameController,
                        borderColor: colorBorderGrey,
                        fontStyle: tsS16W700,
                        inputFormatters: [],
                        contentPadding: EdgeInsetsDirectional.symmetric(
                            horizontal: 20.spMin, vertical: 18.spMin),
                        hintText: "Username",
                        keyName: "username",
                        onTap: () {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter username";
                          }

                          return null;
                        },
                        margin: EdgeInsets.zero,
                      ),
                      SizedBox(height: 18.spMin),
                      Text(
                        "Password",
                        style: tsS13W500.copyWith(color: colorTextBlack),
                      ),
                      SizedBox(height: 8.spMin),
                      TextInputFormField(
                        textType: TextInputType.text,
                        controller: _passwordController,
                        borderColor: colorBorderGrey,
                        fontStyle: tsS16W700,
                        inputFormatters: [],
                        contentPadding: EdgeInsetsDirectional.symmetric(
                            horizontal: 20.spMin, vertical: 18.spMin),
                        hintText: "password",
                        keyName: "password",
                        onTap: () {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter password";
                          }

                          return null;
                        },
                        margin: EdgeInsets.zero,
                      ),
                      SizedBox(height: 8.spMin),
                      PrimaryButton(
                        title: "Login",
                        padding: EdgeInsets.zero,
                        //backgroundColor: colorPrimary,
                        onClick: () {
                          onTapLogin(context);
                        },
                      ).showCircleProgressOnCenter<LoginViewmodel>(),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  void onTapLogin(BuildContext context) {
    var provider = context.read<LoginViewmodel>();

    if (_formKey.currentState!.validate()) {
      provider.username = _nameController.text;
      provider.password = _passwordController.text;
      provider.login().then((value) {
        //print(value);
      });
    }
  }
}
