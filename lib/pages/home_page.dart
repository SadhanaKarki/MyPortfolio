import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/widgets/about_desktop.dart';
import 'package:my_portfolio/widgets/about_mobile.dart';
import 'package:my_portfolio/widgets/about_tablet.dart';
import 'package:my_portfolio/widgets/contacts_desktop.dart';
import 'package:my_portfolio/widgets/contacts_mobile.dart';
import 'package:my_portfolio/widgets/contacts_tablet.dart';
import 'package:my_portfolio/widgets/drawer_mobile.dart';
import 'package:my_portfolio/widgets/header_desktop.dart';
import 'package:my_portfolio/widgets/header_mobile.dart';
import 'package:my_portfolio/widgets/header_tablet.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/main_mobile.dart';
import 'package:my_portfolio/widgets/main_tablet.dart';
import 'package:my_portfolio/widgets/projects_desktop.dart';
import 'package:my_portfolio/widgets/projects_mobile.dart';
import 'package:my_portfolio/widgets/projects_tablet.dart';
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
  //specify the key we want to assign to the widgets, navbarkeys variable holds five global keys
  final List<GlobalKey> navbarKeys=List.generate(5,(index)=>GlobalKey());

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
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(key: navbarKeys.first,), //if we tap on home button we want to jump to sizedbox which is top of page
                
                // Add top padding to account for fixed header
                SizedBox(height: isDesktop(context) ? 80 : isTablet(context) ? 70 : 60),
           
                if (isDesktop(context))
                  MainDesktop(onGetInTouchTap: () => scrollToSection(4))
                else if(isTablet(context))
                  MainTablet(onGetInTouchTap: () => scrollToSection(4))
                else
                  MainMobile(onGetInTouchTap: () => scrollToSection(4)),
              
                //SKILLS
                
                if (isDesktop(context))
                  SkillsDesktop(key: navbarKeys[1],) //assign keys to widgets
                else if(isTablet(context))
                  SkillsTablet(key: navbarKeys[1],)
                else
                  SkillsMobile(key: navbarKeys[1],),

                //PROJECTS
                
                if (isDesktop(context))
                  ProjectsDesktop(key: navbarKeys[2],)
                else if(isTablet(context))
                  ProjectsTablet(key: navbarKeys[2],)
                else
                  ProjectsMobile(key: navbarKeys[2],),

                //ABOUT
                
                if (isDesktop(context))
                  AboutDesktop(key: navbarKeys[3],)
                else if(isTablet(context))
                  AboutTablet(key: navbarKeys[3],)
                else
                  AboutMobile(key: navbarKeys[3],),
                
                //CONTACTS
                
                if (isDesktop(context))
                  ContactsDesktop(key: navbarKeys[4],)
                else if(isTablet(context))
                  ContactsTablet(key: navbarKeys[4],)
                else
                  ContactsMobile(key: navbarKeys[4],),
              
                //FOOTER
              ],
            ),
          ),

          // Fixed header at top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: CustomColor.scaffoldBg,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isDesktop(context))
                    HeaderDesktop(onNavMenuTap: (int navIndex) {
                      scrollToSection(navIndex);
                    })
                  else if (isTablet(context))
                    HeaderTablet(onNavMenuTap: (int navIndex) {
                      scrollToSection(navIndex);
                    })
                  else
                    HeaderMobile(
                      onMenuTap: () {
                        scaffoldKey.currentState?.openEndDrawer();
                      },
                      onLogoTap: () {},
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void scrollToSection(int navIndex){
    final key= navbarKeys[navIndex];
    Scrollable.ensureVisible(key.currentContext!, duration: const Duration( milliseconds: 500),curve: Curves.easeInOut);
  }
}