import 'package:flutter/material.dart';
import 'package:mechine_test/model/product_model.dart';
import 'package:mechine_test/view/pages/home_pages.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widget/price_bag.dart';
import '../../widget/sized_.dart';

class DetailsPage extends StatefulWidget {
  final AllDresses data;
  const DetailsPage({
    super.key,
    required this.data,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Details",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              "assets/images/shopping-bag.png",
              width: 35,
              height: 35,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 450,
                child: PageView.builder(
                    controller: _pageController,
                    itemCount: 3,
                    itemBuilder: (_, i) {
                      return Container(
                        margin: EdgeInsets.only(left: 5, right: 5),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(30)),
                        child: Image.asset(
                          widget.data.image,
                          fit: BoxFit.fitHeight,
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: SlideEffect(
                    spacing: 8.0,
                    radius: 4.0,
                    dotWidth: 10.0,
                    dotHeight: 10.0,
                    paintStyle: PaintingStyle.stroke,
                    strokeWidth: 1.5,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.indigo),
              ),
              SizedBox(
                height: 38,
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 240,
                      child: Text(
                        widget.data.name,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700,
                            fontSize: 22),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  CircleAvatar(
                    maxRadius: 14,
                    backgroundColor: Colors.lightBlueAccent,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  CircleAvatar(
                    maxRadius: 14,
                    backgroundColor: Color(0xFFF5DD06),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    maxRadius: 14,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_half_outlined,
                    color: Color(0xFFDCC80F),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "4.8",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "80 reviews",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.grey[500]),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SelectSize(),
              SizedBox(
                height: 32,
              ),
              PriceAndAdd(data: widget.data)
            ],
          ),
        ),
      ),
    );
  }
}
