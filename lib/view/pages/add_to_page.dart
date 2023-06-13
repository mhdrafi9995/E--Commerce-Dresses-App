import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mechine_test/model/product_model.dart';

class AddToPAge extends StatefulWidget {
  final AllDresses data;

  AddToPAge({
    super.key,
    required this.data,
  });

  @override
  State<AddToPAge> createState() => _AddToPAgeState();
}

class _AddToPAgeState extends State<AddToPAge> {
  List<int> counts = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.black, fontFamily: "Poppins"),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 700,
            child: SafeArea(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: counts.length,
                // physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Slidable(
                    endActionPane:
                        ActionPane(motion: const StretchMotion(), children: [
                      Expanded(
                        child: SizedBox(
                          height: 130,
                          child: SlidableAction(
                            onPressed: (context) {},
                            backgroundColor: Colors.grey,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: "Delete",
                          ),
                        ),
                      ),
                    ]),
                    child: Container(
                      width: double.infinity,
                      // height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200]),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              width: 80,
                              height: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[300],
                                  image: DecorationImage(
                                      image: AssetImage(widget.data.image),
                                      fit: BoxFit.fitHeight)),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Boy Dresses",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Poppins"),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Poppins"),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "SIze- L",
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          Material(
                            color: Colors.transparent,
                            child: Ink(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (counts[index] > 0) {
                                        setState(() {
                                          counts[index]--;
                                        });
                                      }
                                      print(counts);
                                    },
                                    borderRadius: BorderRadius.circular(15),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Icon(Icons.remove),
                                    ),
                                  ),
                                  Text(
                                    '${counts[index]}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        counts[index]++;
                                      });
                                      print(counts);
                                    },
                                    borderRadius: BorderRadius.circular(15),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Icon(Icons.add),
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
                ),
                separatorBuilder: (context, index) => SizedBox(height: 5),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: Text(
                  "Amount Price",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "\$ 546",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                    ),
                    child: Container(
                      width: 180,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Check Out",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: const Center(
                                  child: Text(
                                "4",
                                style: TextStyle(
                                    fontFamily: "Poppins", fontSize: 18),
                              )))
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
