import 'package:flutter/material.dart';
import 'package:mechine_test/model/product_model.dart';
import 'package:mechine_test/utils/product_util.dart';
import 'package:mechine_test/view/pages/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _curentIndex = 0;
  late TabController _tabController;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: const Text(
              "Hi, Rafi",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image.asset(
                "assets/images/user.png",
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/search.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 26, top: 10),
                child: Badge(
                  label: Text("3"),
                  backgroundColor: Colors.red,
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.black,
                      size: 32,
                    ),
                  ),
                ),
              )
            ],
            expandedHeight: 220,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset(
                                'assets/images/top_img.png',
                                fit: BoxFit.cover,
                              )),
                          const SizedBox(height: 20),
                          const Text(
                            'Categories',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverAppBar(
            primary: false,
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            toolbarHeight: kToolbarHeight + 20,
            title: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              onTap: (value) {
                setState(() {
                  _curentIndex = value;
                });
                _pageController.animateToPage(
                  value,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              tabs: [
                Card(
                  color: _curentIndex == 0 ? Colors.black : Colors.white,
                  shape: StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      'All',
                      style: TextStyle(
                        color: _curentIndex == 0 ? Colors.white : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: _curentIndex == 1 ? Colors.black : Colors.white,
                  shape: StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      'Men\'s',
                      style: TextStyle(
                        color: _curentIndex != 1 ? Colors.black : Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: _curentIndex == 2 ? Colors.black : Colors.white,
                  shape: StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      'Women\'s',
                      style: TextStyle(
                        color: _curentIndex != 2 ? Colors.black : Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: _curentIndex == 3 ? Colors.black : Colors.white,
                  shape: StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      'Girls',
                      style: TextStyle(
                        color: _curentIndex != 3 ? Colors.black : Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: _curentIndex == 4 ? Colors.black : Colors.white,
                  shape: StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      'Boys',
                      style: TextStyle(
                        color: _curentIndex != 4 ? Colors.black : Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                // color: Colors.green,
                // height: 1000,
                ),
          )
        ],
        body: PageView(
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
              _curentIndex = value;
            });
            _tabController.animateTo(value);
          },
          children: [
            productGrid('all'),
            productGrid('mens'),
            productGrid('womens'),
            productGrid('girls'),
            productGrid('boys'),
            productGrid('girls'),
          ],
        ),
      ),
    );
  }

  Widget productGrid(String categories) {
    List<AllDresses>? data = categories == 'all'
        ? allProducts
        : categories == 'girls'
            ? Girls
            : categories == 'mens'
                ? mens
                : categories == 'womens'
                    ? womens
                    : categories == "boys"
                        ? boys
                        : null;
    if (data != null) {
      return GridView.builder(
        itemCount: data.length,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 290,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsPage(
                  data: data[index],
                ),
              ));
            },
            child: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      // margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[300],
                          image: DecorationImage(
                              image: AssetImage(data[index].image),
                              fit: BoxFit.fitHeight)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 140, bottom: 150, top: 4),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white30),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  allProducts[index].isFave =
                                      !allProducts[index].isFave;
                                });
                              },
                              icon: Icon(
                                allProducts[index].isFave
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: allProducts[index].isFave
                                    ? Colors.pink
                                    : Colors.grey,
                                size: 32,
                              )),
                        ),
                      ),
                    ),
                    const Spacer(flex: 3),
                    Text(
                      data[index].name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(flex: 1),
                    Row(
                      children: [
                        Text(
                          '\$${data[index].price}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '\$${data[index].offer}',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.lineThrough,
                          ),
                        )
                      ],
                    ),
                    const Spacer(flex: 3),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } else {
      return const Center(
        child: Text("empty"),
      );
    }
  }
}
