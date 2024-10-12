import 'package:flutter/material.dart';
import 'package:student_portfolio/core/config/themes/app_colors.dart';
import 'package:student_portfolio/data/model/bottom_nav_model.dart';
import '../../../common/widgets/components/bottom_nav_indicator.dart';
import '../pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1; //default index

  final List<Widget> _widgetOptions = const [
    Center(child: Text('Home')),
    ProfilePage(),
    Center(child: Text('Leaves')),
    Center(child: Text('Loyalty')),
    Center(child: Text('Requests')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        selectedColor: AppColors.primaryColor,
        unSelectedColor: Colors.black54,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        unselectedIconSize: 15,
        selectedIconSize: 20,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        enableLineIndicator: true,
        lineIndicatorWidth: 3,
        indicatorType: IndicatorType.top,
        // gradient: LinearGradient(
        //   colors: [Colors.pink, Colors.yellow],
        // ),
        customBottomBarItems: navData,
      ),
    );
  }
}
