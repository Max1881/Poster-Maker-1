// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_import, file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/page/bottomnavbar/appbar/Appbar.dart';
import 'package:poster_maker/page/bottomnavbar/bottomnavbar.dart';

class CustomScreen extends StatelessWidget {
  const CustomScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     // DeviceOrientation
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          commanAppbar(
              pageName: 'Create',
              ontap: () {
                Get.offAll(BottomNavBarScreen());
              }),
          custom(),
          insta(),
          facebook(),
          twitter(),
          linkDin(),
          general()
        ],
      ),
    );
  }

  Widget containt({double height, double width, colors, onTap, widget}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Get.height * 0.2,
        width: Get.width * 0.33,
        // color: Colors.yellow.shade100,
        child: Center(
            child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(blurRadius: 5, color: Colors.grey.withOpacity(0.3))
              ],
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: colors)),
          child: widget,
        )),
      ),
    );
  }

  Widget contentName({text}) {
    return SizedBox(
      width: Get.width * 0.33,
      height: Get.height * 0.05,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: AppFont.Medium, fontSize: 12),
      ),
    );
  }

  Widget title({text}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextStyle(fontFamily: AppFont.Medium, fontSize: 20),
          ),
        ],
      ),
    );
  }

  //custom
  Widget custom() {
    return Wrap(
      children: [
        title(text: 'Cusftom'),
        containt(height: 110, width: 110, colors: [
          Color(0xFFC6D1C6).withOpacity(0.3),
          Color(0xFFC6D1C6),
          Color(0xFFC6D1C6).withOpacity(0.5),
        ]),
        containt(height: 110, width: 110, colors: [
          Color(0xFFC6D1C6).withOpacity(0.3),
          Color(0xFFC6D1C6),
          Color(0xFFC6D1C6).withOpacity(0.5),
        ]),
        containt(height: 70, width: 120, colors: [
          Color(0xFFC6D1C6).withOpacity(0.3),
          Color(0xFFC6D1C6),
          Color(0xFFC6D1C6).withOpacity(0.5),
        ]),
        contentName(text: 'Custom'),
        contentName(text: '(1:1)'),
        contentName(text: '(16:9)'),
        containt(height: Get.height * 0.2, width: 70, colors: [
          Color(0xFFC6D1C6).withOpacity(0.3),
          Color(0xFFC6D1C6),
          Color(0xFFC6D1C6).withOpacity(0.5),
        ]),
        containt(height: 80, width: 120, colors: [
          Color(0xFFC6D1C6).withOpacity(0.3),
          Color(0xFFC6D1C6),
          Color(0xFFC6D1C6).withOpacity(0.5),
        ]),
        containt(height: 120, width: 80, colors: [
          Color(0xFFC6D1C6).withOpacity(0.3),
          Color(0xFFC6D1C6),
          Color(0xFFC6D1C6).withOpacity(0.5),
        ]),
        contentName(text: '(9:16)'),
        contentName(text: '(4:3)'),
        contentName(text: '(3:4)'),
      ],
    );
  }

// instagram
  Widget insta() {
    return Wrap(
      children: [
        title(text: 'Instagram'),
        containt(
            height: 90,
            width: 90,
            colors: [
              Color(0xFF833AB4),
              Color(0xFFE1306C),
              Color(0xFFF77737),
            ],
            widget: instaIcon(size: 33)),
        containt(
            height: 100,
            width: 60,
            colors: [
              Color(0xFF833AB4),
              Color(0xFFE1306C),
              Color(0xFFF77737),
            ],
            widget: instaIcon(size: 18)),
        containt(
            height: 70,
            width: 70,
            colors: [
              Color(0xFF833AB4),
              Color(0xFFE1306C),
              Color(0xFFF77737),
            ],
            widget: instaIcon(size: 25)),
        contentName(text: 'Instagram'),
        contentName(text: "Instagram Story"),
        contentName(text: "Instagram profile"),
        containt(
            height: 70,
            width: 50,
            colors: [
              Color(0xFF833AB4),
              Color(0xFFE1306C),
              Color(0xFFF77737),
            ],
            widget: instaIcon(size: 15)),
        containt(
            height: 80,
            width: 65,
            colors: [
              Color(0xFF833AB4),
              Color(0xFFE1306C),
              Color(0xFFF77737),
            ],
            widget: instaIcon(size: 22)),
        containt(
            height: 70,
            width: Get.width * 0.3,
            colors: [
              Color(0xFF833AB4),
              Color(0xFFE1306C),
              Color(0xFFF77737),
            ],
            widget: instaIcon(size: 25)),
        contentName(text: 'IGTV Cover'),
        contentName(text: "Insta Landscape"),
        contentName(text: "Insta Landscape"),
      ],
    );
  }

//facebook
  Widget facebook() {
    return Wrap(
      children: [
        title(text: 'Facebook'),
        containt(
          widget: facebookIcon(size: 20),
          height: 60,
          width: 60,
          colors: [Color(0xFF4267B2), Color(0xFF4267B2)],
        ),
        containt(
          widget: facebookIcon(size: 12),
          height: 40,
          width: 80,
          colors: [Color(0xFF4267B2), Color(0xFF4267B2)],
        ),
        containt(
          widget: facebookIcon(size: 16),
          height: 50,
          width: 80,
          colors: [Color(0xFF4267B2), Color(0xFF4267B2)],
        ),
        contentName(text: 'Facebook Profile'),
        contentName(text: 'Facebook Cover'),
        contentName(text: 'Facebook Ad'),
        containt(
          widget: facebookIcon(size: 20),
          height: 60,
          width: 90,
          colors: [Color(0xFF4267B2), Color(0xFF4267B2)],
        ),
        containt(
          widget: facebookIcon(size: 20),
          height: 60,
          width: 90,
          colors: [Color(0xFF4267B2), Color(0xFF4267B2)],
        ),
        containt(
          widget: facebookIcon(size: 20),
          height: 60,
          width: 90,
          colors: [Color(0xFF4267B2), Color(0xFF4267B2)],
        ),
        contentName(text: 'Facebook Link'),
        contentName(text: 'Facebook Post'),
        contentName(text: 'Facebook Event'),
        containt(
          widget: facebookIcon(size: 27),
          height: 100,
          width: 80,
          colors: [Color(0xFF4267B2), Color(0xFF4267B2)],
        ),
        containt(
          widget: facebookIcon(size: 25),
          height: 70,
          width: Get.width * 0.3,
          colors: [Color(0xFF4267B2), Color(0xFF4267B2)],
        ),
        containt(
          widget: facebookIcon(size: 20),
          height: 60,
          width: 90,
          colors: [Color(0xFF4267B2), Color(0xFF4267B2)],
        ),
        contentName(text: 'Facebook Reels'),
        contentName(text: 'Facebook Video'),
        contentName(text: 'Facebook Group '),
      ],
    );
  }

//Twitter
  Widget twitter() {
    return Wrap(
      children: [
        title(text: 'Twitter'),
        containt(
            height: 60,
            width: 115,
            colors: [Color(0xFF1DA1F2), Color(0xFF1DA1F2)],
            widget: twitterIcon(size: 20)),
        containt(
            height: 45,
            width: 90,
            colors: [Color(0xFF1DA1F2), Color(0xFF1DA1F2)],
            widget: twitterIcon(size: 15)),
        containt(
            height: 80,
            width: 80,
            colors: [Color(0xFF1DA1F2), Color(0xFF1DA1F2)],
            widget: twitterIcon(size: 30)),
        contentName(text: 'Twitter Post'),
        contentName(text: 'Twitter Header'),
        contentName(text: 'Twitter Profile'),
      ],
    );
  }

//Linkdin
  Widget linkDin() {
    return Wrap(
      children: [
        title(text: 'Linkdin'),
        containt(
          height: 35,
          width: 90,
          widget: linkdinIcon(size: 10),
          colors: [
            Color(0xFF0077B5),
            Color(0xFF0077B5),
          ],
        ),
        containt(
          height: 50,
          width: 50,
          widget: linkdinIcon(size: 18),
          colors: [
            Color(0xFF0077B5),
            Color(0xFF0077B5),
          ],
        ),
        containt(
          height: 25,
          width: 90,
          widget: linkdinIcon(size: 7),
          colors: [
            Color(0xFF0077B5),
            Color(0xFF0077B5),
          ],
        ),
        contentName(text: 'Linkdin Banner'),
        contentName(text: 'Linkdin Logo'),
        contentName(text: 'Linkdin Banner'),
        containt(
          height: 60,
          width: 110,
          widget: linkdinIcon(size: 20),
          colors: [
            Color(0xFF0077B5),
            Color(0xFF0077B5),
          ],
        ),
        containt(
          height: 40,
          width: 110,
          widget: linkdinIcon(size: 12),
          colors: [
            Color(0xFF0077B5),
            Color(0xFF0077B5),
          ],
        ),
        containt(
          height: 55,
          width: 90,
          widget: linkdinIcon(size: 20),
          colors: [
            Color(0xFF0077B5),
            Color(0xFF0077B5),
          ],
        ),
        contentName(text: 'Linkdin sponsored'),
        contentName(text: 'Linkdin Business'),
        contentName(text: 'Linkdin Image'),
      ],
    );
  }

//General
  Widget general() {
    return Wrap(
      children: [
        title(text: 'General'),
        containt(
            height: 120,
            width: 80,
            colors: [
              Color(0xFF50B53E),
              Color(0xFF50B53E),
            ],
            widget: generalIcon(
              image: '${AssetPath.custom}whatsapp.png',
              size: 25,
              color: Colors.white,
            )),
        containt(
            height: 120,
            width: 70,
            colors: [
              Color(0xFFF00606),
              Color(0xFFF00606),
            ],
            widget: generalIcon(
              image: '${AssetPath.custom}pinterest-p.png',
              size: 26,
              color: Colors.white,
            )),
        containt(
            height: 70,
            width: 120,
            colors: [
              Color(AppColor.orange),
              Color(AppColor.yellow),
            ],
            widget: generalIcon(
              image: '${AssetPath.custom}blog.png',
              size: 22,
              color: Colors.white,
            )),
        contentName(text: 'Whatsapp'),
        contentName(text: 'Pinterest'),
        contentName(text: 'Blog Banner'),
        containt(
            height: 120,
            width: 80,
            colors: [
              Color(AppColor.orange),
              Color(AppColor.yellow),
            ],
            widget: generalIcon(
              image: '${AssetPath.custom}blog.png',
              size: 28,
              color: Colors.white,
            )),
        containt(
            height: 100,
            width: 90,
            colors: [
              Color(AppColor.bgcolor),
              Color(AppColor.bgcolor),
            ],
            widget: generalIcon(
                image: '${AssetPath.custom}PhotoCollage.png', size: 30)),
        containt(
            height: 70,
            width: 120,
            colors: [
              Color(AppColor.white),
              Color(AppColor.white),
            ],
            widget:
                generalIcon(image: '${AssetPath.custom}youtube.png', size: 22)),
        contentName(text: 'Blog Graphics'),
        contentName(text: 'Photo Collage'),
        contentName(text: 'Youtube'),
        containt(
            height: 60,
            width: 100,
            colors: [
              Color(0xFFC6D1C6).withOpacity(0.3),
              Color(0xFFC6D1C6),
              Color(0xFFC6D1C6).withOpacity(0.5),
            ],
            widget: generalIcon(
                image: '${AssetPath.custom}card.png',
                size: 20,
                color: Colors.black38)),
        containt(
            height: 100,
            width: 90,
            colors: [
              Color(0xFFC6D1C6).withOpacity(0.3),
              Color(0xFFC6D1C6),
              Color(0xFFC6D1C6).withOpacity(0.5),
            ],
            widget: generalIcon(
                image: '${AssetPath.custom}wings.png',
                size: 20,
                color: Colors.black38)),
        containt(
            height: 70,
            width: 100,
            colors: [
              Color(0xFFC6D1C6).withOpacity(0.3),
              Color(0xFFC6D1C6),
              Color(0xFFC6D1C6).withOpacity(0.5),
            ],
            widget: generalIcon(
                image: '${AssetPath.custom}postcard.png',
                size: 22,
                color: Colors.black38)),
        contentName(text: 'Business Card'),
        contentName(text: 'Logo'),
        contentName(text: 'Post Card'),
        containt(
            height: 60,
            width: 100,
            colors: [
              Color(0xFFC6D1C6).withOpacity(0.3),
              Color(0xFFC6D1C6),
              Color(0xFFC6D1C6).withOpacity(0.5),
            ],
            widget: generalIcon(
                image: '${AssetPath.custom}pictures.png',
                size: 20,
                color: Colors.black38)),
        containt(
            height: 70,
            width: 100,
            colors: [
              Color(0xFFC6D1C6).withOpacity(0.3),
              Color(0xFFC6D1C6),
              Color(0xFFC6D1C6).withOpacity(0.5),
            ],
            widget: generalIcon(
                image: '${AssetPath.custom}certified.png',
                size: 22,
                color: Colors.black38)),
        containt(
            height: 60,
            width: 90,
            colors: [
              Color(0xFFC6D1C6).withOpacity(0.3),
              Color(0xFFC6D1C6),
              Color(0xFFC6D1C6).withOpacity(0.5),
            ],
            widget: generalIcon(
                image: '${AssetPath.custom}gift-voucher.png',
                size: 22,
                color: Colors.black38)),
        contentName(text: 'Desktop'),
        contentName(text: 'Certificate'),
        contentName(text: 'Gift'),
        containt(
            height: 60,
            width: 90,
            colors: [
              Color(0xFFC6D1C6).withOpacity(0.3),
              Color(0xFFC6D1C6),
              Color(0xFFC6D1C6).withOpacity(0.5),
            ],
            widget: generalIcon(
                image: '${AssetPath.custom}label.png',
                size: 20,
                color: Colors.black38)),
        containt(
            height: 100,
            width: 80,
            colors: [
              Color(0xFFC6D1C6).withOpacity(0.3),
              Color(0xFFC6D1C6),
              Color(0xFFC6D1C6).withOpacity(0.5),
            ],
            widget: generalIcon(
                image: '${AssetPath.custom}loudspeaker.png',
                size: 25,
                color: Colors.black38)),
        containt(
            height: 90,
            width: 90,
            colors: [
              Color(0xFFC6D1C6).withOpacity(0.3),
              Color(0xFFC6D1C6),
              Color(0xFFC6D1C6).withOpacity(0.5),
            ],
            widget: generalIcon(
                image: '${AssetPath.custom}handbag.png',
                size: 27,
                color: Colors.black38)),
        contentName(text: 'Label'),
        contentName(text: 'Announcement'),
        contentName(text: 'Icon'),
        containt(
            height: 70,
            width: 100,
            colors: [
              Color(0xFFC6D1C6).withOpacity(0.3),
              Color(0xFFC6D1C6),
              Color(0xFFC6D1C6).withOpacity(0.5),
            ],
            widget: generalIcon(
                image: '${AssetPath.custom}presentation.png',
                size: 20,
                color: Colors.black38)),
        containt(
            height: 120,
            width: 70,
            colors: [
              Color(0xFFC6D1C6).withOpacity(0.3),
              Color(0xFFC6D1C6),
              Color(0xFFC6D1C6).withOpacity(0.5),
            ],
            widget: generalIcon(
                image: '${AssetPath.custom}wedding-planning.png',
                size: 22,
                color: Colors.black38)),
        containt(
            height: 60,
            width: 100,
            colors: [
              Color(0xFFC6D1C6).withOpacity(0.3),
              Color(0xFFC6D1C6),
              Color(0xFFC6D1C6).withOpacity(0.5),
            ],
            widget: generalIcon(
                image: '${AssetPath.custom}presentation.png',
                size: 20,
                color: Colors.black38)),
        contentName(text: 'presentation'),
        contentName(text: 'Logo'),
        contentName(text: 'presentation'),
        containt(
            height: 120,
            width: 80,
            colors: [
              Color(0xFFC6D1C6).withOpacity(0.3),
              Color(0xFFC6D1C6),
              Color(0xFFC6D1C6).withOpacity(0.5),
            ],
            widget: generalIcon(
                image: '${AssetPath.custom}resume-cv.png',
                size: 25,
                color: Colors.black38)),
        SizedBox(width: Get.width * 0.33),
        SizedBox(width: Get.width * 0.33),
        contentName(text: 'Resume'),
      ],
    );
  }
}

generalIcon({double size, String image, color}) {
  return Container(
    padding: EdgeInsets.all(size),
    child: Center(
      child: Image.asset(
        image,
        color: color,
      ),
    ),
  );
}

linkdinIcon({double size}) {
  return Container(
    padding: EdgeInsets.all(size),
    child: Center(
      child: Image.asset(
        '${AssetPath.custom}linkedin.png',
        color: Color(AppColor.white),
      ),
    ),
  );
}

twitterIcon({double size}) {
  return Container(
    padding: EdgeInsets.all(size),
    child: Center(
      child: Image.asset(
        '${AssetPath.custom}twitter.png',
        color: Color(AppColor.white),
      ),
    ),
  );
}

facebookIcon({double size}) {
  return Container(
    padding: EdgeInsets.all(size),
    child: Center(
      child: Image.asset(
        '${AssetPath.custom}facebook.png',
        color: Color(AppColor.white),
      ),
    ),
  );
}

instaIcon({double size}) {
  return Container(
    padding: EdgeInsets.all(size),
    child: Center(
      child: Image.asset(
        '${AssetPath.custom}instagram.png',
        color: Color(AppColor.white),
      ),
    ),
  );
}
