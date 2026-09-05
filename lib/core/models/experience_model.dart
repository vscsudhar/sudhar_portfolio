import 'package:flutter/material.dart';

class JourneyPillar {
  final String title;
  final String tag;
  final String summary;
  final List<String> bulletPoints;
  final List<String> techTags;
  final IconData icon;
  final Color accentColor;

  const JourneyPillar({
    required this.title,
    required this.tag,
    required this.summary,
    required this.bulletPoints,
    required this.techTags,
    required this.icon,
    required this.accentColor,
  });
}

class JourneyData {
  static const List<JourneyPillar> pillars = [
    JourneyPillar(
      title: "Mobile Development",
      tag: "CORE SPECIALIZATION • FLUTTER & DART",
      summary:
          "Flutter and Dart application development delivering polished, high-performance cross-platform mobile experiences for iOS and Android with 60 FPS motion graphics.",
      bulletPoints: [
        "Pixel-perfect responsive UI engineering tailored across all device form factors.",
        "Production deployment and lifecycle maintenance on Google Play Store and Apple App Store.",
        "Custom widget hierarchies, micro-interactions, and fluid screen transitions.",
        "Stateful performance optimization ensuring low memory usage and instant startup.",
      ],
      techTags: [
        "Flutter",
        "Dart",
        "Android",
        "iOS",
        "Custom UI",
        "60 FPS Animation",
      ],
      icon: Icons.flutter_dash,
      accentColor: Color(0xFF00D2FF),
    ),
    JourneyPillar(
      title: "Architecture & Clean Code",
      tag: "STAGE 02 • SCALABLE APPLICATION STRUCTURE",
      summary:
          "MVVM, reusable components and scalable application structure designed for maintainability, testability, and team collaboration.",
      bulletPoints: [
        "Stacked MVVM architecture providing clear boundary separation between views, ViewModels, and services.",
        "SOLID principles, dependency injection, and reusable widget design systems.",
        "Modular codebase organization enabling rapid feature expansion and isolation.",
        "Deterministic state flow preventing race conditions and UI regressions.",
      ],
      techTags: [
        "Stacked MVVM",
        "Clean Architecture",
        "Dependency Injection",
        "Design Systems",
        "Modular Code",
      ],
      icon: Icons.layers_rounded,
      accentColor: Color(0xFF6366F1),
    ),
    JourneyPillar(
      title: "Backend Integration",
      tag: "STAGE 03 • APIS, AUTH & DATA HANDLING",
      summary:
          "REST APIs, authentication, data handling and third-party service integration connecting frontend clients with reliable server infrastructure.",
      bulletPoints: [
        "Robust Dio HTTP networking with interceptors for token refresh and error handling.",
        "Firebase suite integration including Authentication, Cloud Messaging (FCM), and Firestore.",
        "Structured JSON serialization, schema validation, and secure local caching.",
        "Third-party SDK integrations, payment gateways, and cloud storage pipelines.",
      ],
      techTags: [
        "REST APIs",
        "Dio Client",
        "Firebase Auth/FCM",
        "Token Interceptors",
        "Secure Storage",
      ],
      icon: Icons.dns_rounded,
      accentColor: Color(0xFF00F5A0),
    ),
    JourneyPillar(
      title: "Real-Time Communication",
      tag: "STAGE 04 • WEBSOCKET & WEBRTC",
      summary:
          "WebSocket and WebRTC-based application features enabling low-latency interactive messaging and live peer-to-peer media streams.",
      bulletPoints: [
        "Bi-directional WebSocket streaming for instant chat delivery, presence indicators, and live typing.",
        "WebRTC peer-to-peer video/audio calling with adaptive bitrate management.",
        "Real-time event synchronization and reconnection strategies for unstable networks.",
        "Hardware-accelerated live video rendering with Picture-in-Picture UI support.",
      ],
      techTags: [
        "WebSocket",
        "WebRTC",
        "Live Streaming",
        "Presence Tracking",
        "P2P Media",
      ],
      icon: Icons.sensors_rounded,
      accentColor: Color(0xFFEC4899),
    ),
    JourneyPillar(
      title: "Full-Stack Development",
      tag: "STAGE 05 • END-TO-END APPLICATION SOLUTIONS",
      summary:
          "Ability to work across frontend, backend and application integration when required to deliver complete end-to-end software solutions.",
      bulletPoints: [
        "Node.js and Express REST API development with database persistence (MongoDB / MySQL).",
        "Flutter Web dashboard engineering for administrative control and analytics monitoring.",
        "Multi-tenant SaaS application structure with role-based access control.",
        "Full lifecycle capability: from UI mockup to backend services, API contracts, and deployment.",
      ],
      techTags: [
        "Node.js",
        "Express",
        "MongoDB",
        "MySQL",
        "Flutter Web",
        "Full-Stack",
      ],
      icon: Icons.hub_rounded,
      accentColor: Color(0xFFFFB800),
    ),
  ];
}
