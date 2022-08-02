import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter29july/widgets/theme.dart';
import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Mytheme.darkBluishColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().expand()
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ));
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App"
            .text
            .xl5
            .bold
            .color(Color.fromARGB(255, 207, 206, 206))
            .make(),
        "Trending products"
            .text
            .xl
            .color(Color.fromARGB(255, 246, 8, 8))
            .make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(
            image: catalog.image,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg
                  .color(Color.fromARGB(255, 19, 19, 19))
                  .bold
                  .make(),
              catalog.desc.text
                  .textStyle(context.captionStyle)
                  .color(Color.fromARGB(255, 17, 16, 16))
                  .make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}"
                      .text
                      .bold
                      .xl
                      .color(Color.fromARGB(255, 246, 8, 8))
                      .make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Mytheme.darkBluishColor),
                        shape: MaterialStateProperty.all(
                          StadiumBorder(),
                        )),
                    child: "Buy".text.make(),
                  )
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    )
        .white
        .rounded
        .square(150)
        .color(Color.fromARGB(255, 181, 179, 179))
        .make()
        .py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(Mytheme.creamColor).make().p12().w32(context);
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter29july/widgets/theme.dart';
// import 'package:velocity_x/velocity_x.dart';
// import 'dart:convert';

// import '../models/catalog.dart';
// import '../widgets/drawer.dart';
// import '../widgets/item_widget.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final int days = 30;

//   final String name = "Codepur";

//   @override
//   void initState() {
//     super.initState();
//     loadData();
//   }

//   loadData() async {
//     await Future.delayed(Duration(seconds: 2));
//     final catalogJson =
//         await rootBundle.loadString("assets/files/catalog.json");
//     final decodedData = jsonDecode(catalogJson);
//     var productsData = decodedData["products"];
//     CatalogModel.items = List.from(productsData)
//         .map<Item>((item) => Item.fromMap(item))
//         .toList();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(padding: Vx.m32, child: catalogHeader()),
//       ),

//       // backgroundColor: Colors.grey,
//       // appBar: AppBar(
//       //   // elevation: 0,
//       //   // iconTheme: IconThemeData(color: Colors.white),
//       //   backgroundColor: Color.fromARGB(255, 72, 71, 71),
//       //   title: Center(
//       //       child: Text(
//       //     "Mobile Application",
//       //     style: TextStyle(fontWeight: FontWeight.bold),
//       //   )),
//       // ),
//       // body: Padding(
//       //   padding: const EdgeInsets.all(16.0),
//       //   child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
//       //       ? GridView.builder(
//       //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       //               crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
//       //           itemBuilder: (context, index) {
//       //             final item = CatalogModel.items[index];
//       //             return Card(
//       //               clipBehavior: Clip.antiAlias,
//       //               shape: RoundedRectangleBorder(
//       //                   borderRadius: BorderRadius.circular(10)),
//       //               child: GridTile(
//       //                   header: Container(
//       //                     child: Text(
//       //                       item.name,
//       //                       style: TextStyle(color: Colors.white),
//       //                     ),
//       //                     decoration: BoxDecoration(
//       //                         color: Color.fromARGB(255, 72, 71, 71)),
//       //                     padding: const EdgeInsets.all(8),
//       //                   ),
//       //                   child: Image.network(item.image),
//       //                   footer: Container(
//       //                     child: Text(
//       //                       "\$${item.price.toString()}",
//       //                       style: TextStyle(color: Colors.white),
//       //                     ),
//       //                     decoration: BoxDecoration(
//       //                         color: Color.fromARGB(255, 72, 71, 71)),
//       //                     padding: const EdgeInsets.all(8),
//       //                   )),
//       //             );
//       //           },
//       //           itemCount: CatalogModel.items.length,
//       //         )
//       //       // ? ListView.builder(
//       //       //     itemCount: CatalogModel.items.length,
//       //       //     itemBuilder: (context, index) => ItemWidget(
//       //       //       item: CatalogModel.items[index],
//       //       //     ),
//       //       //   )
//       //       : Center(
//       //           child: CircularProgressIndicator(),
//       //         ),
//       // ),
//     );
//   }
// }

// class catalogHeader extends StatelessWidget {
//   const catalogHeader({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       "Mobile App".text.xl4.bold.color(Color.fromARGB(255, 77, 76, 76)).make(),
//       "Mobile Products"
//           .text
//           .xl
//           .color(Color.fromARGB(255, 244, 130, 130))
//           .make(),
//     ]);
//   }
// }
