import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitmore_admin/controllers/side_bar/menu_controller.dart';
import 'package:fitmore_admin/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'view/auth/login_page.dart';
import 'package:sizer/sizer.dart';

import 'view/coupons/coupon_list.dart';
// import 'view/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

/// Let's start to make responsive website
/// First make app responsive class

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (p0, p1, p2) =>
      MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => MenuuController()),
          ],
          child: const CouponList(),
        ),
      ),
    );
  }
}

class TextPage extends StatefulWidget {
  const TextPage({super.key});

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {

  late Uint8List imageFile;
  bool imageAvalable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.blue,
              child: imageAvalable ? Image.memory(imageFile,fit: BoxFit.cover,) : const SizedBox(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () async{
              final image = await ImagePickerWeb.getImageAsBytes();
              setState(() {
                imageFile = image!;
                imageAvalable = true;
              });
            }, child: const Text('Add')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: ()async {
              final path = 'files/$imageFile';
              final ref = FirebaseStorage.instance.ref(path);
              ref.putData(imageFile);
            }, child: const Text('upload'))
          ],
        ),
      ),
    );
  }
}
