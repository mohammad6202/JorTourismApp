import 'package:flutter/material.dart';
import 'package:jordan_heaven/screens/home2.dart';
import 'package:jordan_heaven/screens/quiz.dart';
import 'package:jordan_heaven/screens/rate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final List<Widget> _pages = [HomePage(), QuizScreen(), RateScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xff612518),
      appBar: AppBar(
        backgroundColor: Color(0xffffe5df),
        title: _selectedIndex != 0
            ? Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/heaven.jpg"),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "أردنا جنة",
                    style: TextStyle(
                      color: Color(0xff612518),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            : Container(),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        backgroundColor: Color(0xffffe5df),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: "Quiz"),
          BottomNavigationBarItem(
            icon: Icon(Icons.rate_review),
            label: "Rate us",
          ),
        ],
      ),
    );
  }
}
