import 'package:flutter/material.dart';
import 'package:mechine_test/model/product_model.dart';
import 'package:mechine_test/view/pages/add_to_page.dart';

class PriceAndAdd extends StatefulWidget {
  final AllDresses data;
  const PriceAndAdd({
    super.key,
    required this.data,
  });

  @override
  State<PriceAndAdd> createState() => _PriceAndAddState();
}

class _PriceAndAddState extends State<PriceAndAdd> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 40,
          ),
          child: Text(
            "#${widget.data.price}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
        ),
        SizedBox(
          width: 40,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddToPAge(
                data: widget.data,
              ),
            ));
          },
          child: Container(
            width: 180,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/shopping-bag.png",
                  color: Colors.white,
                  width: 24,
                ),
                const SizedBox(
                  width: 18,
                ),
                const Text(
                  "Add to Bag",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
