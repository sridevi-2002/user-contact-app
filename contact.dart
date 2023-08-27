import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserContact extends StatelessWidget {
  // MyApp({super.key});
  List numbers = [
    {
      'image':
          'https://icon-library.com/images/contact-icon-png/contact-icon-png-5.jpg',
      'name': 'arun',
      'contact': '8754126541',
      'icon': Icons.call
    },
    {
      'image':
          'https://icon-library.com/images/contact-icon-png/contact-icon-png-5.jpg',
      'name': 'babu',
      'contact': '9754126541',
      'icon': Icons.call
    },
    {
      'image':
          'https://icon-library.com/images/contact-icon-png/contact-icon-png-5.jpg',
      'name': 'resh',
      'contact': '8754126452',
      'icon': Icons.call
    },
    {
      'image':
          'https://icon-library.com/images/contact-icon-png/contact-icon-png-5.jpg',
      'name': 'sri',
      'contact': '8794126541',
      'icon': Icons.call
    },
    {
      'image':
          'https://icon-library.com/images/contact-icon-png/contact-icon-png-5.jpg',
      'name': 'varun',
      'contact': '6554126541',
      'icon': Icons.call
    },
    {
      'image':
          'https://icon-library.com/images/contact-icon-png/contact-icon-png-5.jpg',
      'name': 'rocky',
      'contact': '9854126541',
      'icon': Icons.call
    },
    {
      'image':
          'https://icon-library.com/images/contact-icon-png/contact-icon-png-5.jpg',
      'name': 'hari',
      'contact': '8764126541',
      'icon': Icons.call
    },
    {
      'image':
          'https://icon-library.com/images/contact-icon-png/contact-icon-png-5.jpg',
      'name': 'deepak',
      'contact': '7204126541',
      'icon': Icons.call
    },
    {
      'image':
          'https://icon-library.com/images/contact-icon-png/contact-icon-png-5.jpg',
      'name': 'str',
      'contact': '8884126541',
      'icon': Icons.call
    },
    {
      'image':
          'https://icon-library.com/images/contact-icon-png/contact-icon-png-5.jpg',
      'name': 'sdk',
      'contact': '6544126541',
      'icon': Icons.call
    },
    {
      'image':
          'https://icon-library.com/images/contact-icon-png/contact-icon-png-5.jpg',
      'name': 'k',
      'contact': '9754126541',
      'icon': Icons.call
    },
     {
      'image':
          'https://icon-library.com/images/contact-icon-png/contact-icon-png-5.jpg',
      'name': 'v',
      'contact': '9754126541',
      'icon': Icons.call
    },
     {
      'image':
          'https://icon-library.com/images/contact-icon-png/contact-icon-png-5.jpg',
      'name': 'ps',
      'contact': '9754126541',
      'icon': Icons.call
    },
  ];

  UserContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contacts")),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              // height: 500,
              child: ListView.builder(
                itemBuilder: ((context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(numbers[index]['image']),
                      radius: 30,
                    ),
                    title: Text(numbers[index]['name']),
                    subtitle: Text(numbers[index]['contact']),
                    trailing: Icon(numbers[index]['icon']),
                  );
                }),
                itemCount: numbers.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
          ],
          // SizedBox(height: MediaQuery.of(context).size.height-AppBar().preferredSize.height-MediaQuery.of(context).padding.top,
        )
      ),
      ),
    );
  }
}