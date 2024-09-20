import 'package:flutter/material.dart';
import 'package:newui/widgets/description/about_story.dart';
import 'package:newui/widgets/favourites/presentation/declarations/constants2.dart';

class SliverListBldr extends StatelessWidget {
  const SliverListBldr({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double containerBorderRadius = 12.0;
    const double coverImageBorderRadius = 12.0;

    return SliverPadding(
      padding: EdgeInsets.only(top: 20), // Add padding at the top
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                // Handle tap on the entire container
                print('Tapped on the container');
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutStoryPage()),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(left: kSpacing, bottom: 20, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(containerBorderRadius),
                    color: secondaryColor.withOpacity(0.3),
                  ),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      // Left side - Cover card/picture
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(coverImageBorderRadius),
                            bottomLeft: Radius.circular(coverImageBorderRadius),
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/image/C.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      // Right side - Title, Description, and Arrow Icon
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Title',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Description goes here. Add your description text.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      // Make the arrow tappable
                      InkWell(
                      onTap: () {
                      // Handle tap on the arrow
                      print('Tapped on the arrow');
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutStoryPage()),
                        );
                        },
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          childCount: 15,
        ),
      ),
    );
  }
}
