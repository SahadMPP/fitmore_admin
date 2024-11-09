import 'package:fitmore_admin/utils/const/sized_box.dart';
import 'package:fitmore_admin/utils/const/text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
   final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/5694547b99c1d7f7854c011509bc884a.jpg'),fit: BoxFit.fill,filterQuality: FilterQuality.high)
        ),
        child: Center(
          child: Container(
            height: Adaptive.h(80),
            width: Adaptive.w(80),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Row(
              children: [
                if(width > 900)
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/Annotation_2024-11-09_122115-removebg-preview.png')),
                            gradient: LinearGradient(colors: [
                              const Color.fromARGB(255, 253, 231, 255),
                              Colors.white,
                              Colors.white.withOpacity(.2),
                              const Color.fromARGB(255, 253, 231, 255)
                            ])),
                      ),
                      Positioned(
                          top: 3.h,
                          left: 2.w,
                          child: Text(
                            'FITMORE',
                            style: AppTextStyles.bodyText1.copyWith(
                                color: const Color.fromARGB(255, 66, 37, 26),
                                letterSpacing: 3,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('WELCOME',
                        style: AppTextStyles.headline3.copyWith(
                            color: const Color.fromARGB(255, 66, 37, 26),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 5)),
                    const SizedBox(height: .5,),
                    Text(
                      'Fill your data to enter.Thank you!!!',
                      style: AppTextStyles.bodyText2,
                    ),
                    sh2,
                    _textField('Email'),
                    sh1,
                    _textField('Password'),
                    sh10,
                    SizedBox(
                      width: 15.w,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                            shadowColor: WidgetStatePropertyAll(Colors.black),
                            backgroundColor: WidgetStatePropertyAll(
                                Color.fromARGB(255, 66, 37, 26))),
                        child: Text('Login',
                            style: AppTextStyles.bodyText2
                                .copyWith(color: Colors.white)),
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _textField(String hintText) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: TextFormField(
        style: AppTextStyles.bodyText2.copyWith(color: Colors.black),
        decoration: InputDecoration(
          label: Text(hintText),
          labelStyle: AppTextStyles.bodyText2,
          // hintText: hintText,
          // hintStyle: AppTextStyles.bodyText2,
        ),
      ),
    );
  }
}
