import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class MainTablet extends StatelessWidget {
  final VoidCallback? onGetInTouchTap;
  
  const MainTablet({super.key, this.onGetInTouchTap});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    
    return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: screenSize.height/1.23,
          width: screenWidth,
          constraints:const BoxConstraints(minHeight: 350),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Hi,\nI'm Sadhana Karki\nA Flutter Developer ",style: TextStyle(
                    fontSize: 27,
                    height: 1.4,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.whitePrimary
                    ),),
                  const SizedBox(height: 15,),
                  SizedBox(
                    width: 215,
                    child: ElevatedButton(
                      onPressed: onGetInTouchTap,
                      child: const Text("Get in touch"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColor.yellowPrimary,
                        foregroundColor: CustomColor.whitePrimary
                      )),
                  )
                ],
              ),
              ShaderMask(
                shaderCallback: (bounds) {
                    return LinearGradient(colors: [
                      CustomColor.scaffoldBg.withOpacity(0.4),
                      CustomColor.scaffoldBg.withOpacity(0.4)
                    ]).createShader(bounds);
                  },
                  blendMode: BlendMode.srcATop,
                child: Container(
                  height: 250,
                  width: 250 ,
                  decoration:const  BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/profilepicture.jpg'),
                      fit: BoxFit.cover,
                      )
                  ),
                ),
              ),
            ],
          ),
         );
  }
}