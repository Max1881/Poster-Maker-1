

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/commanwidget.dart';
import 'package:poster_maker/Helper/utlity.dart';

Widget frame_15({isLogo, isPhone, isEmail, isWeb, isAddress}) {
  return Stack(
    children: [
      Align(
        alignment: Alignment.topLeft,
        child:(isLogo)?GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(left: 20, top: 20),
            height: Get.height * 0.04,
            width: Get.height * 0.04,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('${AssetPath.splash}logo.png'))),
          ),
        ):null,
      ),
      Align(
        alignment: Alignment.topRight,
        child: Column(
          children: [
            // sizeH(20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "${AssetPath.frame}insta.png",
                  scale: 1.5,
                ),
                // sizeW(5),
                Image.asset(
                  "${AssetPath.frame}twitter.png",
                  scale: 1.5,
                ),
                // sizeW(5),
                Image.asset(
                  "${AssetPath.frame}fb.png",
                  scale: 1.5,
                ),
                // sizeW(20),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, top: 10),
              child: text(text: 'Milan Vaghasiya', fontSize: Get.height * 0.015),
            ),
          ],
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: Get.width * 0.014),
                height: Get.height * 0.05,
                width: Get.width * 0.32,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("${AssetPath.frame}f25_lcr.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: (isEmail)?Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    icon(
                        icon: Icons.email_outlined,
                        color: Color(AppColor.white)),
                    const SizedBox(width: 3),
                    SizedBox(
                      width: Get.width * 0.25,
                      child: text(
                        text: 'yourgmail@gmail.com',
                        fontSize: Get.height * 0.012,
                        color: Color(AppColor.white),
                      ),
                    ),
                  ],
                ):null,
              ),
              Container(
                padding: EdgeInsets.only(left: Get.width * 0.014),
                height: Get.height * 0.05,
                width: Get.width * 0.32,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("${AssetPath.frame}f25_lcr.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                alignment: Alignment.center,
                child: (isPhone)?Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    icon(
                        icon: Icons.tablet_mac_outlined,
                        color: Color(AppColor.white)),
                    const SizedBox(width: 3),
                    SizedBox(
                      width: Get.width * 0.2,
                      child: text(
                        text: '9698563256',
                        fontSize: Get.height * 0.012,
                        color: Color(AppColor.white),
                      ),
                    ),
                  ],
                ):null,
              ),
              Container(
                padding: EdgeInsets.only(left: Get.width * 0.014),
                height: Get.height * 0.05,
                width: Get.width * 0.32,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("${AssetPath.frame}f25_lcr.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child:(isWeb)? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    icon(
                        icon: Icons.blur_circular,
                        color: Color(AppColor.white)),
                    const SizedBox(width: 3),
                    SizedBox(
                      width: Get.width * 0.25,
                      child: text(
                        text: 'website@gmail.com',
                        fontSize: Get.height * 0.012,
                        color: Color(AppColor.white),
                      ),
                    ),
                  ],
                ):null,
              ),
            ],
          ),
          Container(
            height: Get.height * 0.06,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("${AssetPath.frame}f25_center"
                    ".png"),
                fit: BoxFit.fill,
              ),
            ),
            child:(isAddress)?Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon(
                    icon: Icons.location_on_outlined,
                    color: Color(AppColor.white)),
                const SizedBox(
                  width: 2,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: text(
                      text:
                      "Akshay Nagar 1sft block 1st cross,Rammurthy nagar,Banglore- 560016",
                      color: Color(AppColor.white),
                      fontSize: Get.height * 0.013),
                ),
              ],
            ):null,
          ),
        ]),
      )
    ],
  );
}


 frame_16({isLogo, isPhone, isEmail, isWeb, isAddress})
{
  return Stack(children: [
    Align(alignment: Alignment.topCenter,child: Column(
      children: [
        Divider(color: Colors.red,thickness: 2),

        Divider(color: Colors.red,thickness:2),
      ],
    ),)
  ],) ;
}