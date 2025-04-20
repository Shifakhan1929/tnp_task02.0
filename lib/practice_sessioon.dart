import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final Color primaryRed = Color.fromARGB(255, 154, 15, 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 255, 255, 255),
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          CircleAvatar(
  backgroundColor: Color(0xFF9A0F0F), 
  child: Text(
    "JD",
    style: TextStyle(color: Colors.white),
  ),
),
          SizedBox(width: 10),
          Icon(Icons.notifications, color: const Color.fromARGB(255, 75, 85, 99)),
          SizedBox(width: 10),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/rgpvlogo.png'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileCard(),
            SizedBox(height: 20),
            Text("Quick Actions", style: _sectionTitleStyle()),
            SizedBox(height: 10),
            _buildQuickActions(),
            SizedBox(height: 20),
            Text("Performance Metrics", style: _sectionTitleStyle()),
            SizedBox(height: 10),
            _buildPerformanceMetrics(),
            SizedBox(height: 20),
            Text("Social Media Channels", style: _sectionTitleStyle()),
            SizedBox(height: 10),
            _buildSocialMediaLinks(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: primaryRed,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Practice"),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Jobs"),
          BottomNavigationBarItem(icon: Icon(Icons.card_membership), label: "Certificates"),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
        ],
      ),
    );
  }

  TextStyle _sectionTitleStyle() =>
      TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  Widget _buildProfileCard() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
 
              radius: 30,
              backgroundImage: AssetImage('images/DIV.png'),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
            ),
            SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Michael Thompson", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("EN2021CS1032"),
                  Text("Computer Science & Engineering"),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 0.85,
                          color: Color.fromARGB(255, 154, 15, 15),
                          backgroundColor: Colors.grey[300],
                        ),
                      ),
                      SizedBox(width: 8),
                     
                    ],
                  ),
                   Text("Profile Complition: 85%" ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _quickAction(Icons.edit, "Practice"),
        _quickAction(Icons.work, "Jobs"),
        _quickAction(Icons.card_membership, "Certificates"),
        _quickAction(Icons.dashboard, "Dashboard"),
      ],
    );
  }

  Widget _quickAction(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[100],
          child: Icon(icon, color: Color(0xFF8D0D0D)),
        ),
        SizedBox(height: 6),
        Text(label),
      ],
    );
  }

  Widget _buildPerformanceMetrics() {
    return GridView.count(
      
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 2,
      children: [
        _metricCard("CGPA", "8.99"),
        _metricCard("Current SGPA", "8.95"),
        _metricCard("Recent Practice Score", "85%"),
        _metricCard("College Rank", "#12"),
      ],
    );
  }

  Widget _metricCard(String title, String value) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(color: Colors.grey[600])),
            Spacer(),
            Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialMediaLinks() {
    final List<Map<String, dynamic>> socialMedia = [
      {'icon': Icons.facebook, 'label': 'Facebook', 'followers': '245K'},
      {'icon': Icons.camera_alt, 'label': 'Instagram', 'followers': '0.7K'},
      {'icon': Icons.alternate_email, 'label': 'Twitter', 'followers': '1K'},
      {'icon': Icons.business_center, 'label': 'LinkedIn', 'followers': '5K'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      itemCount: socialMedia.length,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3),
      itemBuilder: (_, index) {
        var item = socialMedia[index];
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: Icon(item['icon'], color: Color(0xFF8D0D0D)),
            title: Text(item['label']),
            subtitle: Text('${item['followers']} Followers'),
          ),
        );
      },
    );
  }
}
