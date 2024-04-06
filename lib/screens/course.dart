import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  final List courseList = [
    "Flutter",
    "React",
    "Python",
    "Digital Marketing",
    "Mern Stack",
    "Mean Stack",
  ];

  final List duration = [
    'Duration - 3 Month',
    'Duration - 3 Month',
    'Duration - 3 Month',
    'Duration - 3 Month',
    'Duration - 4 Month',
    'Duration - 4 Month',
  ];

  final List summary = [
    'Flutter is a UI toolkit by Google for building natively compiled applications for mobile, web, and desktop from a single codebase. It uses the Dart programming language and provides a reactive framework. Flutter\'s hot reload feature allows developers to instantly see the changes during development. Its widget-based architecture enables the creation of visually appealing and responsive user interfaces. With a growing community and strong support from Google, Flutter has gained popularity for its efficiency in cross-platform app development. It\'s a versatile tool for crafting beautiful and performant applications across various platforms.',
    'React is a JavaScript library for building user interfaces, developed by Facebook. It allows developers to create reusable UI components, making the development process more efficient. React follows a declarative approach, where developers describe how the UI should look based on the application state. The Virtual DOM optimizes performance by updating only changed parts of the actual DOM. React\'s component-based architecture encourages modular and maintainable code. It\'s widely used in web development for creating interactive and dynamic user interfaces. The ecosystem, including tools like Redux, further enhances state management and scalability in React applications.',
    'Python is a high-level, versatile programming language known for its readability and simplicity. It supports multiple programming paradigms and has a vast standard library. Python is widely used for web development, data analysis, artificial intelligence, and automation. Its clean syntax promotes readability and reduces the cost of program maintenance. Python\'s dynamic typing and interpreted nature make it beginner-friendly, and its large and active community ensures a wealth of resources and support. With frameworks like Django and Flask, Python is a powerhouse for both beginners and seasoned developers in various domains',
    'Digital marketing is a dynamic strategy leveraging online channels to promote products or services. It includes activities like SEO, social media marketing, email campaigns, and content creation. The goal is to reach and engage a target audience, driving brand awareness and customer acquisition. Analytical tools track campaign performance, providing insights for optimization. With the rise of social platforms and data-driven approaches, digital marketing allows businesses to tailor messages, measure results, and adapt strategies swiftly. It\'s a crucial element in today\'s tech-driven business landscape, offering cost-effective and targeted ways to connect with potential customers globally.',
    'The MERN (MongoDB, Express.js, React, Node.js) stack is a popular set of technologies for building full-stack web applications. MongoDB, a NoSQL database, stores data in a flexible, JSON-like format. Express.js simplifies server-side development with Node.js, providing a robust framework. React, a front-end library, enables the creation of interactive user interfaces. Node.js, a JavaScript runtime, powers server-side logic. MERN\'s key strength lies in using a unified language (JavaScript) throughout the stack, promoting seamless communication between server and client. It\'s widely adopted for its efficiency in developing scalable and modern web applications.',
    'The MEAN (MongoDB, Express.js, Angular, Node.js) stack is a powerful combination of technologies for building full-stack web applications. MongoDB, a NoSQL database, stores data in a flexible, JSON-like format. Express.js simplifies server-side development with Node.js, offering a robust framework. Angular, a front-end framework, facilitates the creation of dynamic and feature-rich user interfaces. Node.js, a JavaScript runtime, powers the server-side logic. MEAN ensures a seamless JavaScript experience across the entire application, allowing developers to use a single language throughout the stack. This stack is renowned for its flexibility, scalability, and efficiency in developing modern web applications',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 0.1,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          ListView.builder(
              itemCount: courseList.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  color: Colors.amber[400],
                  child: Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: Text(courseList[index]),
                      subtitle: Text(duration[index]),
                      childrenPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      trailing: FaIcon(FontAwesomeIcons.chevronDown),
                      children: [
                        Text(
                          summary[index],
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
