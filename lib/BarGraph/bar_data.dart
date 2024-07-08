import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class Healthpage1 extends StatefulWidget {
  const Healthpage1({super.key});

  @override
  State<Healthpage1> createState() => _Healthpage1State();
}

class _Healthpage1State extends State<Healthpage1> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Selected Index: $_selectedIndex'),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 50, left: 12.0),
        child: SizedBox(
          height: 60,
          width: 60,
          child: FittedBox(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black, // Change this to your desired border color
                  width: 6.0, // Change this to your desired border width
                ),
              ),
              child: FloatingActionButton(
                shape: const CircleBorder(),
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: BottomAppBar(
            color: const Color(0xFF161616),
            notchMargin: 8,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildNavItem(
                    icon: const Icon(FluentIcons.grid_16_regular,color: Colors.white),
                    index: 0,
                  ),
                  _buildNavItem(
                    icon: const Icon(FluentIcons.data_pie_16_regular,color: Colors.white),
                    index: 1,
                  ),
                  const SizedBox(width: 48),
                  _buildNavItem(
                    icon: const Icon(FluentIcons.book_open_28_regular,color: Colors.white),
                    index: 2,
                  ),
                  _buildNavItem(
                    icon: const ImageIcon(AssetImage('assets/images/filter.png'),color: Colors.white,),
                    index: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({required Widget icon, required int index}) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon,
          const SizedBox(height: 2),
          Container(
            alignment: Alignment.center,
            height: 2,
            width: 25,
            color: _selectedIndex == index ? Colors.white : Colors.transparent,
          ),
        ],
      ),
    );
  }
}