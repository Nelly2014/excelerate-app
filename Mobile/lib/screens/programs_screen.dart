import 'package:flutter/material.dart';
import '../main.dart';
import '../theme/app_theme.dart';

class ProgramsScreen extends StatefulWidget {
  const ProgramsScreen({Key? key}) : super(key: key);

  @override
  State<ProgramsScreen> createState() => _ProgramsScreenState();
}

class _ProgramsScreenState extends State<ProgramsScreen> {
  final _searchController = TextEditingController();
  String _selectedCategory = 'All';
  late List<Program> _filteredPrograms;
  int _selectedNavIndex = 1;

  final List<String> categories = [
    'All',
    'Technology',
    'Business',
    'Design',
  ];

  @override
  void initState() {
    super.initState();
    _filteredPrograms = dummyPrograms;
    _searchController.addListener(_filterPrograms);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterPrograms() {
    setState(() {
      _filteredPrograms = dummyPrograms.where((program) {
        final matchesSearch = program.title
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()) ||
            program.description
                .toLowerCase()
                .contains(_searchController.text.toLowerCase());

        final matchesCategory =
            _selectedCategory == 'All' || program.category == _selectedCategory;

        return matchesSearch && matchesCategory;
      }).toList();
    });
  }

  void _onCategorySelected(String category) {
    setState(() => _selectedCategory = category);
    _filterPrograms();
  }

  void _onNavBarTapped(int index) {
    setState(() => _selectedNavIndex = index);

    switch (index) {
      case 0:
        Navigator.of(context).pushReplacementNamed('/home');
        break;
      case 1:
        // Stay on programs
        break;
      case 2:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Progress tracking coming in Week 3')),
        );
        break;
      case 3:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile management coming in future')),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EXCELERATE'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Programs',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 4),
                Text(
                  'Explore experiential learning opportunities.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search programs',
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: AppTheme.textLight,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Category Filters
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: categories
                  .map(
                    (category) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FilterChip(
                        label: Text(category),
                        selected: _selectedCategory == category,
                        onSelected: (_) => _onCategorySelected(category),
                        backgroundColor: Colors.white,
                        selectedColor: AppTheme.primaryBlue,
                        labelStyle: TextStyle(
                          color: _selectedCategory == category
                              ? Colors.white
                              : AppTheme.textDark,
                          fontWeight: FontWeight.w500,
                        ),
                        side: BorderSide(
                          color: _selectedCategory == category
                              ? AppTheme.primaryBlue
                              : AppTheme.borderColor,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 16),

          // Programs List
          Expanded(
            child: _filteredPrograms.isEmpty
                ? Center(
                    child: Text(
                      'No programs found',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _filteredPrograms.length,
                    itemBuilder: (context, index) {
                      final program = _filteredPrograms[index];
                      return _buildProgramTile(context, program);
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedNavIndex,
        onTap: _onNavBarTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            activeIcon: Icon(Icons.school),
            label: 'Programs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up_outlined),
            activeIcon: Icon(Icons.trending_up),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildProgramTile(BuildContext context, Program program) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        '/program-details',
        arguments: program,
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        program.title,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        program.description,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                 const Icon(Icons.chevron_right),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.accentGray,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                program.status,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: program.status == 'In progress'
                          ? AppTheme.statusInProgress
                          : AppTheme.successGreen,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
