import 'package:capacity_club_mobile_app/domain-features/application/core/page_section_title_widget.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/components/widget/coach-info/coach_info_card_widget.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  pageSectionTitle(context, 'Beginner'),
                  Container(
                      height: 500,
                      child: Center(child: Text('Beginner Template'))),
                  pageSectionTitle(context, 'Intermediate'),
                  Container(
                      height: 500,
                      child: Center(child: Text('Intermediate Template'))),
                  pageSectionTitle(context, 'Expert'),
                  Container(
                      height: 500,
                      child: Center(child: Text('Expert Template'))),
                ],
              ),
            ),
          ),
          Column(
            children: [
              pageSectionTitle(
                  context, 'Need a personnal training ? Contact us !'),
              const SizedBox(height: 20),
              CoachInfoCard(
                name: 'Jehan LECARME',
                description:
                    'COACH / PRÉPARATION PHYSIQUE / CROSSFIT / HALTÉRO',
                imageUrl: 'assets/img/jl_logo.png',
                email: 'jehan.lecarme@example.com',
                phoneNumber: '+123456789',
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
