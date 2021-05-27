import 'package:box_ui/box_ui.dart';
import 'package:customer/ui/address_selection/address_selection_view.form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'address_selection_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'address',
  )
])
class AddressSelectionView extends StatelessWidget with $AddressSelectionView {
  AddressSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddressSelectionViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: BoxButton(
          title: 'Continue',
          busy: model.isBusy,
          disabled: !model.hasSelectedPlace,
          onTap: () => model.selectAddressSuggestion(),
        ),
        body: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Enter your address'),
              controller: addressController,
            ),
            if (!model.hasAutoCompleteResults)
              Text('We have no suggestions for you'),
            if (model.hasAutoCompleteResults && !model.isBusy)
              ...model.autoCompleteResults.map(
                (autoCompleteResult) => ListTile(
                  title: Text(autoCompleteResult.mainText ?? ''),
                  subtitle: Text(autoCompleteResult.secondaryText ?? ''),
                  onTap: () => model.setSelectedSuggestion(autoCompleteResult),
                ),
              ),
            if (model.isBusy)
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BoxText.subheading('Saving your Address...'),
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(kcPrimaryColor),
                    )
                  ],
                ),
              )
          ],
        ),
      ),
      viewModelBuilder: () => AddressSelectionViewModel(),
    );
  }
}
