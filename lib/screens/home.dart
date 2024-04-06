import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_project/screens/qr_code.dart';

import 'course_screen.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final List catNames = [
    "category",
    "Classes",
    "Syllabus",
    "BookStores",
    "Live Courses",
    "LeaderBoard",
  ];

  final List<Color> catColors = [
    const Color(0XFFFFCF2F),
    const Color(0XFFFFCF2F),
    const Color(0XFFFFCF2F),
    const Color(0XFFFFCF2F),
    const Color(0XFFFFCF2F),
    const Color(0XFFFFCF2F),
  ];

  late List<IconButton> catIcons;

  @override
  void initState() {
    super.initState();
    // Initialize catIcons here
    catIcons = [
      IconButton(
          onPressed: () {}, icon: FaIcon(FontAwesomeIcons.shapes, color: Colors.black, size: 30)),
      IconButton(
          onPressed: () {}, icon: FaIcon(FontAwesomeIcons.video, color: Colors.black, size: 30)),
      IconButton(
          onPressed: () => _scanQRCode(context),
          icon: FaIcon(FontAwesomeIcons.camera, color: Colors.black, size: 30)),
      IconButton(
          onPressed: () {}, icon: FaIcon(FontAwesomeIcons.store, color: Colors.black, size: 30)),
      IconButton(
          onPressed: () {}, icon: FaIcon(FontAwesomeIcons.play, color: Colors.black, size: 30)),
      IconButton(
          onPressed: () {}, icon: FaIcon(FontAwesomeIcons.trophy, color: Colors.black, size: 30)),
    ];
  }

  final List imgList = [
    "Flutter",
    "React",
    "Python",
    "Digital Marketing",
    "Mern Stack",
    "Mean Stack",
  ];

  final List summary = [
    'Flutter is a UI toolkit by Google for building natively compiled applications for mobile, web, and desktop from a single codebase. It uses the Dart programming language and provides a reactive framework. Flutter\'s hot reload feature allows developers to instantly see the changes during development. Its widget-based architecture enables the creation of visually appealing and responsive user interfaces. With a growing community and strong support from Google, Flutter has gained popularity for its efficiency in cross-platform app development. It\'s a versatile tool for crafting beautiful and performant applications across various platforms.',
    'React is a JavaScript library for building user interfaces, developed by Facebook. It allows developers to create reusable UI components, making the development process more efficient. React follows a declarative approach, where developers describe how the UI should look based on the application state. The Virtual DOM optimizes performance by updating only changed parts of the actual DOM. React\'s component-based architecture encourages modular and maintainable code. It\'s widely used in web development for creating interactive and dynamic user interfaces. The ecosystem, including tools like Redux, further enhances state management and scalability in React applications.',
    'Python is a high-level, versatile programming language known for its readability and simplicity. It supports multiple programming paradigms and has a vast standard library. Python is widely used for web development, data analysis, artificial intelligence, and automation. Its clean syntax promotes readability and reduces the cost of program maintenance. Python\'s dynamic typing and interpreted nature make it beginner-friendly, and its large and active community ensures a wealth of resources and support. With frameworks like Django and Flask, Python is a powerhouse for both beginners and seasoned developers in various domains',
    'Digital marketing is a dynamic strategy leveraging online channels to promote products or services. It includes activities like SEO, social media marketing, email campaigns, and content creation. The goal is to reach and engage a target audience, driving brand awareness and customer acquisition. Analytical tools track campaign performance, providing insights for optimization. With the rise of social platforms and data-driven approaches, digital marketing allows businesses to tailor messages, measure results, and adapt strategies swiftly. It\'s a crucial element in today\'s tech-driven business landscape, offering cost-effective and targeted ways to connect with potential customers globally.',
    'The MERN (MongoDB, Express.js, React, Node.js) stack is a popular set of technologies for building full-stack web applications. MongoDB, a NoSQL database, stores data in a flexible, JSON-like format. Express.js simplifies server-side development with Node.js, providing a robust framework. React, a front-end library, enables the creation of interactive user interfaces. Node.js, a JavaScript runtime, powers server-side logic. MERN\'s key strength lies in using a unified language (JavaScript) throughout the stack, promoting seamless communication between server and client. It\'s widely adopted for its efficiency in developing scalable and modern web applications.',
    'The MEAN (MongoDB, Express.js, Angular, Node.js) stack is a powerful combination of technologies for building full-stack web applications. MongoDB, a NoSQL database, stores data in a flexible, JSON-like format. Express.js simplifies server-side development with Node.js, offering a robust framework. Angular, a front-end framework, facilitates the creation of dynamic and feature-rich user interfaces. Node.js, a JavaScript runtime, powers the server-side logic. MEAN ensures a seamless JavaScript experience across the entire application, allowing developers to use a single language throughout the stack. This stack is renowned for its flexibility, scalability, and efficiency in developing modern web applications',
  ];

  final List duration = [
    'Duration - 3 Month',
    'Duration - 3 Month',
    'Duration - 3 Month',
    'Duration - 3 Month',
    'Duration - 4 Month',
    'Duration - 4 Month',
  ];

  String qrResult = "You have not scanned a QR";

  _scanQRCode(BuildContext context) async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => const ScannerPage(),
      ),
    );
    setState(() {
      qrResult = result ?? 'No data in QR';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Opacity(
          opacity: 0.1,
          child: Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
          ),
        ),
        DecoratedBox(
          decoration: const BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.24,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    ),
                    child: Image.asset(
                      'assets/images/banner.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    itemCount: catNames.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.4,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              color: catColors[index],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: catIcons[index],
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      );
                    },
                  ),
                ),
                Text(
                  "COURSES",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF050508),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: GridView.builder(
                    itemCount: imgList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseScreen(
                                imgList[index],
                                summary[index],
                                duration[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.amber[100],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.1,
                                  child: Image.asset(
                                    "assets/images/${imgList[index]}.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Text(
                                imgList[index],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
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
          ),
        ),
      ]),
    );
  }
}
