import 'package:box_ui/box_ui.dart';
import 'package:customer/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

// The type of dialog to show
enum DialogType { region }
enum RegionDialogStatus { success, error, warning }

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.region: (BuildContext context, DialogRequest sheetRequest,
            Function(DialogResponse) completer) =>
        _RegionDialog(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

class _RegionDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _RegionDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: kcTransparentColor,
        child: RegionDialogContent(request: request, completer: completer));
  }
}

class RegionDialogContent extends StatelessWidget {
  const RegionDialogContent({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  final DialogRequest request;
  final Function(DialogResponse p1) completer;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: screenWidthPercentage(context, percentage: 0.04)),
          padding:
              const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 12),
          decoration: BoxDecoration(
            color: kcWhiteColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpaceSmall,
              Text(
                request.title ?? '',
                textAlign: TextAlign.center,
                style: subheadingStyle.copyWith(
                  color: kcBlackColor,
                  height: 1.4,
                ),
              ),
              verticalSpaceSmall,
              Text(
                request.description ?? '',
                textAlign: TextAlign.center,
                style:
                    bodyStyle.copyWith(height: 1.4, color: kcMediumGreyColor),
              ),
              verticalSpaceMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (request.secondaryButtonTitle != null)
                    TextButton(
                        onPressed: () =>
                            completer(DialogResponse(confirmed: false)),
                        child: Text(request.secondaryButtonTitle!,
                            style: bodyStyle.copyWith(color: kcBlackColor))),
                  TextButton(
                      onPressed: () =>
                          completer(DialogResponse(confirmed: true)),
                      child: Text(
                        request.mainButtonTitle ?? '',
                        style: bodyStyle.copyWith(
                          color: kcPrimaryColor,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
        Positioned(
            top: -28, child: _chooseDialogCircularSign(request.customData))
      ],
    );
  }
}

Widget _chooseDialogCircularSign(dynamic regionDialogStatus) {
  if (regionDialogStatus is RegionDialogStatus)
    switch (regionDialogStatus) {
      case RegionDialogStatus.error:
        return CircleAvatar(
          minRadius: 16,
          maxRadius: 28,
          backgroundColor: kcRedColor,
          child: Icon(
            Icons.close,
            size: 28,
            color: kcWhiteColor,
          ),
        );
      case RegionDialogStatus.warning:
        return CircleAvatar(
          minRadius: 16,
          maxRadius: 28,
          backgroundColor: kcOrangeColor,
          child: Icon(
            Icons.warning_amber,
            size: 28,
            color: kcWhiteColor,
          ),
        );
      default:
        return CircleAvatar(
          minRadius: 16,
          maxRadius: 28,
          backgroundColor: kcPrimaryColor,
          child: Icon(
            Icons.check,
            size: 28,
            color: kcWhiteColor,
          ),
        );
    }
  else {
    return CircleAvatar(
      minRadius: 16,
      maxRadius: 28,
      backgroundColor: kcPrimaryColor,
      child: Icon(
        Icons.check,
        size: 28,
        color: kcWhiteColor,
      ),
    );
  }
}
