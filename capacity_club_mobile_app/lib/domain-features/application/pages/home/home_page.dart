import 'package:capacity_club_mobile_app/core/utils/page_config.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/bloc/home_page_bloc.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/provider/home_page_provider.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/view-state/home_page_error_view.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/view-state/home_page_loaded_view.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/home/view-state/home_page_loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const pageConfig = PageConfig(
      icon: FontAwesomeIcons.house, name: 'home', child: HomePageProvider());
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        if (state is HomePageLoadingState) {
          return HomePageLoadingView();
        } else if (state is HomePageLoadedState) {
          return HomePageLoadedView(
              collectiveIndoorTraining: state.collectiveIndoorTraining,
              individualIndoorTraining: state.individualIndoorTraining);
        } else if (state is HomePageErrorState) {
          return HomePageErrorView();
        }
        return HomePageLoadingView();
      },
    ));
  }
}
