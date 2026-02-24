import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class MainMobile extends StatefulWidget {
  final VoidCallback? onGetInTouchTap;

  const MainMobile({super.key, this.onGetInTouchTap});

  @override
  State<MainMobile> createState() => _MainMobileState();
}

class _MainMobileState extends State<MainMobile> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    //final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      height: screenHeight / 1.5,
      constraints: const BoxConstraints(minHeight: 540),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(colors: [
                CustomColor.scaffoldBg.withOpacity(0.4),
                CustomColor.scaffoldBg.withOpacity(0.4)
              ]).createShader(bounds);
            },
            blendMode: BlendMode
                .srcATop, //enables to manupulate the opacity of the widget
            child: Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/profilepicture.jpg'),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Hi,\nI'm Sadhana Karki\nA Flutter Developer ",
                    style: TextStyle(
                        fontSize: 24,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 190,
                    child: ElevatedButton(
                      onPressed: widget.onGetInTouchTap,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColor.yellowPrimary,
                          foregroundColor: CustomColor.whitePrimary),
                      child: const Text("Get in touch"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
