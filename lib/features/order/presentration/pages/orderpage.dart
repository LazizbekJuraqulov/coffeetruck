import 'package:coffeetruck1/features/home/presentation/pages/homepage.dart';
import 'package:coffeetruck1/features/home/presentation/widgets/homewidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: SvgPicture.asset(
                    "assets/close.svg",
                    width: 10,
                    height: 10,
                  ),
                ),
              ),
              expandedHeight: 240,
              flexibleSpace: Stack(
                children: [
                  Positioned(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.pink,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/homelogo.png"))),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 15,
                      decoration: const BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                    ),
                  ),
                ],
              )),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                      color: Color(0xffffffff),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Best Bite Food Truck",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/telegram.svg",
                              width: 10,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Toshkent,GH",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_alarm_outlined,
                              size: 10,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "12:00-19:00 am",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: 50,
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 14,
                              ),
                              Text("3.9")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(12),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title:
                             Text("Would you like to place an order?"),
                            actions: <Widget>[
                              ElevatedButton(
                                child: new Text("Yes"),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        icon: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                
                                              ]),
                                          child: Icon(Icons.alarm_on_outlined ,
                                              size: 60, color: Colors.green),
                                        ),
                                        content: Text(
                                            "Your order has been accepted!!!"),
                                        actions: <Widget>[
                                          TextButton  (
                                            child: new Text("OK"),
                                            onPressed: () {
                                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeWidget()), (route) => false);
                                            },
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                              ElevatedButton(
                                child: new Text("No"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Card(
                      child: ListTile(
                        leading: Image.asset("assets/latte.png"),
                        title: Text("Latte"),
                        subtitle: Text(
                            "Flour Tortilla, Steak, Cheese,\n Avocado Sauce, Lime"),
                        trailing: Text("423\$"),
                      ),
                    ),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
