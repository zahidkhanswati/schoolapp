// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'admin/teachers_screen.dart';
import 'admin/students_screen.dart';
import 'teacher/attendance_screen.dart';
import 'teacher/grades_screen.dart';
import 'teacher/assignments_screen.dart';
import 'shared/messages_screen.dart';
import 'parent/report_card_screen.dart';
import 'parent/fees_screen.dart';
import 'parent/homework_screen.dart';
import 'admin/reports_screen.dart';
import 'admin/notices_screen.dart';

class DashboardScreen extends StatelessWidget {
  final String role;
  const DashboardScreen({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1A2980), Color(0xFF26D0CE)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('$role Dashboard', style: TextStyle(color: Colors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: _getDashboardItems(context),
          ),
        ),
      ),
    );
  }

  List<Widget> _getDashboardItems(BuildContext context) {
    switch (role) {
      case 'Admin':
        return [
          _buildDashboardCard(
            context,
            'Manage Teachers',
            Icons.people,
            Colors.white,
          ),
          _buildDashboardCard(
            context,
            'Manage Students',
            Icons.school,
            Colors.white,
          ),
          _buildDashboardCard(
            context,
            'View Reports',
            Icons.assessment,
            Colors.white,
          ),
          _buildDashboardCard(
            context,
            'Send Notices',
            Icons.notifications,
            Colors.white,
          ),
        ];
      case 'Teacher':
        return [
          _buildDashboardCard(
            context,
            'Take Attendance',
            Icons.checklist,
            Colors.white,
          ),
          _buildDashboardCard(
            context,
            'Upload Grades',
            Icons.grade,
            Colors.white,
          ),
          _buildDashboardCard(
            context,
            'Create Assignments',
            Icons.assignment,
            Colors.white,
          ),
          _buildDashboardCard(
            context,
            'View Messages',
            Icons.message,
            Colors.white,
          ),
        ];
      case 'Parent':
        return [
          _buildDashboardCard(
            context,
            'View Attendance',
            Icons.visibility,
            Colors.white,
          ),
          _buildDashboardCard(
            context,
            'View Report Card',
            Icons.grade,
            Colors.white,
          ),
          _buildDashboardCard(
            context,
            'Pay School Fees',
            Icons.payment,
            Colors.white,
          ),
          _buildDashboardCard(
            context,
            'View Homework',
            Icons.assignment,
            Colors.white,
          ),
        ];
      default:
        return [];
    }
  }

  void _handleCardTap(BuildContext context, String feature) {
    switch (feature) {
      case 'Manage Teachers':
        Navigator.push(context, MaterialPageRoute(builder: (_) => TeachersScreen()));
        break;
      case 'Manage Students':
        Navigator.push(context, MaterialPageRoute(builder: (_) => StudentsScreen()));
        break;
      case 'Take Attendance':
        Navigator.push(context, MaterialPageRoute(builder: (_) => AttendanceScreen()));
        break;
      case 'Upload Grades':
        Navigator.push(context, MaterialPageRoute(builder: (_) => GradesScreen()));
        break;
      case 'Create Assignments':
        Navigator.push(context, MaterialPageRoute(builder: (_) => AssignmentsScreen()));
        break;
      case 'View Messages':
        Navigator.push(context, MaterialPageRoute(builder: (_) => MessagesScreen()));
        break;
      case 'View Attendance':
        Navigator.push(context, MaterialPageRoute(builder: (_) => AttendanceScreen()));
        break;
      case 'View Report Card':
        Navigator.push(context, MaterialPageRoute(builder: (_) => ReportCardScreen()));
        break;
      case 'Pay School Fees':
        Navigator.push(context, MaterialPageRoute(builder: (_) => FeesScreen()));
        break;
      case 'View Homework':
        Navigator.push(context, MaterialPageRoute(builder: (_) => HomeworkScreen()));
        break;
      case 'View Reports':
        Navigator.push(context, MaterialPageRoute(builder: (_) => ReportsScreen()));
        break;
      case 'Send Notices':
        Navigator.push(context, MaterialPageRoute(builder: (_) => NoticesScreen()));
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$feature coming soon!')),
        );
    }
  }

  Widget _buildDashboardCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
  ) {
    return InkWell(
      onTap: () => _handleCardTap(context, title),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromRGBO(255, 255, 255, 0.1),
          border: Border.all(color: const Color.fromRGBO(255, 255, 255, 0.3)),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              blurRadius: 10,
              spreadRadius: 1,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 16),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
