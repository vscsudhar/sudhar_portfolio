import 'package:flutter/material.dart';

enum SkillTier { primary, secondary, additional }

class SkillItem {
  final String name;
  final IconData icon;
  final Color accentColor;
  final String category;
  final SkillTier tier;
  final bool isFeatured;

  const SkillItem({
    required this.name,
    required this.icon,
    required this.accentColor,
    required this.category,
    this.tier = SkillTier.primary,
    this.isFeatured = false,
  });
}

class AboutCardItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color accentColor;
  final bool isDominant;

  const AboutCardItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accentColor,
    this.isDominant = false,
  });
}

class SkillsData {
  static const List<AboutCardItem> aboutCards = [
    AboutCardItem(
      title: "Flutter",
      subtitle: "Primary Core Specialization • Pixel-Perfect 60 FPS Mobile & Web UI",
      icon: Icons.flutter_dash,
      accentColor: Color(0xFF00D2FF),
      isDominant: true,
    ),
    AboutCardItem(
      title: "Dart",
      subtitle: "Modern, Type-Safe Asynchronous Object-Oriented Language",
      icon: Icons.code_rounded,
      accentColor: Color(0xFF00F5A0),
    ),
    AboutCardItem(
      title: "Mobile Development",
      subtitle: "Production-Grade Cross-Platform Android & iOS Engineering",
      icon: Icons.phone_android_rounded,
      accentColor: Color(0xFF38BDF8),
    ),
    AboutCardItem(
      title: "API Integration",
      subtitle: "Robust Dio Client, RESTful Endpoints & Token Management",
      icon: Icons.dns_rounded,
      accentColor: Color(0xFFFFB800),
    ),
    AboutCardItem(
      title: "Full-Stack Development",
      subtitle: "Frontend Client, Admin Portals & Node.js Backend Services",
      icon: Icons.hub_rounded,
      accentColor: Color(0xFF6366F1),
    ),
    AboutCardItem(
      title: "Real-Time Applications",
      subtitle: "Low-Latency WebSocket Streaming & WebRTC Live Media",
      icon: Icons.sensors_rounded,
      accentColor: Color(0xFFFF5E62),
    ),
  ];

  static const List<SkillItem> primarySkills = [
    SkillItem(
      name: "Flutter",
      icon: Icons.flutter_dash,
      accentColor: Color(0xFF00D2FF),
      category: "Core Framework",
      tier: SkillTier.primary,
      isFeatured: true,
    ),
    SkillItem(
      name: "Dart",
      icon: Icons.code,
      accentColor: Color(0xFF00F5A0),
      category: "Core Language",
      tier: SkillTier.primary,
      isFeatured: true,
    ),
    SkillItem(
      name: "Mobile Development",
      icon: Icons.phone_iphone_rounded,
      accentColor: Color(0xFF38BDF8),
      category: "Android & iOS",
      tier: SkillTier.primary,
    ),
    SkillItem(
      name: "Stacked MVVM",
      icon: Icons.layers,
      accentColor: Color(0xFF6366F1),
      category: "Architecture",
      tier: SkillTier.primary,
    ),
    SkillItem(
      name: "REST API Integration",
      icon: Icons.dns_outlined,
      accentColor: Color(0xFF00D2FF),
      category: "Networking",
      tier: SkillTier.primary,
    ),
    SkillItem(
      name: "Dio",
      icon: Icons.sync_alt_rounded,
      accentColor: Color(0xFFFFB800),
      category: "HTTP Client",
      tier: SkillTier.primary,
    ),
    SkillItem(
      name: "Firebase",
      icon: Icons.local_fire_department_rounded,
      accentColor: Color(0xFFFF5E62),
      category: "Cloud Services",
      tier: SkillTier.primary,
    ),
    SkillItem(
      name: "WebSocket",
      icon: Icons.sensors_rounded,
      accentColor: Color(0xFF8B5CF6),
      category: "Real-Time Sync",
      tier: SkillTier.primary,
    ),
    SkillItem(
      name: "WebRTC",
      icon: Icons.videocam_rounded,
      accentColor: Color(0xFFEC4899),
      category: "Live Media",
      tier: SkillTier.primary,
    ),
    SkillItem(
      name: "Git / GitHub",
      icon: Icons.terminal_rounded,
      accentColor: Color(0xFFF8FAFC),
      category: "Version Control",
      tier: SkillTier.primary,
    ),
  ];

  static const List<SkillItem> secondarySkills = [
    SkillItem(
      name: "Architecture & Clean Code",
      icon: Icons.account_tree_rounded,
      accentColor: Color(0xFF6366F1),
      category: "Design Patterns",
      tier: SkillTier.secondary,
    ),
    SkillItem(
      name: "APIs & Interceptors",
      icon: Icons.api_rounded,
      accentColor: Color(0xFF38BDF8),
      category: "Integration",
      tier: SkillTier.secondary,
    ),
    SkillItem(
      name: "Firebase Suite",
      icon: Icons.cloud_done_rounded,
      accentColor: Color(0xFFFF5E62),
      category: "Auth & FCM",
      tier: SkillTier.secondary,
    ),
    SkillItem(
      name: "WebSocket Real-Time",
      icon: Icons.network_check_rounded,
      accentColor: Color(0xFF8B5CF6),
      category: "Live Messaging",
      tier: SkillTier.secondary,
    ),
    SkillItem(
      name: "WebRTC P2P",
      icon: Icons.video_call_rounded,
      accentColor: Color(0xFF00F5A0),
      category: "Video Calling",
      tier: SkillTier.secondary,
    ),
  ];

  static const List<SkillItem> additionalSkills = [
    SkillItem(
      name: "Node.js",
      icon: Icons.code_rounded,
      accentColor: Color(0xFF22C55E),
      category: "Backend Engine",
      tier: SkillTier.additional,
    ),
    SkillItem(
      name: "MongoDB",
      icon: Icons.storage_rounded,
      accentColor: Color(0xFF10B981),
      category: "NoSQL Database",
      tier: SkillTier.additional,
    ),
    SkillItem(
      name: "MySQL",
      icon: Icons.table_chart_rounded,
      accentColor: Color(0xFF0284C7),
      category: "Relational DB",
      tier: SkillTier.additional,
    ),
    SkillItem(
      name: "Web Development",
      icon: Icons.language_rounded,
      accentColor: Color(0xFF6366F1),
      category: "Full-Stack Web",
      tier: SkillTier.additional,
    ),
    SkillItem(
      name: "Unity / 3D Integration",
      icon: Icons.view_in_ar_rounded,
      accentColor: Color(0xFF94A3B8),
      category: "Interactive 3D",
      tier: SkillTier.additional,
    ),
  ];
}
