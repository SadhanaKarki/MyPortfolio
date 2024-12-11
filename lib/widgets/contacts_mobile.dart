import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/constants/colors.dart';

class ContactsMobile extends StatefulWidget {
  const ContactsMobile({super.key});

  @override
  State<ContactsMobile> createState() => _ContactsMobileState();
}

class _ContactsMobileState extends State<ContactsMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
            color: CustomColor.bgLight1,
            width: double.maxFinite,
            child: Column(
              children: [
                Text("Get in Touch",style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary),),
                  SizedBox(height: 20,),
                Wrap(
                   spacing: 20, // Space between containers horizontally
            runSpacing: 30, // Space between containers vertically when wrapping
            alignment: WrapAlignment.center,
                  children: [
                    
                     Container(
                      width: 210,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: CustomColor.whitePrimary
                      ),
                      child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.phone,color: Colors.green,size: 25,),
                        title: Text("Contact Number",style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400)),
                        subtitle: Text("9861748228",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.grey,),)
                      ),
                     ),
                                     Container(
                      width: 210,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: CustomColor.whitePrimary
                      ),
                      child: const ListTile(
                        leading: FaIcon(FontAwesomeIcons.whatsapp,color: Colors.green,size: 30,),
                        title: Text("WhatsApp",style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400)),
                        subtitle: Text("9861748228",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.grey,),)
                      ),
                     ),
                               Container(
                      width: 287,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: CustomColor.whitePrimary
                      ),
                      child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.envelope,size: 25,color: Colors.blueGrey,),
                        title: Text("Email Address",style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400)),
                        subtitle: Text("sadhanakarki141@gmail.com",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.grey,),)
                      ),
                     ),
                 
                  ],
                )
              ],
            ),
            
          );
  }
}