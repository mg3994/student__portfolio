import 'package:flutter/material.dart';
import 'package:student_portfolio/core/config/themes/app_colors.dart';
import '/presentation/home/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldbgColor,
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.scaffoldbgColor,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.seedColor),
          useMaterial3: true,
          bottomAppBarTheme: BottomAppBarTheme(
            elevation: 2,
            color: Colors.grey.shade100.withOpacity(0.2),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              unselectedIconTheme:
                  IconThemeData(color: AppColors.unSelectedBNColor),
              unselectedLabelStyle:
                  TextStyle(color: AppColors.unSelectedBNColor)),
          iconTheme: IconThemeData(size: 27),
          tabBarTheme: TabBarTheme(
              dividerColor: AppColors.tabDividerColor,
              dividerHeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 3, color: AppColors.primaryColor),
              ),
              labelColor: AppColors.primaryColor,
              labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              unselectedLabelColor: AppColors.unSelectedLabelColor,
              unselectedLabelStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.unSelectedLabelColor))),
      home: const HomePage(),
    );
  }
}
