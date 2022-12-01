import 'package:flutter/material.dart';
import '../widgets/item_club.dart';

class ClubsScreen extends StatelessWidget {
  ClubsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'League',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            itemClub(
              nameClub: 'Arsenal',
              imageClub: 'assets/images/logoclub.png',
              locClub: 'England',
              yearClub: '1892',
            ),
            itemClub(
              nameClub: 'Tarkam Fc',
            )
          ],
        ),
      ),
    );
  }
}
