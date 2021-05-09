import 'package:fliper_flutter_test/theme.dart';
import 'package:flutter/material.dart';

import 'features/wealth_summary/presentation/pages/wealth_summary_page.dart';
import 'injection_container.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fliper',
      theme: buildThemeData(),
      home: WealthSummaryPage(),
    );
  }
}
