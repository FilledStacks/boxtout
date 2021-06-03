import 'package:box_ui/box_ui.dart';
import 'package:box_ui/src/shared/styles.dart';
import 'package:customer/ui/address_selection/address_selection_view.form.dart';
import 'package:customer/ui/dumb_widgets/autocomplete_listItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: kcPrimaryColor,
        ),

        /// Makes the button center
        bottomNavigationBar: Visibility(
          visible: model.hasSelectedPlace,
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: BoxButton(
              title: 'Continue',
              busy: model.isBusy,
              disabled: !model.hasSelectedPlace,
              onTap: () => model.selectAddressSuggestion(),
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            Container(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BoxText.headingTwo("Find restaurants near you"),
                verticalSpaceSmall,
                //TODO: Add Align property to BoxText
                Text(
                  "Please enter your location or allow access to your location to find restaurants near you",
                  style: bodyStyle.copyWith(color: kcMediumGreyColor),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
            FocusScope(
              child: Focus(
                onFocusChange: model.onFocusChanged,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: model.focus
                      ? EdgeInsets.only(top: 30.0)
                      : EdgeInsets.only(top: 40.0),
                  child: BoxInputField(
                    controller: addressController,
                    leading: Icon(Icons.location_on),
                    trailing: Icon(Icons.close),
                    trailingTapped: () => addressController.clear(),
                    placeholder: "Enter a new address",
                  ),
                ),
              ),
            ),
            if (model.hasAddress && !model.hasAutoCompleteResults)
              Text('We have no suggestions for you'),
            verticalSpaceSmall,
            if (model.hasAutoCompleteResults && !model.isBusy)
              ...model.autoCompleteResults.map(
                (autoCompleteResult) => AutoCompleteListItem(
                  city: autoCompleteResult.mainText ?? '',
                  state: autoCompleteResult.secondaryText ?? '',
                  onTap: () {
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                    model.setSelectedSuggestion(autoCompleteResult);
                  },
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
