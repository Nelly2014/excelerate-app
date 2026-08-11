# Excelerate Mobile Learning Companion

A cross-platform Flutter application that gives learners a focused mobile entry point into Excelerate's experiential-learning ecosystem. This is **Week 2** of the Mobile App Development Virtual Internship (SLU 0308 MAD Team 1).

## 📱 Overview

Excelerate is a mobile learning companion designed to help learners:
- Discover relevant programs and learning opportunities
- Track their progress across multiple programs
- Access detailed program information and learning journeys
- Manage their learning experience from a single mobile app

## 🎯 Week 2 Deliverables

### ✅ Completed Work

- **Four Functional Screens** with interactive navigation:
  - ✅ **Login Screen** — Authentication entry point with email/password form
  - ✅ **Home Dashboard** — Personalized learning snapshot and active programs
  - ✅ **Programs Discovery** — Searchable/filterable program catalog
  - ✅ **Program Details** — Learning outcomes, journey steps, and enrollment

- **Interactive Navigation**:
  - Bottom navigation bar connecting all screens
  - Route-based navigation using Flutter Navigator
  - Back navigation and state management

- **Excelerate Branding**:
  - Consistent color scheme (Primary Blue #2563EB)
  - Typography hierarchy matching wireframes
  - Responsive design for mobile devices
  - Professional UI components and spacing

- **Flutter Foundation**:
  - Clean code structure with separated concerns
  - Reusable widgets and theme system
  - Stateful management for search, filters, and navigation
  - Dummy data model for program information

- **GitHub Readiness**:
  - Meaningful commit messages documenting progress
  - Well-organized file structure
  - This README with setup and run instructions
  - Screenshots of the app in action

## 📁 Project Structure

```
Mobile/
├── lib/
│   ├── main.dart                    # Entry point, routing, dummy data
│   ├── theme/
│   │   └── app_theme.dart          # Excelerate branding & theme configuration
│   └── screens/
│       ├── login_screen.dart       # Authentication screen
│       ├── home_screen.dart        # Home dashboard with snapshot & recommendations
│       ├── programs_screen.dart    # Program discovery with search/filter
│       └── program_details_screen.dart  # Program information & journey
├── test/
│   └── widget_test.dart            # Widget tests (placeholder)
├── pubspec.yaml                     # Flutter dependencies
├── analysis_options.yaml            # Linting rules
├── .gitignore                       # Git ignore rules
└── README.md                        # This file
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.0.0+
- Dart 3.0.0+
- Android Studio, Xcode, or VS Code with Flutter extension
- Git

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Nelly2014/excelerate-app.git
   cd excelerate-app/Mobile
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app** on an emulator or physical device:
   ```bash
   flutter run
   ```

### Emulator Setup

**Android Emulator**:
```bash
flutter emulators --launch <emulator_id>
flutter run
```

**iOS Simulator** (macOS only):
```bash
open -a Simulator
flutter run -d iphone
```

## 🎨 Design & Navigation Flow

### Wireframe Implementation

All four screens follow the **Week 1 low-fidelity wireframes**:

1. **Login** → Email & password authentication
2. **Home** → Learning snapshot, active programs, recommendations
3. **Programs** → Search, category filters, program listing
4. **Program Details** → Description, learning outcomes, journey, enroll button

### Navigation Map

```
Login Screen
    ↓ (Sign In)
Home Screen (Bottom Nav: Home [active], Programs, Progress, Profile)
    ├→ Programs Screen (Bottom Nav: Home, Programs [active], Progress, Profile)
    │   ├→ Program Details Screen
    │   └→ Back to Programs
    └→ Program Details Screen (from Home recommendations)
        └→ Back to Home
```

## 🎯 Features Implemented

### Authentication
- Email and password form validation
- Sign-in with loading state
- Demo credentials: any email/password accepted

### Home Dashboard
- Learning snapshot card (active programs count, overall progress)
- Continue Learning section (in-progress programs with progress bars)
- Recommended Programs section (available programs quick-access)
- Bottom navigation bar (4 main sections)

### Program Discovery
- Search functionality (filters by title and description)
- Category filter chips (All, Technology, Business, Design)
- Program status badges (In Progress, Available)
- Tap to view details

### Program Details
- Program information card (title, duration, category)
- Learning outcomes list (4 outcomes with bullet points)
- Program journey timeline (4 stages with completion indicators)
- Enroll/Continue button with loading state

## 🛠️ Technology Stack

- **Frontend**: Flutter (Dart)
- **Navigation**: Flutter Navigator with named routes
- **State Management**: StatefulWidget (Week 2 foundation)
- **Theme**: Material Design 3
- **Version Control**: Git & GitHub

## 📊 Dummy Data

The app includes a sample dataset of 5 programs:
1. Mobile App Development (in progress, 62%)
2. Web Development (available)
3. Data & AI Foundations (available)
4. Business Strategy (available)
5. UI/UX Design (available)

Modify `dummyPrograms` in `main.dart` to test different scenarios.

## 🔄 Future Development (Week 3+)

- **Week 3**: API integration for dynamic program data
  - Connect to backend REST API
  - Implement authenticated requests
  - Dynamic search and filtering
  - Real progress tracking

- **Week 4**: Testing & Refinement
  - Widget and integration tests
  - UX testing and validation
  - Performance optimization
  - Final documentation

- **Future Releases**:
  - Admin workspace for program management
  - Push notifications for program updates
  - Offline mode and local caching
  - Advanced progress tracking with milestones

## 🧪 Testing

Run tests with:
```bash
flutter test
```

Current: Widget test placeholders in `test/widget_test.dart`

## 💻 Development Commands

```bash
# Format code
flutter format lib/ test/

# Run linter
flutter analyze

# Build release APK (Android)
flutter build apk --release

# Build release IPA (iOS)
flutter build ios --release

# Clean build
flutter clean
```

## 📝 Commit History (Week 2)

- `feat: Setup Flutter project structure` — Initial project skeleton
- `feat: Add theme configuration with Excelerate branding` — Color scheme, typography, components
- `feat: Implement login screen with authentication form` — Email/password entry
- `feat: Build home dashboard with snapshot and recommendations` — Main learning hub
- `feat: Create programs discovery screen with search and filters` — Program catalog
- `feat: Build program details screen with learning journey` — Program information
- `feat: Add bottom navigation and routing between screens` — Navigation system
- `docs: Add comprehensive README and project documentation` — This file

## 🎓 Learning Outcomes Met

By completing Week 2, the team has:
- ✅ Translated wireframes into functional Flutter UI screens
- ✅ Gained hands-on experience with Flutter widgets and layouts
- ✅ Implemented navigation and state management patterns
- ✅ Applied Excelerate branding consistently across all screens
- ✅ Developed a working prototype demonstrating structured, user-friendly mobile interfaces
- ✅ Prepared the foundation for Week 3 API integration

## 🤝 Team Members

- Zainab Mughal
- Hiba Amir
- Hamna Iqbal
- Neliswa Sililo
- John Rey Castillo
- Fatima Parvez
- Muhammad Yousuf Imran

## 📞 Support & Questions

For questions about the project structure, design decisions, or implementation details, refer to:
- Week 1 Product Proposal (in `/docs/`)
- Flutter Documentation: https://flutter.dev/docs
- Material Design Guidelines: https://material.io/design

## 📜 License

This project is part of the Excelerate Virtual Internship program. All rights reserved.

---

**Status**: Week 2 Complete ✅ | Ready for Week 3 API Integration

Last Updated: August 2024
