import 'package:flutter/material.dart';

List<CustomBottomBarItems> navData = [
  CustomBottomBarItems(label: "Home", icon: Icons.home_filled),
  CustomBottomBarItems(label: "Portfolio", icon: Icons.business_center_sharp),
  CustomBottomBarItems(label: "Input", icon: Icons.article),
  CustomBottomBarItems(label: "Profile", icon: Icons.person),
];

class CustomBottomBarItems {
  /// pass icon with type IconData
  final IconData icon;

  /// pass label with type .
  final String label;

  CustomBottomBarItems({
    required this.icon,
    required this.label,
  });
}
