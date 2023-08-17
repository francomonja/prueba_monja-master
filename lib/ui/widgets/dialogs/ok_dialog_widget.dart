import 'package:flutter/material.dart';
import 'package:prueba_monja/ui/widgets/dialogs/basic_dialog_widget.dart';
import 'package:stacked_services/stacked_services.dart';

class OkDialogWidget extends StatelessWidget {
  const OkDialogWidget({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  final DialogRequest request;
  final Function(DialogResponse) completer;

  @override
  Widget build(BuildContext context) {
    return BasicDialog(
      completer: completer,
      request: DialogRequest(
          title: request.title,
          mainButtonTitle: request.mainButtonTitle,
          data: Text(
            request.description ?? '',
          )),
    );
  }
}
