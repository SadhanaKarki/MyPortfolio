import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class MainDesktop extends StatelessWidget {
  final VoidCallback? onGetInTouchTap;
  
  const MainDesktop({super.key, this.onGetInTouchTap});

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
                    fontSize: 30,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.whitePrimary
                    ),),
                  const SizedBox(height: 15,),
                  SizedBox(
                    width: 215,
                    child: ElevatedButton(
                      onPressed: onGetInTouchTap,
                      
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColor.yellowPrimary,
                        foregroundColor: CustomColor.whitePrimary
                      ),
                      child: const Text("Get in touch"),),
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
                  height: 350,
                  width: 350 ,
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