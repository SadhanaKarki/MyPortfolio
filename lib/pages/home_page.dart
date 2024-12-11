import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/widgets/contacts_mobile.dart';
import 'package:my_portfolio/widgets/drawer_mobile.dart';
import 'package:my_portfolio/widgets/header_desktop.dart';
import 'package:my_portfolio/widgets/header_mobile.dart';
import 'package:my_portfolio/widgets/header_tablet.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/main_mobile.dart';
import 'package:my_portfolio/widgets/main_tablet.dart';
import 'package:my_portfolio/widgets/skills_desktop.dart';
import 'package:my_portfolio/widgets/skills_mobile.dart';
import 'package:my_portfolio/widgets/skills_tablet.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController= ScrollController();
  //specify the key we want to assign to the widgets, navbarkeys variable holds four global keys
  final List<GlobalKey> navbarKeys=List.generate(4,(index)=>GlobalKey());

bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1024;
bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 1024;
bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;

  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: CustomColor.scaffoldBg,
      endDrawer: isMobile(context) ?  DrawerMobile(onNavItemTap: (int navIndex) { 
        //call function
        scaffoldKey.currentState?.closeEndDrawer();
        scrollToSection(navIndex);
       },) : null,
      body: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(key: navbarKeys.first,), //if we tap on home button we want to jump to sizedbox which is top of page

            //MAIN 
            if (isDesktop(context))
               HeaderDesktop(onNavMenuTap: (int  navIndex) { 
                //call func
                scrollToSection(navIndex);
                },) 
            else if(isTablet(context))
               HeaderTablet(onNavMenuTap: (int  navIndex) { 
                //call func
                scrollToSection(navIndex);
                },)
            else
            HeaderMobile(
            onMenuTap: () {
              scaffoldKey.currentState?.openEndDrawer();
            },
            onLogoTap: () {},
           ),
           
            if (isDesktop(context))
              const MainDesktop()
            else if(isTablet(context))
              const MainTablet()
            else
             const MainMobile(),
        
            //SKILLS
            
            if (isDesktop(context))
             SkillsDesktop(key: navbarKeys[1],) //assign keys to widgets
            else if(isTablet(context))
             SkillsTablet(key: navbarKeys[1],)
            else
             SkillsMobile(key: navbarKeys[1],),
            
            
            //CONTACTS
            
            ContactsMobile(key: navbarKeys[3],),
        
            //FOOTER
           
          ],
        ),
      )
    );
  }
  void scrollToSection(int navIndex){
    final key= navbarKeys[navIndex];
    Scrollable.ensureVisible(key.currentContext!, duration: const Duration( milliseconds: 500),curve: Curves.easeInOut);
  }
}