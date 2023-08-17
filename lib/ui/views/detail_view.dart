import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:prueba_monja/core/models/api_shops_response.dart';
import 'package:prueba_monja/ui/widgets/dropdown_widget.dart';
import 'package:prueba_monja/ui/widgets/shop_card_widget.dart';
import 'package:stacked/stacked.dart';

import '../../core/viewmodel/detail_view_viewmodel.dart';

class DetailView extends StatelessWidget {
  DetailView({Key? key, required this.shopDetail}) : super(key: key);
  final ShopData shopDetail;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailViewViewModel>.reactive(
        viewModelBuilder: () => DetailViewViewModel(shopDetail),
        onModelReady: (vm) {
          vm.init();
        },
        builder: (context, vm, child) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(shopDetail.name, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  Text(shopDetail.category),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      shopDetail.description,
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Promociones'),
                      DropDownWidget(
                        onChanged: vm.findByPercent,
                      ),
                    ],
                  ),
                  CarouselSlider(
                    items: vm.results
                        .map((PromotionData promotion) => ShopCardWidget(
                            element: promotion,
                            navigate: () {
                              vm.navigateToPromotionView(promotion);
                            }))
                        .toList(),
                    options: CarouselOptions(
                      height: 130.0,
                      enlargeCenterPage: false,
                      autoPlay: vm.results.length == 1 ? false : true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: vm.results.length == 1 ? false : true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  )

                  /*Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                      width: double.maxFinite,
                      height: 133,
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView.separated(
                                shrinkWrap: true,
                                separatorBuilder: (context, index) => const SizedBox(
                                      width: 20,
                                    ),
                                itemCount: vm.results.isNotEmpty ? vm.results.length : shopDetail.promotions.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, index) {
                                  PromotionData promotion = vm.results.isNotEmpty ? vm.results[index] : shopDetail.promotions[index];
                                  return ShopCardWidget(element: promotion, navigate: () {});
                                }),
                          ),
                        ],
                      ),
                    ),
                  )*/
                ],
              ),
            ),
          );
        });
  }
}
