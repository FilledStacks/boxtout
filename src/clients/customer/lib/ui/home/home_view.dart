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
          body: model.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : model.hasError
                  ? Center(
                      child: BoxText.headingThree(
                        'An error has occered while running the future',
                        align: TextAlign.center,
                      ),
                    )
                  : model.data!.isEmpty
                      ? Center(
                          child: BoxText.headingThree(
                            'There is currently no merchants for this region',
                            align: TextAlign.center,
                          ),
                        )
                      : ListView.builder(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeightPercentage(context,
                                  percentage: 0.1),
                              horizontal: screenHorizontalPadding),
                          itemCount: model.data!.length,
                          itemBuilder: (context, index) {
                            final merchantItem = model.data![index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: LargeMerchantItem(
                                images: merchantItem.images ?? [],
                                categories: merchantItem.categories ?? [],
                                name: merchantItem.name ?? '',
                                rating: merchantItem.rating,
                                numberOfRatings: merchantItem.numberOfRatings,
                              ),
                            );
                          })),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
