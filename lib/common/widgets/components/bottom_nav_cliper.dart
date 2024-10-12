// Custom clipper to create the circular effect on the top of the BottomNavigationBar
import 'package:flutter/material.dart';

class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    Path path = Path();
    path.lineTo(0, 0); // Start from the bottom left

    // First circular arc
    path.quadraticBezierTo(
      width * 0.2, -height * 0.4, // Control point
      width * 0.4, 0, // End point
    );

    // Second circular arc
    path.quadraticBezierTo(
      width * 0.6, -height * 0.4, // Control point
      width * 0.8, 0, // End point
    );

    path.lineTo(width, 0); // Line to the bottom right
    path.lineTo(width, height); // Line to bottom right corner
    path.lineTo(0, height); // Line to bottom left corner
    path.close(); // Close the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
