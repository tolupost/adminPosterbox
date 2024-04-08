import 'package:adminposterbox/pages/home_page.dart';
import 'package:adminposterbox/pages/login.dart';
import 'package:adminposterbox/providers/userprovider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';


import 'package:provider/provider.dart';

import 'controllers/menu_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Window.initialize();
  await Window.setEffect(
    effect:WindowEffect.popover,
    color: Color.fromARGB(50, 0, 0, 0),

  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: Colors.blue,
      ),
      home:
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => menuController()),
        ],
         // child: const MyHomePage(title: 'Flutter Demo Home Page'),
        child:  MyHomePage(title: '',),
      ),


    );
  }
}


