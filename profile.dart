import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int indexes = 0;

  List abc = [
    {
      'heading': 'The \nGoldfinch',
      'subheading': 'Donna Tartt',
      'percentage': '62%',
      'image':
          'https://upload.wikimedia.org/wikipedia/en/e/eb/The_goldfinch_by_donna_tart.png'
    },
    {
      'heading': 'Die \nVerwandlung',
      'subheading': 'Franz Kafka',
      'percentage': '45%',
      'image': 'https://m.media-amazon.com/images/I/41mPBLV8R-L.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 130, 175, 190),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 130, 175, 190),
        title: const Center(
            child: Text(
          "My Profile",
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        )),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWFsZSUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
                  ),
                  Column(
                    children: [
                      Text(
                        "Welcome back,",
                        style: TextStyle(
                            color: Color.fromARGB(116, 0, 0, 0), fontSize: 20),
                      ),
                      Text(
                        "John Sortino!",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Shelf It's all about you read.",
                          style: TextStyle(fontSize: 17, color: Colors.black)),
                      Text(
                        "Try and enjoy.",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        backgroundColor: Colors.orange,
                      ),
                      icon: const Icon(
                        Icons.read_more,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "SMART PICKER",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "928",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          Text(
                            "Hours",
                            style:
                                TextStyle(color: Color.fromARGB(108, 0, 0, 0)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "129",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          Text(
                            "Books",
                            style:
                                TextStyle(color: Color.fromARGB(108, 0, 0, 0)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "100",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          Text(
                            "Authors",
                            style:
                                TextStyle(color: Color.fromARGB(108, 0, 0, 0)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Continue Reading",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ...abc.map(
                (e) {
                  return SizedBox(
                    height: 100,
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e['heading'],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            e['subheading'],
                            style: const TextStyle(
                                color: Color.fromARGB(145, 0, 0, 0),
                                fontSize: 15),
                          ),
                        ],
                      ),
                      trailing: Column(children: [
                        Text(
                          e['percentage'],
                        ),
                        const Icon(Icons.info)
                      ]),
                      leading: Image.network(
                        e['image'],
                        cacheWidth: 500,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        currentIndex: indexes,
        onTap: (value) {
          setState(() {
            indexes = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Books"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: "Activity"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "You"),
        ],
      ),
    );
  }
}
