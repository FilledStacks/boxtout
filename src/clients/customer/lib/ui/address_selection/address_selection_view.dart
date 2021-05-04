import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'address_selection_viewmodel.dart';
import 'address_selection_view.form.dart';

@FormView(fields: [FormTextField(name: 'address')])
class AddressSelectionView extends StatelessWidget with $AddressSelectionView {
  AddressSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddressSelectionViewModel>.reactive(
      onModelReady: (model) {
        listenToFormUpdated(model);
      },
      builder: (context, model, child) => GestureDetector(
        onTap: () {
          addressFocusNode.unfocus();
          model.resetDefaultSetup();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: model.close,
            ),
            iconTheme: IconThemeData(color: Colors.black),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Find restaurants near you',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Please enter your location or allow access to your location to find restaurants near you.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 10),
                if (!model.enterNewAddressSelected)
                  OutlinedButton.icon(
                    onPressed: model.useCurrentLocation,
                    icon: Icon(Icons.location_pin),
                    label: Text('Use current location'),
                    style: ButtonStyle(),
                  ),
                SizedBox(height: 10),
                TextFormField(
                  controller: addressController,
                  focusNode: addressFocusNode,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_on_rounded, size: 20),
                    suffix: GestureDetector(
                      onTap: () {
                        addressController.clear();
                        addressFocusNode.unfocus();
                        model.clearResults();
                        model.resetDefaultSetup();
                      },
                      child: Icon(Icons.cancel, size: 20),
                    ),
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    hintText: 'Enter a new address',
                  ),
                  onTap: model.useNewAddress,
                  onChanged: (value) {
                    EasyDebounce.debounce(
                      model.debounceId,
                      Duration(milliseconds: 500),
                      () => model.search(value),
                    );
                  },
                ),
                SizedBox(height: 20),
                Expanded(
                  child: model.busy(model.searchKey)
                      ? Center(child: CircularProgressIndicator())
                      : ListView.separated(
                          itemCount: model.results.length,
                          itemBuilder: (context, index) {
                            final result = model.results[index];

                            return ListTile(
                              leading: Icon(CupertinoIcons.location_fill),
                              title: Text(result.mainText ?? ''),
                              subtitle: Text(result.secondaryText ?? ''),
                              onTap: () {
                                model.onSelectResult(result);
                                addressController.clear();
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                        ),
                )
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => AddressSelectionViewModel(),
    );
  }
}
