import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

const String profileBackgroundImage = 'assets/images/profile_background.png';
const String profileImage = 'assets/images/profile.png';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late double coverHeight;
  final double profileHeight = 144;

  final String aboutUs =
      'Dhanwis Infotech Solutions specializes in innovative communication and information solutions, including web design, tailor-made applications, business-to-client, managed hosting, and internet portal management. Our global clientele is a testament to our quality work.\n As a leader in technology, we export high-quality software worldwide and ensure total client satisfaction, timely delivery, and the best quality/price ratio. Our user-friendly products are delivered by a dedicated team of professionals.';

  Widget buildProfileHeader() {
    coverHeight = MediaQuery.of(context).size.height * 0.3;
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;

    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: Container(
            height: coverHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Image.asset(
              profileBackgroundImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: top,
          child: CircleAvatar(
            radius: 5 + profileHeight / 2,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: profileHeight / 2,
              backgroundColor: Colors.grey[800],
              backgroundImage: AssetImage(profileImage),
            ),
          ),
        ),
      ],
    );
  }

  final Uri _url1 = Uri.parse('http://dhanwis.com/');
  final Uri _url2 = Uri.parse('https://www.youtube.com/@DhanwisTechinfo-Learning');
  final Uri _url3 = Uri.parse('http://linkedin.com/in/dhanwis-techinfo-solutions-9505622a7');
  final Uri _url4 = Uri.parse('https://x.com/dhanwistechinfo?s=20');

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget socialMediaIcon(IconData icon, Uri url) => CircleAvatar(
        radius: 32,
        backgroundColor: Colors.amber[400],
        child: Material(
          shape: CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              _launchUrl(url);
            },
            child: Center(
              child: Icon(
                icon,
                size: 32,
                color: Colors.black,
              ),
            ),
          ),
        ),
      );

  Widget buildSocialMediaIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        socialMediaIcon(FontAwesomeIcons.globe, _url1),
        SizedBox(width: 15),
        socialMediaIcon(FontAwesomeIcons.twitter, _url4),
        SizedBox(width: 15),
        socialMediaIcon(FontAwesomeIcons.linkedin, _url3),
        SizedBox(width: 15),
        socialMediaIcon(FontAwesomeIcons.youtube, _url2),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildProfileHeader(),
            Divider(color: Colors.transparent),
            Column(
              children: [
                Text(
                  'Dhanwis Techinfo Solutions',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Divider(color: Colors.transparent),
                Text(
                  'Software Learning Hub',
                  style: TextStyle(fontSize: 20),
                ),
                Divider(color: Colors.transparent),
                buildSocialMediaIcons(),
                Divider(color: Colors.transparent),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Divider(color: Colors.transparent),
                      Text(
                        aboutUs,
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
