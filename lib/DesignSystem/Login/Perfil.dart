import 'package:flutter/material.dart';

import '../Components/BottomTabBar/bottom_tab_bar.dart';
import '../Components/BottomTabBar/bottom_tab_bar_view_model.dart';

class ProfileScreen extends StatefulWidget {
  final String name;
  final String email;

  const ProfileScreen({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int actualIndex = 3; // Variável de estado para armazenar o índice atual da aba

  final List<Widget> pages = [
    const Center(child: Text('Home Page')),
    const Center(child: Text('Messages Page')),
    const Center(child: Text('Label Page')),
    const Center(child: Text('Profile Page')),
  ];

  // Handles logout action
  void handleLogout() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          // Profile Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                // Profile picture
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profile.jpg'), // Substitua pela imagem correta
                ),
                const SizedBox(width: 16),
                // Name and Email
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.email,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // List of profile options
          Expanded(
            child: ListView(
              children: [
                _buildProfileOption('Edit Name'),
                _buildProfileOption('Shipping Info'),
                _buildProfileOption('Notification'),
                _buildProfileOption('Terms & Condition'),
                const SizedBox(height: 20),

                // Logout option
                ListTile(
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                    ),
                  ),
                  onTap: handleLogout,
                ),
              ],
            ),
          ),

          // Exibir a página de acordo com o índice atual
          Expanded(
            child: pages[actualIndex],
          ),
        ],
      ),

      // Barra de navegação inferior
      bottomNavigationBar: BottomTabBar.instantiate(
        viewModel: BottomTabBarViewModel(
          bottomTabs: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Messages",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.label),
              label: "Label",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            )
          ],
          onIndexChanged: (index) {
            setState(() {
              actualIndex = 3; // Atualiza o índice quando uma aba é selecionada
            });
          },
        ),
        currentIndex: actualIndex,
      ),
    );
  }

  // Function to build a profile option with an arrow icon
  Widget _buildProfileOption(String title) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: () {
        // Handle navigation to respective screens
      },
    );
  }
}
