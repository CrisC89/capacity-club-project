import 'package:capacity_club_mobile_app/core/utils/page_config.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/test-page/bloc/test_bloc.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/test-page/view/test_page_error.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/test-page/view/test_page_loaded.dart';
import 'package:capacity_club_mobile_app/domain-features/application/pages/test-page/view/test_page_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TestPageProvider extends StatelessWidget {
  const TestPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestBloc()..add(OnDateChangedTestEvent()),
      child: TestPage(),
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  static const pageConfig = PageConfig(
      icon: FontAwesomeIcons.question,
      name: 'test-page',
      child: TestPageProvider());
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<TestBloc, TestState>(
        builder: (context, state) {
          if (state is TestLoadingState) {
            return TestPageLoading();
          } else if (state is TestLoadedState) {
            return TestPageLoaded(
                collectiveIndoorTrainingList:
                    state.collectiveIndoorTrainingList,
                individualIndoorTrainingList:
                    state.individualIndoorTrainingList);
          } else if (state is TestErrorState) {
            return TestPageError();
          }
          return TestPageLoading();
        },
      ),
    );
  }
}
