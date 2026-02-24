import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/projects.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsMobile extends StatelessWidget {
  const ProjectsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 40),
      color: CustomColor.scaffoldBg,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Title
          const Text(
            "My Projects",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          //const SizedBox(height: 5),

          //Projects List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projectsItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: _ProjectCardMobile(
                  project: projectsItems[index],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCardMobile extends StatefulWidget {
  final Map<String, String> project;

  const _ProjectCardMobile({
    required this.project,
  });

  @override
  State<_ProjectCardMobile> createState() => _ProjectCardMobileState();
}

class _ProjectCardMobileState extends State<_ProjectCardMobile> {
  bool isPressed = false;

  Future<void> _launchURL() async {
    final String url = widget.project['url'] ?? '';
    if (url.isNotEmpty) {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) {
        setState(() => isPressed = false);
        _launchURL();
      },
      onTapCancel: () => setState(() => isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isPressed
              ? CustomColor.bgLight2.withOpacity(0.8)
              : CustomColor.bgLight2,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isPressed ? CustomColor.yellowPrimary : CustomColor.bgLight2,
            width: isPressed ? 2 : 1,
          ),
          boxShadow: isPressed
              ? [
                  BoxShadow(
                    color: CustomColor.yellowPrimary.withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ]
              : [],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    widget.project['image'] ?? '',
                    width: 50,
                    height: 50,
                    errorBuilder: (_, __, ___) => Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: CustomColor.bgLight1,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.image_not_supported),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.project['title'] ?? 'Project',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: CustomColor.whitePrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.project['technologies'] ?? '',
                          style: const TextStyle(
                            fontSize: 11,
                            color: CustomColor.yellowSecondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                widget.project['description'] ?? '',
                style: const TextStyle(
                  fontSize: 13,
                  color: CustomColor.WhiteSecondary,
                  height: 1.5,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: CustomColor.yellowPrimary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'View Project',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
