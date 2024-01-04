
import 'package:flutter/material.dart';
import 'package:newui/widgets/homescreen/presentation/screens/widgets/sliver.list.dart';
import 'package:newui/widgets/homescreen/presentation/screens/widgets/sliver_app_bar.dart';
import 'package:newui/widgets/homescreen/presentation/screens/widgets/sliver_search.dart';

class mainHomePage extends StatelessWidget {
  const mainHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBarBldr(),
          SliverSearch(),
          SliverListBldr(),
        ],
      ),
    );
  }
}