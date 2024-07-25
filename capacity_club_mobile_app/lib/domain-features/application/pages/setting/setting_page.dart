import 'package:capacity_club_mobile_app/core/provider/theme_provider.dart';
import 'package:capacity_club_mobile_app/core/utils/page_config.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/setting/bloc/setting_page_bloc.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/setting/provider/setting_page_provider.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/setting/view-state/setting_page_error_view.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/setting/view-state/setting_page_loaded_view.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/setting/view-state/setting_page_loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});
  static const pageConfig = PageConfig(
      icon: FontAwesomeIcons.gear,
      name: 'setting',
      child: SettingPageProvider());
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  // Définir l'état local pour SettingPage ici

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<SettingPageBloc, SettingPageState>(
        builder: (context, state) {
          if (state is SettingPageLoadingState) {
            return SettingPageLoadingView();
          } else if (state is SettingPageLoadedState) {
            return SettingPageLoadedView();
          } else if (state is SettingPageErrorState) {
            return SettingPageErrorView();
          }

          return SettingPageLoadingView();
        },
      ),
    );
  }
}
