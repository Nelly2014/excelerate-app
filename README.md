# Excelerate Mobile Learning Companion

## Project Vision

The **Excelerate Mobile Learning Companion** is a cross-platform Flutter application designed to give learners a focused mobile entry point into Excelerate's experiential-learning ecosystem. The first release prioritizes discovery, program information, progress visibility, and a clean navigation model, establishing a solid foundation for future authenticated data, APIs, notifications, and administrative workflows.

---

## Objectives

* **Build a Scalable Foundation:** Establish a structured, cross-platform Flutter codebase suitable for Android and iOS.


* **Streamline Learner Journeys:** Enable users to easily discover available programs, track ongoing activities, and resume their learning journey seamlessly.


* **Support Administrative Workflows:** Design an extensible architecture that will eventually allow administrators to manage programs and monitor learner participation.


* **Integrate Version Control:** Maintain disciplined code changes using Git and GitHub starting from Week 1 setup.

---

## Navigation Flow & Information Architecture

The primary app flow follows a structured path from authentication through to program exploration:

`Login` $\rightarrow$ `Home Dashboard` $\rightarrow$ `Programs Catalogue` $\rightarrow$ `Program Details`

### Core Screens & Purpose:

* **Login:** Secure entry point for learners and administrators.
* **Home Dashboard:** Personalized starting point showcasing active programs, an overall progress snapshot, and recommended opportunities.
* **Programs Listing:** Discovery catalogue equipped with search capabilities and category filters (Technology, Business, Design).
* **Program Details:** In-depth view outlining program duration, key learning outcomes, week-by-week program journeys, and a primary action button to continue or join.
* **Progress & Profile (Planned):** Bottom navigation tabs reserved for milestone tracking and account management.

---

## Repository Structure (`excelerate-mobile`)

```text
excelerate-mobile/
├── lib/
│   └── main.dart
├── test/
│   └── widget_test.dart
├── docs/
│   └── wireframes/
├── assets/
├── pubspec.yaml
├── analysis_options.yaml
├── .gitignore
└── README.md

```

---

## Getting Started

1. **Clone the repository:**
```bash
git clone <REPOSITORY_URL>
cd excelerate-mobile

```


2. **Install dependencies:**
```bash
flutter pub get

```


3. **Run the application:**
```bash
flutter run

```
