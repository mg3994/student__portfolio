library profile_page;

import 'package:flutter/material.dart';
import '../../../data/model/student_model.dart';
import '../widgets/components/floating_action_button_widget.dart';

import '../../../data/model/tab_model.dart';
import '../widgets/components/search_input.dart';
part '../widgets/components/app_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  String query = '';
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  // Your filtering logic (as before)
  List<StudentSummary> get filteredSummaries {
    return studentSummaries.where((student) {
      final nameLower = student.studentName.toLowerCase();
      final summaryLower = student.summaryText.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower) ||
          summaryLower.contains(searchLower);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, _tabController),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingActionButtonWidget(),
      body: Column(
        children: [
          // Using the separated SearchInput component
          SearchInput(
            initialQuery: query,
            onSearch: (value) {
              setState(() {
                query = value;
              });
            },
          ),
          // Filtered list of results
          Expanded(
            child: ListView.builder(
              itemCount: filteredSummaries.length,
              itemBuilder: (context, index) {
                final student = filteredSummaries[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.grey, // Grey stroke for the card
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)), // Image rounded
                        child: Image.asset(
                          student.imageUrl,
                          width: MediaQuery.of(context).size.width *
                              0.3, // Responsive width
                          height: 120, // Fixed height for consistency
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                student.summaryText,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                student.teacherName,
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Oleh ${student.studentName}',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          //
        ],
      ),
    );
  }
}
