import 'package:prueba_monja/ui/widgets/dialogs/basic_dialog_widget.dart';
import 'package:prueba_monja/ui/widgets/dialogs/food_form_dialog_widget.dart';
import 'package:prueba_monja/ui/widgets/dialogs/ok_dialog_widget.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app.locator.dart';
import '../core/enums/dialog_type.dart';

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.ok: (context, request, completer) => OkDialogWidget(
          request: request,
          completer: completer,
        ),
    DialogType.foodForm: (context, request, completer) => FoodFormDialogWidget(
          request: request,
          completer: completer,
        ),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
