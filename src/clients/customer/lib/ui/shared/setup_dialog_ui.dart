import 'package:customer/app/app.locator.dart';
import 'package:customer/enums/dialog_type.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'dialogs/basic_dialog.dart';

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.basic: (
      BuildContext context,
      DialogRequest sheetRequest,
      Function(DialogResponse) completer,
    ) =>
        BasicDialog(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
