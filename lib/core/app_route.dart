import 'package:get/get.dart';

import '../view/home_screen/home_screen.dart';

class AppRoute{
  static const String homeScreen = '/homeScreen';
  static List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage<dynamic>(name: homeScreen, page: ()=> HomeScreen())
  ];
}