import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coching_app/utils/route_name.dart';
import 'package:coching_app/utils/navigation.dart';
import 'package:coching_app/view/home/home_screen.dart';
import 'package:coching_app/argument/course_argument.dart';
import 'package:coching_app/argument/chackout_argument.dart';
import 'package:coching_app/view/detail/course_details.dart';
import 'package:coching_app/view/intro_screen/intro_screen.dart';
import 'package:coching_app/view/chackout_view/chackout_view.dart';
import 'package:coching_app/view/my_course_view/my_course_view.dart';
import 'package:coching_app/view/shopping/shopping_cart_screen.dart';
import 'package:coching_app/view/wish_list_view/wish_list_view.dart';
import 'package:coching_app/data%20provider/course_data_provide.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CourseDataProvide()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        navigatorKey: AppNavigation.navigatorKey,
        routes: {
          RouteName.home: (context) => const HomeScreen(),
          RouteName.intro: (context) => const IntroScreen(),
          RouteName.myCourseView: (context) => const MyCourseView(),
          RouteName.wishListView: (context) => const WishListView(),
          RouteName.shoppingCartScreen: (context) => ShoppingCartScreen(),

        },
        initialRoute: RouteName.intro,
        onGenerateRoute: (settings) {
          if (settings.name == RouteName.courseDetails) {
            final aurg = settings.arguments as CourseArgument;
            return MaterialPageRoute(
              builder: (context) => CourseDetails(course: aurg.course),
            );
          }else if(settings.name == RouteName.chackoutView){
            final args = settings.arguments as ChackoutArgument;
            return MaterialPageRoute(builder: (context)=>ChackoutView(courses: args.course, totelprice: args.totelPrice));
          }
        },
      ),
    );
  }
}
