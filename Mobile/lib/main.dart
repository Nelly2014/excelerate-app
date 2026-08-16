import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/programs_screen.dart';
import 'screens/program_details_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const ExcelerateApp());
}

class ExcelerateApp extends StatelessWidget {
  const ExcelerateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Excelerate',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/programs': (context) => const ProgramsScreen(),
        '/program-details': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Program?;
          return ProgramDetailsScreen(program: args ?? dummyPrograms[0]);
        },
      },
    );
  }
}

// Dummy data models
class Program {
  final int id;
  final String title;
  final String category;
  final String description;
  final String duration;
  final List<String> learningOutcomes;
  final List<String> journey;
  final String status;
  final int progressPercent;

  Program({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.duration,
    required this.learningOutcomes,
    required this.journey,
    required this.status,
    required this.progressPercent,
  });
}

final List<Program> dummyPrograms = [
  Program(
    id: 1,
    title: 'Mobile App Development',
    category: 'Technology',
    description: 'Flutter + 4 weeks',
    duration: '4 weeks',
    learningOutcomes: [
      'Flutter & Dart foundations',
      'UI/UX and app navigation',
      'API integration',
      'GitHub collaboration',
    ],
    journey: [
      'Week 1: Foundation & wireframes',
      'Week 2: Core UI screens',
      'Week 3: APIs & functionality',
      'Week 4: Testing & delivery',
    ],
    status: 'In progress',
    progressPercent: 62,
  ),
  Program(
    id: 2,
    title: 'Web Development',
    category: 'Technology',
    description: 'HTML + CSS + Javascript',
    duration: '6 weeks',
    learningOutcomes: [
      'HTML & CSS fundamentals',
      'JavaScript essentials',
      'Responsive design',
      'Modern web frameworks',
    ],
    journey: [
      'Week 1: HTML structure',
      'Week 2: CSS styling',
      'Week 3: JavaScript basics',
      'Week 4-6: Projects',
    ],
    status: 'Available',
    progressPercent: 0,
  ),
  Program(
    id: 3,
    title: 'Data & AI Foundations',
    category: 'Technology',
    description: 'Python + 4 Projects',
    duration: '8 weeks',
    learningOutcomes: [
      'Python programming',
      'Data analysis with pandas',
      'Machine learning basics',
      'AI applications',
    ],
    journey: [
      'Week 1-2: Python foundations',
      'Week 3-4: Data analysis',
      'Week 5-6: ML fundamentals',
      'Week 7-8: Capstone project',
    ],
    status: 'Available',
    progressPercent: 0,
  ),
  Program(
    id: 4,
    title: 'Business Strategy',
    category: 'Business',
    description: 'Build practical business skills',
    duration: '5 weeks',
    learningOutcomes: [
      'Strategic planning',
      'Market analysis',
      'Financial fundamentals',
      'Leadership principles',
    ],
    journey: [
      'Module 1: Strategy basics',
      'Module 2: Market research',
      'Module 3: Finance essentials',
      'Module 4: Leadership',
    ],
    status: 'Available',
    progressPercent: 0,
  ),
  Program(
    id: 5,
    title: 'UI/UX Design',
    category: 'Design',
    description: 'Build practical frontend skills',
    duration: '6 weeks',
    learningOutcomes: [
      'Design thinking',
      'Wireframing techniques',
      'Visual design principles',
      'Prototyping tools',
    ],
    journey: [
      'Week 1: Design fundamentals',
      'Week 2: User research',
      'Week 3: Wireframing',
      'Week 4-6: Design projects',
    ],
    status: 'Available',
    progressPercent: 0,
  ),
];
