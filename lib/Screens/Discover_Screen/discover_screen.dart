import 'package:flutter/material.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final List<String> categories = ["Finance", "Arts & Culture", "Sports", "Entertainment"];
  String selectedCategory = "Finance"; // Default selected category

  // Data for each category
  final Map<String, List<Map<String, String>>> categoryArticles = {
    "Finance": [
      {
        "title": "Tesla Expands to India",
        "description": "Tesla is making significant moves to enter the Indian market...",
        "imageUrl": "https://via.placeholder.com/400x200",
        "author": "kakarrot"
      },
      {
        "title": "Stock Market Hits Record High",
        "description": "Investors are optimistic as the market reaches new heights...",
        "imageUrl": "https://via.placeholder.com/400x200",
        "author": "market_watch"
      },
    ],
    "Arts & Culture": [
      {
        "title": "Ancient Artifacts Discovered",
        "description": "Archaeologists have uncovered rare ancient artifacts...",
        "imageUrl": "https://via.placeholder.com/400x200",
        "author": "history_buff"
      },
      {
        "title": "New Art Exhibition in Town",
        "description": "A stunning new art gallery opens featuring modern masterpieces...",
        "imageUrl": "https://via.placeholder.com/400x200",
        "author": "art_lover"
      },
    ],
    "Sports": [
      {
        "title": "Champions League Final",
        "description": "The biggest football match of the year is set to take place...",
        "imageUrl": "https://via.placeholder.com/400x200",
        "author": "sports_fan"
      },
      {
        "title": "Olympic Games Preparation",
        "description": "Athletes are gearing up for the upcoming Olympic Games...",
        "imageUrl": "https://via.placeholder.com/400x200",
        "author": "olympics_news"
      },
    ],
    "Entertainment": [
      {
        "title": "Blockbuster Movie Released",
        "description": "A highly anticipated movie has finally hit the theaters...",
        "imageUrl": "https://via.placeholder.com/400x200",
        "author": "movie_buff"
      },
      {
        "title": "Music Awards Night Highlights",
        "description": "Top musicians gathered for an unforgettable awards night...",
        "imageUrl": "https://via.placeholder.com/400x200",
        "author": "music_critic"
      },
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discover", style: TextStyle(fontSize: 28)),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 28),
            child: Icon(Icons.headset),
          ),
        ]
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Categories - Selectable
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map((category) {
                bool isSelected = category == selectedCategory;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                    child: Chip(
                      label: Text(category, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
                      backgroundColor: isSelected ? Colors.blue : Colors.white,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          SizedBox(height: 10),

          // Cards List - Category-based articles
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: categoryArticles[selectedCategory]!.length,
              itemBuilder: (context, index) {
                final article = categoryArticles[selectedCategory]![index];

                return Container(
                  height: 720,
                  child: Card(
                    color: Color(0xFFf1f5fb),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Article Image
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/Images/IMG_20250218_202446.jpg", height: 500, width: double.infinity, fit: BoxFit.cover),
                        ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(article["title"]!, style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Text(
                                article["description"]!,
                                style: TextStyle(color: Colors.black, fontSize: 14),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  CircleAvatar(radius: 12, backgroundColor: Colors.blue),
                                  SizedBox(width: 5),
                                  Text(article["author"]!, style: TextStyle(color: Colors.black)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
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
