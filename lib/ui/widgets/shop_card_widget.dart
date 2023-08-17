import 'package:flutter/material.dart';

import '../../core/models/api_shops_response.dart';

class ShopCardWidget extends StatelessWidget {
  const ShopCardWidget({
    super.key,
    required this.element,
    required this.navigate,
  });

  final dynamic element;
  final VoidCallback navigate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: navigate,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: 133.3,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                child: Image(image: NetworkImage('https://picsum.photos/350/300')),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(element.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                      width: 120,
                      child: Text(
                        element.description,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
