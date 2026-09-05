import 'package:flutter/material.dart';
import '../constants/app_strings.dart';

class SocialLinkModel {
  final String title;
  final String url;
  final IconData icon;
  final Color color;

  const SocialLinkModel({
    required this.title,
    required this.url,
    required this.icon,
    required this.color,
  });
}

class SocialLinksData {
  static const List<SocialLinkModel> links = [
    SocialLinkModel(
      title: "GitHub",
      url: AppStrings.githubUrl,
      icon: Icons.code_rounded,
      color: Color(0xFFF8FAFC),
    ),
    SocialLinkModel(
      title: "LinkedIn",
      url: AppStrings.linkedinUrl,
      icon: Icons.link_rounded,
      color: Color(0xFF00D2FF),
    ),
    SocialLinkModel(
      title: "Email",
      url: "mailto:${AppStrings.email}",
      icon: Icons.mail_rounded,
      color: Color(0xFF10B981),
    ),
    SocialLinkModel(
      title: "X (Twitter)",
      url: AppStrings.twitterUrl,
      icon: Icons.alternate_email_rounded,
      color: Color(0xFF38BDF8),
    ),
  ];
}
