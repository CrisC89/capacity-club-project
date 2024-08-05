import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home-training/component/view/current_training_view.dart';
import 'package:flutter/material.dart';

class HomeTrainingPageLoadedView extends StatefulWidget {
  const HomeTrainingPageLoadedView({super.key});

  @override
  _HomeTrainingPageLoadedViewState createState() =>
      _HomeTrainingPageLoadedViewState();
}

class _HomeTrainingPageLoadedViewState extends State<HomeTrainingPageLoadedView>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PreferredSize(
          preferredSize:
              const Size.fromHeight(48.0), // Adjust this height as needed
          child: TabBar(
            labelStyle: AppTheme.tabLabelSelected,
            unselectedLabelStyle: AppTheme.tabLabelUnselected,
            controller: _tabController,
            tabs: const [
              Tab(
                child: Text(
                  'Training',
                ),
              ),
              Tab(text: 'Shop'),
              Tab(text: 'Templates'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              CurrentTrainingView(),
              ShopPage(),
              TemplatesPage(),
            ],
          ),
        ),
      ],
    );
  }
}

class CurrentTrainingPage extends StatelessWidget {
  const CurrentTrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Content for Current Training'));
  }
}

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Content for Shop'));
  }
}

class TemplatesPage extends StatelessWidget {
  const TemplatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Content for Templates'));
  }
}
