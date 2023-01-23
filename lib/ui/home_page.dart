import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moda_app_ui/ui/details_page.dart';

import '../helper/constants/constansts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        child: TabBar(
          labelColor: Colors.black,
          indicatorColor: Colors.brown.withOpacity(0.6),
          padding: EdgeInsets.symmetric(vertical: 10),
          tabs: const [
            Icon(
              Icons.more,
              size: 24,
              color: Colors.grey,
            ),
            Icon(
              Icons.play_arrow,
              size: 24,
              color: Colors.grey,
            ),
            Icon(
              Icons.navigation,
              size: 24,
              color: Colors.grey,
            ),
            Icon(
              Icons.supervised_user_circle,
              size: 24,
              color: Colors.grey,
            ),
          ],
          controller: tabController,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Constants.appBarText,
        elevation: 0,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              SizedBox(
                height: 200,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    _listViewItems(
                        'assets/model1.jpeg', 'assets/chanellogo.jpg'),
                    _listViewItems(
                        'assets/model2.jpeg', 'assets/chloelogo.png'),
                    _listViewItems(
                        'assets/model3.jpeg', 'assets/louisvuitton.jpg'),
                    _listViewItems(
                        'assets/model1.jpeg', 'assets/chanellogo.jpg'),
                    _listViewItems(
                        'assets/model3.jpeg', 'assets/chanellogo.jpg'),
                  ],
                ),
              ),
              _card(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _listViewItems(String imagePath, String logoPath) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 3, color: const Color.fromRGBO(242, 9, 67, 1)),
                  borderRadius: const BorderRadius.all(Radius.circular(60)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(60)),
                        image: DecorationImage(
                            image: AssetImage(
                              imagePath,
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 70,
              left: 64,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        image: AssetImage(
                          logoPath,
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              elevation: MaterialStateProperty.all(0)),
          onPressed: () {},
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(colors: [
                  Colors.orange,
                  Colors.red,
                  Colors.redAccent,
                  Colors.pinkAccent,
                  Colors.orange
                ])),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                'Follow',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _card() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        clipBehavior: Clip.antiAlias,
        elevation: 40,
        child: Container(
          height: 460,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            image: const DecorationImage(
                                image: AssetImage('assets/irina.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            "Irina Kalesnik",
                            style: GoogleFonts.aBeeZee(
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w300)),
                          ),
                          Text(
                            "10 mins ago",
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.3)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Icon(Icons.more_vert)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              _modelImages(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _chips("#Fashion"),
                  _chips("#Model"),
                  _chips("#Girl design")
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _actions(icon: Icons.reply, count: 100),
                      SizedBox(
                        width: 20,
                      ),
                      _actions(icon: Icons.comment, count: 523)
                    ],
                  ),
                  _actions(icon: Icons.favorite, count: 999, color: Colors.red)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _modelImages() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailsPage(imgPath: "assets/modelgrid3.jpeg")));
          },
          child: Hero(
            tag: "assets/modelgrid3.jpeg",
            child: Container(
              height: (MediaQuery.of(context).size.height - 270) / 2,
              width: (MediaQuery.of(context).size.width - 100) / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('assets/modelgrid3.jpeg'),
                      fit: BoxFit.cover)),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailsPage(imgPath: "assets/modelgrid1.jpeg")));
                },
                child: Hero(
                  tag: "assets/modelgrid1.jpeg",
                  child: Container(
                    height: 100,
                    width: 140,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/modelgrid1.jpeg'),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                 onTap: () {
                   Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) =>
                               DetailsPage(imgPath: "assets/modelgrid2.jpeg")));
                 },
                child: Hero(
                  tag: "assets/modelgrid2.jpeg" ,
                  child: Container(
                    height: 100,
                    width: 140,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/modelgrid2.jpeg'),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _chips(String text) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.brown.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16)),
      child: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _actions({required IconData icon, required int count, Color? color}) {
    return Row(
      children: [
        Text(count.toString()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            icon,
            color: color,
          ),
        )
      ],
    );
  }
}
