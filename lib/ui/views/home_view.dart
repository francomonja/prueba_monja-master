import 'package:flutter/material.dart';
import 'package:prueba_monja/core/models/api_shops_response.dart';
import 'package:prueba_monja/core/viewmodel/home_view_viewmodel.dart';
import 'package:prueba_monja/ui/constants/app_colors.dart';
import 'package:stacked/stacked.dart';

import '../widgets/search_widget.dart';
import '../widgets/shop_card_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewViewModel>.reactive(
        viewModelBuilder: () => HomeViewViewModel(),
        builder: (context, vm, child) {
          return Scaffold(
              backgroundColor: AppColors.scaffoldBackgroundColor,
              body: Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Listado de alimentos',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: AppColors.primaryButtonBackgroundColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SearchWidget(
                          controller: vm.search,
                          onChanged: vm.findByName,
                        ),
                        GestureDetector(
                          onTap: () {
                            vm.dialog();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blue,
                            ),
                            height: 40,
                            width: 40,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: vm.searchResults.isEmpty && vm.search.text.isNotEmpty
                          ? Text('No hay resultados')
                          : ListView.builder(
                              itemCount: vm.searchResults.isNotEmpty ? vm.searchResults.length : vm.shopsResponse.length,
                              itemBuilder: (_, index) {
                                ShopData shop = vm.searchResults.isNotEmpty ? vm.searchResults[index] : vm.shopsResponse[index];
                                return Dismissible(
                                  onDismissed: (direction) {
                                    vm.onDismiss(index);
                                  },
                                  key: Key(shop.name),
                                  child: ShopCardWidget(
                                    navigate: () => vm.navigateToDetailView(shop),
                                    element: shop,
                                  ),
                                );
                              }),
                    )
                  ],
                ),
              ));
        });
  }
}
