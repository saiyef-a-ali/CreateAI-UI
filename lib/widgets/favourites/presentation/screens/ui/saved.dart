
import 'package:flutter/material.dart';
import 'package:newui/widgets/favourites/presentation/screens/widgets/sliver.list2.dart';
import 'package:newui/widgets/favourites/presentation/screens/widgets/sliver_app_bar2.dart';
import 'package:newui/widgets/favourites/presentation/screens/widgets/sliver_search2.dart';


class favouritesPage extends StatelessWidget {
  const favouritesPage({Key? key, required this.title}) : super(key: key);

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