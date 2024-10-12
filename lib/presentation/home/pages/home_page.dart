import 'package:flutter/material.dart';
import 'package:student_portfolio/core/config/themes/app_colors.dart';
import 'package:student_portfolio/data/model/bottom_nav_model.dart';
import '../pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1; //default index

  final List<Widget> _widgetOptions = const [
    Center(child: Text('Home')),
    ProfilePage(),
    Center(child: Text('Input')),
    Center(child: Text('Profile')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions.elementAt(_currentIndex),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18.0), // Circular top-left corner
            topRight: Radius.circular(18.0), // Circular top-right corner
          ),
          child: BottomAppBar(
            notchMargin: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: navData
                  .asMap()
                  .entries
                  .map((items) => InkWell(
                        onTap: () {
                          setState(() {
                            _currentIndex = items.key;
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 25,
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          width: 3,
                                          color: _currentIndex == items.key
                                              ? Theme.of(context)
                                                  .tabBarTheme
                                                  .labelColor!
                                              : Colors.transparent))),
                            ),
                            //todo add more
                            Icon(items.value.icon,
                                color: _currentIndex == items.key
                                    ? Theme.of(context).tabBarTheme.labelColor!
                                    : Theme.of(context)
                                        .bottomNavigationBarTheme
                                        .unselectedIconTheme
                                        ?.color,
                                size: Theme.of(context).iconTheme.size),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              items.value.label,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: _currentIndex == items.key
                                      ? Theme.of(context).tabBarTheme.labelColor
                                      : Theme.of(context)
                                          .bottomNavigationBarTheme
                                          .unselectedLabelStyle
                                          ?.color),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        ));
  }
}



  // child: BottomNavigationBar(
  //           showSelectedLabels: true,
  //           showUnselectedLabels: true,
  //           currentIndex: _selectedIndex,
  //           onTap: (index) {
  //             setState(() {
  //               _selectedIndex = index;
  //             });
  //           },
  //           items: navData
  //               .map((e) =>
  //                   BottomNavigationBarItem(icon: e.icon, label: e.label))
  //               .toList(),
  //         ),