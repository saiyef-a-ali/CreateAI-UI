import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _CustomIcon(
                icon: Icons.stars,
                text: "89%",
              ),
              _CustomIcon(
                icon: Icons.tv,
                text: "89%",
              ),
              _CustomIcon(
                icon: Icons.wc,
                text: "89%",
              ),
              _CustomIcon(
                icon: Icons.av_timer_rounded,
                text: "89%",
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "uygvfvsayvdtyufgvayfyasghvashgjvagfcvgv hvbjhvafjhcfvhjvcvx j idgdfgdhksgfiutg ifgu iugiugigsiyfgvc cfguyfghgiycfiug giyufgyisg dsgdciug iiufgidgsi dyfg guigeifugiygfygifdgfgdfgdhgfdgfdgfdgfgdfgfgd",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 10),
            child: Text(
              "Charecters",
              style: TextStyle(fontSize: 23),
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                8,
                (index) => Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      height: size.height * 0.18,
                      width: size.width * 0.23,
                      image: AssetImage(
                        'assets/related${index + 1}.jpg', // Replace with your image path
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'Seansons',
              style: TextStyle(fontSize: 23),
            ),
          ),
          _Features(
            size: size,
            title: "chapter 1",
            subtitle: "progress",
            colorline: Color(0xFF0000),
          ),
          _Features(
            size: size,
            title: "chpt  2",
            subtitle: "progress",
            colorline: Color(0xFF0000),
          ),
          _Features(
            size: size,
            title: "chpt 3",
            subtitle: "1",
            colorline:Color(0xFF808080),
          ),
          _Features(
            size: size,
            title: "",
            subtitle: "progress",
            colorline: Color(0xFF808080),
          ),
        ],
      ),
    );
  }
}

class _CustomIcon extends StatelessWidget {
  const _CustomIcon({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 45,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 20, color: Colors.grey),
        )
      ],
    );
  }
}

class _Features extends StatelessWidget {
  const _Features({
    Key? key,
    required this.size,
    required this.title,
    required this.subtitle,
    required this.colorline,
  }) : super(key: key);

  final Size size;
  final String title;
  final String subtitle;
  final Color colorline;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: size.width,
      color: Colors.white, // Replace with your desired background color
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  subtitle, // Fix: Use 'subtitle' here instead of 'title'
                  style: TextStyle(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(
                    height: 5,
                    color: colorline,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
