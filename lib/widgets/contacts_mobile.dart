import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsMobile extends StatefulWidget {
  const ContactsMobile({super.key});

  @override
  State<ContactsMobile> createState() => _ContactsMobileState();
}

class _ContactsMobileState extends State<ContactsMobile> {
  final String phoneNumber = "9861748228";
  final String whatsappNumber = "9861748228";
  final String emailAddress = "sadhanakarki141@gmail.com";

  Future<void> _launchPhone() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not launch phone')),
        );
      }
    }
  }

  Future<void> _launchWhatsApp() async {
    final Uri whatsappUri = Uri.parse(
      'https://wa.me/$whatsappNumber',
    );
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not launch WhatsApp')),
        );
      }
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
      padding: const EdgeInsets.fromLTRB(25, 30, 25, 60),
      color: CustomColor.scaffoldBg,
      width: double.maxFinite,
      child: Column(
        children: [
          // Section title
          const Text(
            "Get in Touch",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 8),
          // Accent underline
          Container(
            width: 50,
            height: 3,
            decoration: BoxDecoration(
              color: CustomColor.yellowPrimary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 28),
          // Cards — vertical stack so each card stretches full width
          _ContactCard(
            icon: FontAwesomeIcons.phone,
            iconColor: Colors.green,
            title: "Contact Number",
            subtitle: phoneNumber,
            onTap: _launchPhone,
          ),
          const SizedBox(height: 16),
          _ContactCard(
            icon: FontAwesomeIcons.whatsapp,
            iconColor: const Color(0xFF25D366),
            title: "WhatsApp",
            subtitle: whatsappNumber,
            onTap: _launchWhatsApp,
          ),
          const SizedBox(height: 16),
          _ContactCard(
            icon: FontAwesomeIcons.envelope,
            iconColor: Colors.blueGrey,
            title: "Email Address",
            subtitle: emailAddress,
            onTap: _launchEmail,
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ContactCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) {
        setState(() => isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: isPressed ? CustomColor.yellowPrimary : CustomColor.bgLight2,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isPressed ? CustomColor.yellowSecondary : Colors.transparent,
            width: 2,
          ),
          boxShadow: isPressed
              ? [
                  BoxShadow(
                    color: CustomColor.yellowPrimary.withOpacity(0.45),
                    blurRadius: 14,
                    offset: const Offset(0, 6),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
        ),
        child: Row(
          children: [
            // Icon circle badge
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isPressed
                    ? Colors.black.withOpacity(0.12)
                    : CustomColor.bgLight1,
              ),
              child: Center(
                child: FaIcon(
                  widget.icon,
                  size: 24,
                  color: isPressed ? Colors.black : widget.iconColor,
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color:
                          isPressed ? Colors.black : CustomColor.whitePrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: isPressed ? Colors.black87 : Colors.grey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // Arrow indicator
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color:
                    isPressed ? Colors.black54 : Colors.grey.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
