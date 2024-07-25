import 'package:capacity_club_mobile_app/domain-features/application/pages/setting/bloc/setting_page_bloc.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPageProvider extends StatelessWidget {
  const SettingPageProvider();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SettingPageBloc()..add(SettingPageInitEvent()),
        child: SettingPage());
  }
}
