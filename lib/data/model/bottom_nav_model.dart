import 'package:flutter/material.dart';

List<CustomBottomBarItems> navData = [
  CustomBottomBarItems(label: "Home", icon: const Icon(Icons.home_filled)),
  CustomBottomBarItems(
      label: "Portfolio", icon: const Icon(Icons.business_center_sharp)),
  CustomBottomBarItems(label: "Input", icon: const Icon(Icons.article)),
  CustomBottomBarItems(label: "Profile", icon: const Icon(Icons.person)),
];

class CustomBottomBarItems<T> {
  /// pass icon with type IconData
  final T icon;

  /// pass label with type .
  final String label;

  CustomBottomBarItems({
    required this.icon,
    required this.label,
  }) : assert(icon is IconData || icon is Widget,
            'CustomBottomBarItems only support IconData and Widget');
}
