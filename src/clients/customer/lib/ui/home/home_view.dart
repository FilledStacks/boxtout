import 'package:box_ui/box_ui.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: BoxButton(
            title: 'title',
            onTap: model.onTap,
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
