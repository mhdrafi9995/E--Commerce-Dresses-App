import 'package:flutter/material.dart';
import 'package:mechine_test/utils/sized_button.dart';

class SelectSize extends StatefulWidget {
  const SelectSize({super.key});

  @override
  State<SelectSize> createState() => _SelectSizeState();
}

class _SelectSizeState extends State<SelectSize> {
  int _sizeButtonIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: InkWell(
            onTap: () {
              setState(() {
                _sizeButtonIndex = index;
              });
            },
            child: Container(
              height: 40,
              width: 65,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(20),
                  color:
                      _sizeButtonIndex == index ? Colors.black : Colors.white),
              child: Center(
                child: Text(
                  sizeButton[index],
                  style: TextStyle(
                      color: _sizeButtonIndex == index
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 22),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
