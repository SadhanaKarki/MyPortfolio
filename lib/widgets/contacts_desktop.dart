import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsDesktop extends StatefulWidget {
  const ContactsDesktop({super.key});

  @override
  State<ContactsDesktop> createState() => _ContactsDesktopState();
}

class _ContactsDesktopState extends State<ContactsDesktop> {
  final String phoneNumber = "9861748228";
  final String whatsappNumber = "9861748228";
  final String emailAddress = "sadhanakarki141@gmail.com";

  Future<void> _launchPhone() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch phone')),
      );
    }
  }

  Future<void> _launchWhatsApp() async {
    final Uri whatsappUri = Uri.parse(
      'https://wa.me/$whatsappNumber',
    );
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch WhatsApp')),
      );
    }
  }

 Future<void> _launchEmail() async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: emailAddress,
  );

  await launchUrl(emailUri);
}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 40, 25, 60),
      color: CustomColor.scaffoldBg,
      width: double.maxFinite,
      child: Column(
        children: [
          const Text(
            "Get in Touch",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
            const SizedBox(height: 8),
          // Accent underline
          Container(
            width: 70,
            height: 4,
            decoration: BoxDecoration(
              color: CustomColor.yellowPrimary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 30),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1000),
            child: Wrap(
              spacing: 40,
              runSpacing: 30,
              alignment: WrapAlignment.center,
              children: [
                _ContactCardDesktop(
                  icon: FontAwesomeIcons.phone,
                  iconColor: Colors.green,
                  title: "Contact Number",
                  subtitle: phoneNumber,
                  onTap: _launchPhone,
                ),
                _ContactCardDesktop(
                  icon: FontAwesomeIcons.whatsapp,
                  iconColor: Colors.green,
                  title: "WhatsApp",
                  subtitle: whatsappNumber,
                  onTap: _launchWhatsApp,
                ),
                _ContactCardDesktop(
                  icon: FontAwesomeIcons.envelope,
                  iconColor: Colors.blueGrey,
                  title: "Email Address",
                  subtitle: emailAddress,
                  onTap: _launchEmail,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ContactCardDesktop extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ContactCardDesktop({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  State<_ContactCardDesktop> createState() => _ContactCardDesktopState();
}

class _ContactCardDesktopState extends State<_ContactCardDesktop> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 280,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: isHovered ? CustomColor.yellowPrimary : CustomColor.bgLight2,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isHovered ? CustomColor.yellowSecondary : Colors.transparent,
              width: 2,
            ),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: CustomColor.yellowPrimary.withOpacity(0.5),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : [],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                widget.icon,
                size: 40,
                color: isHovered ? Colors.black : widget.iconColor,
              ),
              const SizedBox(height: 15),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isHovered ? Colors.black : CustomColor.whitePrimary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                widget.subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: isHovered ? Colors.black87 : Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
