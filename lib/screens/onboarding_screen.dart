import 'package:flutter/material.dart';
import 'package:school_management_system/screens/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

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
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(255, 255, 255, 0.1),
                    // ignore: prefer_const_constructors
                    border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.3)),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        blurRadius: 20,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: const FlutterLogo(size: 100),
                ),
                const SizedBox(height: 30),
                Text(
                  'Asad Education System',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
                const SizedBox(height: 40),

                // Role Selection Cards
                RoleCard(
                  title: 'Admin',
                  icon: Icons.admin_panel_settings,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(role: 'Admin'),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                RoleCard(
                  title: 'Teacher',
                  icon: Icons.school,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(role: 'Teacher'),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                RoleCard(
                  title: 'Parent/Student',
                  icon: Icons.family_restroom,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(role: 'Parent'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoleCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const RoleCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // ignore: prefer_const_constructors_in_immutables
        borderRadius: BorderRadius.circular(12), // Can't be const
        color: const Color.fromRGBO(255, 255, 255, 0.1),
        // ignore: prefer_const_constructors
        border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.3)),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.2),
            blurRadius: 10,
            spreadRadius: 1,
          )
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 30, color: Colors.white),
              const SizedBox(width: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
              const Spacer(),
              const Icon(Icons.chevron_right, size: 30, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
