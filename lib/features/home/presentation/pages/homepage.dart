import 'package:coffeetruck1/features/order/presentration/pages/orderpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? tabController;
  late int activIndex;
  List<MapObject> mapObjects = [];
  late PlacemarkMapObject mapObject;
  final MapObjectId mapObjectId = MapObjectId('normal_icon_placemark');
  late YandexMapController _controller;
  String nomer="";

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 2);
    mapObjects = [
      mapObject = PlacemarkMapObject(
        mapId: mapObjectId,
        point: Point(latitude: 41.311081, longitude: 69.240562),
        zIndex: 20,
        opacity: 1,
        isDraggable: false,
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
            image: BitmapDescriptor.fromAssetImage(
              'assets/metka.png',
            ),
            rotationType: RotationType.noRotation,
          ),
        ),
      )
    ];
    super.initState();
  }

 

  List isTrue = List.generate(10, (index) => true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("AppMaking.co"),
              accountEmail: Text(nomer.toString(),style: TextStyle(fontSize: 18,color: Colors.black),),
              currentAccountPicture: CircleAvatar(),
              decoration: BoxDecoration(color: Colors.amberAccent),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Page 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.train,
              ),
              title: const Text('Page 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/telegram.svg"),
            SizedBox(
              width: 4,
            ),
            Text(
              "Toshkent,GH",
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            SizedBox(
              width: 4,
            ),
            Icon(Icons.vertical_align_bottom),
          ],
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.star),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Get The App")
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Icon(Icons.chrome_reader_mode),
                    SizedBox(
                      width: 10,
                    ),
                    Text("About")
                  ],
                ),
              ),
            ],
            offset: Offset(0, 100),
            elevation: 2,
          ),
        ],
      ),
      body: YandexMap(
          mapObjects: mapObjects,
          onMapCreated: (YandexMapController controller) async {
            _controller = controller;
            controller.moveCamera(
                animation:
                    MapAnimation(duration: 2.0, type: MapAnimationType.smooth),
                CameraUpdate.newCameraPosition(CameraPosition(
                    target: Point(latitude: 41.311081, longitude: 69.240562))));
          }),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => OrderPage()));
        },
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18), color: Colors.white),
          height: 120,
          margin: EdgeInsets.only(left: 50, right: 20),
          child: Row(children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                    image: AssetImage("assets/truck.jpg"), fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 90,
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
                        style: TextStyle(color: Colors.black, fontSize: 10),
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
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
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
          ]),
        ),
      ),
    );
  }
}
