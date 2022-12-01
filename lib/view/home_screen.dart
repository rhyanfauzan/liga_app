import 'package:flutter/material.dart';
import 'package:liga_app/config/app_color.dart';

import '../config/theme.dart';
import '../widgets/item_league.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 14,
                ),
                Text(
                  'All Leagues',
                  style: blackTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    itemLeague(
                      nameLeague: 'English Premier League Champions Winner',
                    ),
                    itemLeague(
                      nameLeague: 'Belanda Cup',
                    ),
                    itemLeague(
                      nameLeague: 'Thomas Canada',
                    ),
                    itemLeague(
                      nameLeague: 'Asian Champions Winner',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
