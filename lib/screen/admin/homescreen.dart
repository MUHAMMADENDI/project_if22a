import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/config/asset.dart';
import 'package:project/event/event_pref.dart';
import 'package:project/screen/admin/list_mahasiswa.dart';
import 'package:project/screen/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Asset.colorPrimary,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              )
            ),
            child: const Image(
              image: NetworkImage('https://raw.githubusercontent.com/reflan/project_si21a/main/asset/images/Web-header-UTI-23.jpg'),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 25, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton('Mahasiswa', Icons.people, 0),
                    IconButton('Menu 2', Icons.mail, 0),
                    IconButton('Menu 3', Icons.folder, 0),
                    IconButton('Menu 4', Icons.person_add_alt_1, 0),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton('Menu 5', Icons.account_balance_wallet, 0),
                    IconButton('Menu 6', Icons.edit_road_outlined, 0),
                    IconButton('Menu 7', Icons.people, 0),
                    IconButton('Logout', Icons.logout_outlined, 99),
                  ],
                )
              ],
            ),
          ),
            Container (
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.topLeft,
              child: Text("Berita Tekini", style: TextStyle(
                color: Asset.colorPrimaryDark,
                fontWeight: FontWeight.bold,
                fontSize: 18
                )
              ),
            ),
            SizedBox(
              height: 170,
              child: ListView(
                children: [
                  CarouselSlider(
                    items: [
                      BeritaTerkini(
                        'https://asset-2.tstatic.net/tribunnews/foto/bank/images/uti-pts-lampung.jpg',
                         'judul 1',
                         'tanggal 1',),
                    BeritaTerkini(
                        'https://teknokrat.ac.id/wp-content/uploads/2023/01/WhatsApp-Image-2023-01-04-at-18.00.09.jpeg',
                        'judul 2',
                         'tanggal 2',),
                    BeritaTerkini(
                        'https://teknokrat.ac.id/wp-content/uploads/2023/04/Tim-Tari-Teknokrat-120323.jpeg',
                        'judul 3',
                         'tanggal 3',),
                    BeritaTerkini(
                        'https://teknokrat.ac.id/wp-content/uploads/2023/04/ddaa.png',
                        'judul 4',
                         'tanggal 4',),
                    BeritaTerkini(
                        'https://teknokrat.ac.id/wp-content/uploads/2023/04/Sekar-Kinasih-040423-1.jpg',
                        'judul 5',
                         'tanggal 5',),
                    ], 
                    options: CarouselOptions(
                      height: 170,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    viewportFraction: 0.8),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  final String nameLabel;
  final IconData iconLabel;
  final int index;

  IconButton(this.nameLabel, this.iconLabel, this.index);

  final List<Map> _fragment = [
    {'title':'Data Mahasiswa','view':ListMahasiswa()}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // margin: EdgeInsets.only(bottom: 5),
            child: Material(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              color: Color.fromRGBO(227, 66, 66, 0),
              child: InkWell(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
                onTap: () {
                  if (index == 99) {
                    EventPref.clear();
                    Get.off(Login());
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => _fragment[index]['view']),
                    );
                  }
                },
                child: Container(
                  // margin: EdgeInsets.all(5),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Asset.colorPrimaryDark,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Icon(
                          iconLabel,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              nameLabel,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
class BeritaTerkini extends StatelessWidget {
  final String img;
  final String judul;
  final String tanggal;

  BeritaTerkini(this.img, this.judul, this.tanggal);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  colors: [
                    Asset.colorPrimaryDark,
                    Colors.transparent,
                  ],
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  stops: [0.1, 0.9],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    judul,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                   tanggal,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      // alignment: Alignment(1, 1),
    );
  }
}