// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'models/list_item.dart';

class Configuration extends InheritedWidget {
  final List<ListItem> gerichtelisteList;

  const Configuration({
    super.key,
    required Widget child,
    required this.gerichtelisteList,
  }) : super(child: child);

  @override
  bool updateShouldNotify(Configuration oldWidget) {
    return gerichtelisteList != oldWidget.gerichtelisteList;
  }
}
