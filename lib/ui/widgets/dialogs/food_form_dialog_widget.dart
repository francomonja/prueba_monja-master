import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba_monja/core/models/api_shops_response.dart';
import 'package:prueba_monja/core/viewmodel/dialogs/food_form_dialog_viewmodel.dart';
import 'package:prueba_monja/ui/widgets/dialogs/basic_dialog_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../custom_input.dart';

class FoodFormDialogWidget extends StatelessWidget {
  const FoodFormDialogWidget({
    super.key,
    required this.request,
    required this.completer,
  });

  final DialogRequest request;
  final Function(DialogResponse) completer;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FoodFormDialogViewModel>.reactive(
        viewModelBuilder: () => FoodFormDialogViewModel(),
        builder: (context, vm, child) {
          return BasicDialog(
            request: DialogRequest(
                title: request.title,
                data: SafeArea(
                    child: Stack(children: [
                  Column(
                    children: [
                      CustomInput(
                        controller: vm.categoryController,
                        label: 'category',
                      ),
                      CustomInput(
                        controller: vm.nameController,
                        label: 'name',
                      ),
                      CustomInput(
                        controller: vm.descriptionController,
                        label: 'description',
                      ),
                      ...vm.errors.map(
                        (e) => Text(
                          '-$e',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                completer(DialogResponse(confirmed: false));
                              },
                              child: Container(
                                child: Text('cancelar'),
                              )),
                          GestureDetector(
                            onTap: () {
                              if (vm.validate()) {
                                completer(DialogResponse(
                                    confirmed: true,
                                    data: ShopData(
                                        category: vm.categoryController.text,
                                        description: vm.descriptionController.text,
                                        name: vm.nameController.text,
                                        promotions: [PromotionData(name: 'name', description: 'description', price: '0')])));
                              }
                            },
                            child: Container(
                              child: Text('crear'),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ]))),
            completer: completer,
          );
        });
  }
}
