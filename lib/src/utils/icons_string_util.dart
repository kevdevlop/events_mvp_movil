import 'package:flutter/material.dart';
 
final _icons = <String, IconData> {
  'event' : Icons.event
};

Icon getIcon(String iconName) {
  return Icon(
    _icons[iconName],
    color: Colors.blue,
  );
}