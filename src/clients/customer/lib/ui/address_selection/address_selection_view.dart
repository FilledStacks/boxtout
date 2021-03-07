import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'address_selection_viewmodel.dart';

class AddressSelectionView extends StatelessWidget {
  const AddressSelectionView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddressSelectionViewModel>.reactive(
      builder: (context, model, child) => Scaffold(),
      viewModelBuilder: () => AddressSelectionViewModel(),
    );
  }
}
