library profile_page;

import 'package:flutter/material.dart';

import '../../../data/model/tab_model.dart';
part '../widgets/components/app_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, _tabController),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: 130, // Width of the capsule-shaped button
          height: 45, // Height of the capsule-shaped button
          decoration: BoxDecoration(
            color: Theme.of(context)
                .tabBarTheme
                .labelColor, // Background color of the button
            borderRadius: BorderRadius.circular(28), // Rounded corners
          ),
          child: TextButton(
            onPressed: () {
              // Define action for the FAB
            },
            style: TextButton.styleFrom(
              backgroundColor:
                  Colors.transparent, // Make background transparent
              elevation: 0, // No shadow
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28), // Rounded corners
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.filter_list_rounded, color: Colors.white), // Icon
                SizedBox(width: 8), // Space between icon and text
                Text(
                  'Filter',
                  style: TextStyle(
                      color: Colors.white, fontSize: 16), // Text style
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
