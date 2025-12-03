import 'package:flutter/material.dart';

class AllAuthorsScreen extends StatelessWidget {
  const AllAuthorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> authors = [
      {'name': 'Ferhat Bora', 'followers': '156.282', 'image': 'https://i.pravatar.cc/150?img=11'},
      {'name': 'Yasemin Gürsürer', 'followers': '269.680', 'image': 'https://i.pravatar.cc/150?img=5'},
      {'name': 'Ege Şahin', 'followers': '18.452', 'image': 'https://i.pravatar.cc/150?img=3'},
      {'name': 'Leyla Günbay', 'followers': '17.505', 'image': 'https://i.pravatar.cc/150?img=9'},
      {'name': 'Çigdem Esastürk', 'followers': '17.640', 'image': 'https://i.pravatar.cc/150?img=1'},
      {'name': 'evdekendinpisir', 'followers': '22.785', 'image': 'https://i.pravatar.cc/150?img=8'},
      {'name': 'Cemre Özgüzel', 'followers': '259.372', 'image': 'https://i.pravatar.cc/150?img=4'},
      {'name': 'Emre Turan', 'followers': '86.357', 'image': 'https://i.pravatar.cc/150?img=12'},
      {'name': 'Neşe Ümit Tan', 'followers': '67.075', 'image': 'https://i.pravatar.cc/150?img=10'},
      {'name': 'İpek Erdoğan', 'followers': '28.247', 'image': 'https://i.pravatar.cc/150?img=2'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Dark background
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Row(
            children: [
              Icon(Icons.search, color: Colors.grey, size: 20),
              SizedBox(width: 8),
              Text(
                'Search in authors',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '${authors.length} authors found.',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: authors.length,
              itemBuilder: (context, index) {
                final author = authors[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(author['image']!),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              author['name']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '${author['followers']} followers',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF2B5E), // Pink/Red color
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        ),
                        child: const Text('Follow', style: TextStyle(fontSize: 14)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
