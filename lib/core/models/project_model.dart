import 'package:flutter/material.dart';

class ProjectModel {
  final String id;
  final String title;
  final String subtitle;
  final String category; // "Featured Showcase", "Live Production Apps", "Full-Stack", "Flutter Mobile", "Flutter Web"
  final String description;
  final List<String> techStack;
  final IconData icon;
  final Color primaryColor;
  final Color secondaryColor;
  final String? githubUrl; // Main App / Frontend GitHub Repo
  final String? backendGithubUrl; // Dedicated Backend API Repo
  final String? adminGithubUrl; // Admin Panel Repo
  final String? playStoreUrl; // Google Play Store link
  final String? appStoreUrl; // Apple App Store link
  final String? webAppUrl; // Web App link
  final String? company; // e.g. "Rank You Higher", "Better Lives (Product-Based)", "Shanmara Solutions", "Independent / Own Creation"
  final bool isLiveOnStores;
  final bool hasBackend;
  final List<String> keyFeatures;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.description,
    required this.techStack,
    required this.icon,
    required this.primaryColor,
    required this.secondaryColor,
    this.githubUrl,
    this.backendGithubUrl,
    this.adminGithubUrl,
    this.playStoreUrl,
    this.appStoreUrl,
    this.webAppUrl,
    this.company,
    this.isLiveOnStores = false,
    this.hasBackend = false,
    required this.keyFeatures,
  });
}

class ProjectsData {
  static const List<ProjectModel> projects = [
    // 1. PaidPromo (Rank You Higher - Live on Play Store & App Store)
    ProjectModel(
      id: "paidpromo",
      title: "PaidPromo",
      subtitle: "Paid Brand Promotion & Creator Engagement App",
      category: "Featured Showcase",
      company: "Rank You Higher",
      isLiveOnStores: true,
      hasBackend: true,
      description:
          "A production mobile application engineered in Flutter for client promotion campaigns, brand sponsorships, and paid engagements. Published live across Google Play Store and Apple App Store.",
      techStack: [
        "Flutter",
        "Dart",
        "Stacked MVVM",
        "REST API",
        "Dio",
        "Firebase",
      ],
      icon: Icons.monetization_on_rounded,
      primaryColor: Color(0xFF00D2FF),
      secondaryColor: Color(0xFF02569B),
      playStoreUrl: "https://play.google.com/store/search?q=paidpromo&c=apps",
      keyFeatures: [
        "Structured Stacked MVVM architecture with clear separation of services and ViewModels",
        "Robust Dio HTTP client with interceptors for token management and error handling",
        "Real-time campaign status tracking and secure payout milestone processing",
        "Firebase Cloud Messaging integration for instant push alerts and creator notifications",
        "High-performance 60 FPS mobile UI with responsive layouts across iOS and Android",
      ],
    ),

    // 2. Promote: Connect to Influencers (Rank You Higher - Mobile App + Flutter Web Admin)
    ProjectModel(
      id: "promote_app",
      title: "Promote: Influencer Platform",
      subtitle: "Mobile App & Dedicated Flutter Web Admin Panel",
      category: "Featured Showcase",
      company: "Rank You Higher",
      isLiveOnStores: true,
      hasBackend: true,
      description:
          "A comprehensive influencer connection and marketing ecosystem featuring a mobile application (published on Google Play Store & Apple App Store) and a dedicated Flutter Web Admin dashboard for campaign curation and influencer verification.",
      techStack: [
        "Flutter",
        "Flutter Web",
        "Dart",
        "Admin Panel",
        "REST API",
        "Dio",
        "Firebase",
      ],
      icon: Icons.people_alt_rounded,
      primaryColor: Color(0xFF8B5CF6),
      secondaryColor: Color(0xFFEC4899),
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.app.promote",
      keyFeatures: [
        "Live on Google Play Store (com.app.promote) and Apple App Store for brand-influencer connection",
        "Custom Flutter Web Admin Panel for influencer verification, campaign moderation, and payouts",
        "Direct influencer discovery with niche filters, engagement metrics, and chat outreach",
        "Integrated analytics dashboard for tracking reach, impressions, and campaign ROI",
        "Secure multi-role authentication and granular role-based permissions in the web admin",
      ],
    ),

    // 3. Volt Spare - Auto Spare Parts E-Commerce Platform (Independent / Own Creation - In Git / Locally Tested)
    ProjectModel(
      id: "volt_spare",
      title: "Volt Spare",
      subtitle: "Auto Spare Parts E-Commerce Mobile App + API + Admin (Personal Project)",
      category: "Featured Showcase",
      company: "Independent / Own Creation",
      hasBackend: true,
      isLiveOnStores: false,
      description:
          "A comprehensive auto spare parts e-commerce selling platform self-engineered with Flutter as an independent personal project. Currently tested locally and maintained in Git, it features dynamic parts catalogs, vehicle compatibility filtering, cart calculations, and checkout, powered by a dedicated REST API service (spare_api) and an administrative dispatch management panel (spare_admin).",
      techStack: [
        "Flutter",
        "Dart",
        "Personal Project",
        "Auto Spare Parts",
        "spare_api (REST)",
        "spare_admin",
        "Cart Engine",
        "Git (Locally Tested)",
      ],
      icon: Icons.car_repair_rounded,
      primaryColor: Color(0xFF00E5FF),
      secondaryColor: Color(0xFF02569B),
      githubUrl: "https://github.com/vscsudhar/spare_shop",
      backendGithubUrl: "https://github.com/vscsudhar/spare_api",
      adminGithubUrl: "https://github.com/vscsudhar/spare_admin",
      keyFeatures: [
        "E-Commerce auto spare parts selling platform engineered with Flutter as an independent personal ecosystem",
        "Dynamic parts catalog with search, multi-attribute category filtering, and vehicle compatibility checking",
        "Robust shopping cart state management, discount application, real-time total calculation, and order checkout",
        "Dedicated REST API service (spare_api) handling parts inventory, catalog categorization, and user authentication",
        "Comprehensive administrative dashboard (spare_admin) for inventory allocation, stock management, and order dispatch",
        "Maintained in Git and rigorously tested locally across physical Android and iOS devices",
      ],
    ),

    // 2. V2S Connect & Admin (Rank You Higher - Google Play Store Live)
    ProjectModel(
      id: "v2s_connect",
      title: "V2S Connect & Admin",
      subtitle: "Dual Play Store Service & Admin Management Apps",
      category: "Live Production Apps",
      company: "Rank You Higher",
      isLiveOnStores: true,
      hasBackend: true,
      description:
          "A dual-application production ecosystem engineered in Flutter at Rank You Higher and published on the Google Play Store, consisting of a customer client app and a dedicated admin dispatch dashboard.",
      techStack: [
        "Flutter",
        "Dart",
        "Play Store",
        "Dual Apps",
        "Admin Portal",
        "REST API",
      ],
      icon: Icons.connect_without_contact_rounded,
      primaryColor: Color(0xFF10B981),
      secondaryColor: Color(0xFF00D2FF),
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.app.v2sadmin",
      keyFeatures: [
        "V2S Connect (User App) live on Google Play Store for client interaction",
        "V2S Connect - Admin (com.app.v2sadmin) published on Play Store for management",
        "Instant notification dispatch and service request lifecycle management",
        "High-performance state handling and responsive Flutter UI architecture",
      ],
    ),

    // 3. Supply Chain Logistics Platform (Better Lives - Product-Based Flutter Web App)
    ProjectModel(
      id: "supply_chain_web",
      title: "Supply Chain Platform",
      subtitle: "Enterprise Logistics & Pipeline Web Application",
      category: "Flutter Web",
      company: "Better Lives (Product-Based)",
      hasBackend: true,
      description:
          "An enterprise-grade supply chain web application built with Flutter Web for Better Lives, facilitating end-to-end shipment monitoring, warehouse inventory allocation, and supplier dispatch tracking.",
      techStack: [
        "Flutter Web",
        "Dart",
        "Supply Chain",
        "Analytics Dashboard",
        "REST API",
      ],
      icon: Icons.local_shipping_rounded,
      primaryColor: Color(0xFF6366F1),
      secondaryColor: Color(0xFF38BDF8),
      keyFeatures: [
        "Engineered with Flutter Web for desktop workstation browsers",
        "Real-time pipeline tracking from warehouse storage to end-point delivery",
        "Interactive data tables, order filtering, and automated dispatch reports",
        "Role-based permission architecture for logistics operators and managers",
      ],
    ),

    // 4. Groceteria E-Commerce (Shanmara Solutions - Google Play Store Live)
    ProjectModel(
      id: "groceteria",
      title: "Groceteria E-Commerce",
      subtitle: "Grocery Shopping & Order Tracking Mobile App",
      category: "Live Production Apps",
      company: "Shanmara Solutions",
      isLiveOnStores: true,
      description:
          "A production grocery shopping and delivery mobile application developed at Shanmara Solutions and published on the Google Play Store (com.sm.groceteria), featuring dynamic product catalogs, cart calculations, and order tracking.",
      techStack: [
        "Flutter",
        "Dart",
        "Play Store",
        "E-Commerce",
        "Cart Engine",
        "REST API",
      ],
      icon: Icons.local_grocery_store_rounded,
      primaryColor: Color(0xFFFFB800),
      secondaryColor: Color(0xFFFF5E62),
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.sm.groceteria",
      keyFeatures: [
        "Live on Google Play Store (com.sm.groceteria) with active user base",
        "Category-wise grocery catalogs, product variations, and real-time inventory checks",
        "Smooth shopping cart state, discount vouchers, and streamlined checkout",
        "Optimized 60 FPS scrolling and low memory footprint across Android devices",
      ],
    ),

    // 5. Attendance Management App (Shanmara Solutions)
    ProjectModel(
      id: "attendance_app",
      title: "Attendance Management App",
      subtitle: "Employee Check-in, Geofencing & Shift Tracking",
      category: "Flutter Mobile",
      company: "Shanmara Solutions",
      hasBackend: true,
      description:
          "A comprehensive attendance and workforce tracking mobile application developed at Shanmara Solutions, featuring automated geofencing check-in, biometric authentication, shift management, and leave approval workflows.",
      techStack: [
        "Flutter",
        "Dart",
        "Geofencing",
        "Biometrics",
        "REST API",
        "MVVM",
      ],
      icon: Icons.badge_rounded,
      primaryColor: Color(0xFFEC4899),
      secondaryColor: Color(0xFF8B5CF6),
      keyFeatures: [
        "Automated geofencing and GPS radius validation for on-premise employee check-in",
        "Biometric authentication (Fingerprint & Face ID) integrated for secure attendance logging",
        "Real-time shift schedules, overtime tracking, and instant leave request pipelines",
        "Responsive Flutter UI with offline event caching and background synchronization",
      ],
    ),

    // 7. Vewin - Service Vehicle Tracking App (Shanmara Solutions)
    ProjectModel(
      id: "vewin_tracking",
      title: "Vewin",
      subtitle: "Service Vehicle Tracking & Fleet Telematics App",
      category: "Featured Showcase",
      company: "Shanmara Solutions",
      hasBackend: true,
      description:
          "A service vehicle tracking and fleet telemetry mobile application developed at Shanmara Solutions, featuring real-time GPS location tracking, live route mapping, technician service dispatch, geofenced zones, and vehicle trip history.",
      techStack: [
        "Flutter",
        "Dart",
        "GPS Tracking",
        "Google Maps",
        "Fleet Telematics",
        "REST API",
        "MVVM",
      ],
      icon: Icons.gps_fixed_rounded,
      primaryColor: Color(0xFF00F5A0),
      secondaryColor: Color(0xFF00D2FF),
      githubUrl: "https://github.com/vscsudhar/vewin",
      keyFeatures: [
        "Real-time GPS tracking for service vehicles with live interactive Google Maps rendering",
        "Field technician service dispatch status, route tracking, and job arrival logging",
        "Trip history playback with speed profiling, stoppage detection, and mileage analytics",
        "Geofencing perimeter alerts for automated entry and exit notifications at client sites",
        "Optimized background location sync designed for low battery impact and intermittent network coverage",
      ],
    ),

    // 8. Real-Time Chat Application (Rank You Higher Client - In Git / Active Development)
    ProjectModel(
      id: "realtime_chat",
      title: "Real-Time Chat Application",
      subtitle: "Low-Latency Direct & Group Messaging (Client Project • In Git)",
      category: "Featured Showcase",
      company: "Rank You Higher",
      hasBackend: true,
      isLiveOnStores: false,
      description:
          "A real-time communication application built with Flutter for a client at Rank You Higher, supporting conversations, messaging and real-time updates through bi-directional WebSocket streaming. Currently in active development and maintained in Git (not published yet).",
      techStack: [
        "Flutter",
        "Dart",
        "REST API",
        "WebSocket",
        "Local Caching",
        "In Git (Active Dev)",
      ],
      icon: Icons.chat_bubble_outline_rounded,
      primaryColor: Color(0xFF6366F1),
      secondaryColor: Color(0xFF8B5CF6),
      githubUrl: "https://github.com/vscsudhar",
      keyFeatures: [
        "Engineered for Rank You Higher client for real-time team and client messaging",
        "Bi-directional WebSocket streaming for instant message transmission and delivery receipts",
        "Live typing indicators, online presence status, and unread message counters",
        "Local caching of chat conversations for instant offline retrieval and fast UI loading",
        "Currently maintained in Git in active development (pre-release)",
      ],
    ),

    // 9. Video Calling Application (Rank You Higher Client - In Git / Active Development)
    ProjectModel(
      id: "video_calling",
      title: "Video Calling Application",
      subtitle: "Peer-to-Peer Real-Time Video & Audio (Client Project • In Git)",
      category: "Featured Showcase",
      company: "Rank You Higher",
      isLiveOnStores: false,
      description:
          "A Flutter-based real-time video communication application developed for a client at Rank You Higher using WebRTC technology for low-latency peer-to-peer audio and video streaming. Currently in active development and maintained in Git (not published yet).",
      techStack: [
        "Flutter",
        "Dart",
        "WebRTC",
        "Signaling API",
        "P2P Stream",
        "In Git (Active Dev)",
      ],
      icon: Icons.videocam_rounded,
      primaryColor: Color(0xFFFF5E62),
      secondaryColor: Color(0xFFFFB800),
      githubUrl: "https://github.com/vscsudhar",
      keyFeatures: [
        "Engineered for Rank You Higher client for low-latency P2P video conferencing",
        "WebRTC peer-to-peer audio and video streaming with adaptive bitrate handling",
        "Call signaling, room creation, and connection lifecycle management",
        "Camera switching, microphone muting, and floating Picture-in-Picture (PiP) window UI",
        "Currently maintained in Git in active development (pre-release)",
      ],
    ),

    // 9. BIM / VR Application (Own Created / Independent)
    ProjectModel(
      id: "bim_vr",
      title: "BIM / VR Application",
      subtitle: "Interactive 3D Architectural Visualizer",
      category: "Featured Showcase",
      company: "Independent / Own Creation",
      description:
          "A Flutter application integrated with an interactive 3D/VR workflow for project visualization, architectural model inspection, and spatial navigation.",
      techStack: [
        "Flutter",
        "3D / VR Integration",
        "Spatial Viewport",
        "C++ Bridge",
      ],
      icon: Icons.view_in_ar_rounded,
      primaryColor: Color(0xFF38BDF8),
      secondaryColor: Color(0xFF8B5CF6),
      githubUrl: "https://github.com/vscsudhar/vr-construction",
      keyFeatures: [
        "Interactive 3D model inspector with orbit gestures, zoom, and layer exploration",
        "Seamless integration between Flutter native UI controls and 3D rendering views",
        "Building Information Modeling (BIM) property inspection and metadata overlays",
        "Optimized 60 FPS mobile rendering pipeline for complex architectural geometry",
      ],
    ),

    // 10. Photo Studio Suite (Own Created / Independent Full-Stack)
    ProjectModel(
      id: "photo_app",
      title: "Photo Studio Suite",
      subtitle: "Studio Booking App + Dedicated Node.js API",
      category: "Full-Stack",
      company: "Independent / Own Creation",
      hasBackend: true,
      description:
          "A full-stack photo studio management system with a Flutter mobile frontend for booking shoots and viewing albums, backed by a Node.js REST API backend.",
      techStack: [
        "Flutter",
        "Dart",
        "Node.js",
        "Express.js",
        "REST API",
        "Cloud Media",
      ],
      icon: Icons.camera_alt_rounded,
      primaryColor: Color(0xFFFF7A00),
      secondaryColor: Color(0xFFFF007A),
      githubUrl: "https://github.com/vscsudhar/photo_app",
      backendGithubUrl: "https://github.com/vscsudhar/photo_app_api",
      keyFeatures: [
        "Mobile Frontend (Flutter): Photo shoot booking, package selection & gallery viewer",
        "Backend API (Node.js): Secure API for appointment slots, clients & media indexing",
        "Fluid image transitions and optimized responsive mobile layouts",
        "Clean architecture separating presentation from data services",
      ],
    ),

    // 11. SaaS Multi-Tenant Platform (Own Created / Independent Enterprise)
    ProjectModel(
      id: "saas_platform",
      title: "SaaS Multi-Tenant Suite",
      subtitle: "Client Portal, Admin Panel & API Backend",
      category: "Full-Stack",
      company: "Independent / Own Creation",
      hasBackend: true,
      description:
          "An enterprise multi-tenant SaaS architecture featuring a dedicated user client app, an administrative portal for organization management, and a Node.js REST API with role-based access control.",
      techStack: [
        "Flutter",
        "Dart",
        "JavaScript",
        "Node.js",
        "RBAC",
        "SaaS Architecture",
      ],
      icon: Icons.domain_rounded,
      primaryColor: Color(0xFF00D2FF),
      secondaryColor: Color(0xFF6366F1),
      githubUrl: "https://github.com/vscsudhar/saas_user",
      backendGithubUrl: "https://github.com/vscsudhar/saas_api",
      adminGithubUrl: "https://github.com/vscsudhar/saas_admin",
      keyFeatures: [
        "User Portal (Flutter): Multi-tenant workspace navigation & dashboard views",
        "Admin Portal (Flutter): Tenant provisioning, subscription control & permission matrices",
        "Backend Service (Node.js): Secure REST API with tenant isolation & token auth",
        "Engineered for modularity and high concurrent user scalability",
      ],
    ),

    // 12. Mini Projects & Utilities (Own Created / Independent)
    ProjectModel(
      id: "mini_projects",
      title: "Mini Projects & Utilities",
      subtitle: "Utility Tools, Custom Widgets & UI Experiments",
      category: "Flutter Mobile",
      company: "Independent / Own Creation",
      description:
          "A collection of specialized Flutter mini applications, utility toolkits, and interactive custom UI components demonstrating micro-interactions and clean state handling.",
      techStack: [
        "Flutter",
        "Dart",
        "Custom UI",
        "Micro-Interactions",
        "Open Source",
      ],
      icon: Icons.widgets_rounded,
      primaryColor: Color(0xFF10B981),
      secondaryColor: Color(0xFF6366F1),
      githubUrl: "https://github.com/vscsudhar/mini-project",
      keyFeatures: [
        "Collection of tailored custom widgets and reusable animation controllers",
        "Clean architecture examples and state management patterns",
        "Lightweight utility tools optimized for rapid execution",
        "Open-source repository for community reference and learning",
      ],
    ),
  ];
}
