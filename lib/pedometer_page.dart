import 'package:api_demo/BarGraph/bar_graph_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class PedometerPage extends StatefulWidget {
  @override
  State<PedometerPage> createState() => _PedometerPageState();
}

class _PedometerPageState extends State<PedometerPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _selectedValue = 'Past Week';
  List<String> _items = ['Past Week', 'This Week'];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.06,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipOval(
                  child: Container(
                    color: Colors.grey,
                    child: Image.network(
                      // 'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                      'https://img.freepik.com/free-photo/smiley-businesswoman-posing-outdoors-with-arms-crossed-copy-space_23-2148767055.jpg',
                      width: width * .15,
                      height: width * .15,
                      fit: BoxFit.cover,
                      // color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  width: width * .05,
                ),
                Text(
                  'Jillian Hanson',
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: width * 0.04),
                ),
                Spacer(),
                Container(
                  width: width * .15,
                  height: width * .15,
                  decoration: BoxDecoration(
                    // color: containerColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.3),
                      width: 2.0,
                    ),
                  ),
                  child: Center(
                      child: Image.asset(
                    'assets/equal.png',
                    height: width * .11,
                    width: width * .07,
                  )),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.018,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Pedometer',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: width * 0.08,
                    fontWeight: FontWeight.bold,
                    fontFamily: "OpenSans",
                  ),
                ),
                SizedBox(
                  width: width * .03,
                ),
                Container(
                  width: width * .06,
                  height: width * .06,
                  decoration: BoxDecoration(
                    // color: containerColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 2.0,
                    ),
                  ),
                  child: Center(
                      child: Text(
                    '1',
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  )),
                ),
                Spacer(),
                Container(
                  width: width * .15,
                  height: width * .15,
                  decoration: BoxDecoration(
                    // color: containerColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.3),
                      width: 2.0,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      FluentIcons.chevron_up_down_16_filled,
                      // color: iconColor,
                      // size: size / 2, // Adjust the size of the icon relative to the container
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'See Your Walking Statistics.',
              style: TextStyle(
                  fontFamily: "OpenSans",
                  color: Colors.grey,
                  fontSize: width * .04),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                Text(
                  'Steps',
                  style: TextStyle(
                    fontFamily: "OpenSans",
                    color: Colors.black,
                    fontSize: width * .065,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    value: _selectedValue,
                    hint: Text(
                      'Select an option',
                      style: TextStyle(
                        fontFamily: "OpenSans",
                      ),
                    ),
                    items: _items.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedValue = newValue ?? 'Option 1';
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      height: width * 0.1,
                      width: 180,
                      padding: const EdgeInsets.only(left: 14, right: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        // color: Colors.white,
                      ),
                    ),
                    iconStyleData: IconStyleData(
                      icon: Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: Icon(
                          Icons.keyboard_arrow_down_outlined,
                        ),
                      ),
                      iconSize: 25,
                      // Increased icon size for better visibility
                      iconEnabledColor: Colors.black,
                      iconDisabledColor: Colors.black,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: width * 0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: height * .30,
                    child: BarGraph(barDataList: barData.barDataList),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              children: [
                Expanded(
                    child: customCard('Calories Burnt', '1.2k', 'kCal',
                        'assets/calories.png', width)),
                SizedBox(
                  width: width * 0.05,
                ),
                Expanded(
                    child: customCard('Distance Covered', '3.3', 'KM',
                        'assets/walker.png', width)),
              ],
            ),
          ],
        ),
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
                  color: Colors.black,
                  // Change this to your desired border color
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
        padding: EdgeInsets.only(
          bottom: width * 0.04,
          right: width * 0.05,
          left: width * 0.05,
        ),
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
                    icon: const Icon(FluentIcons.grid_16_regular,
                        color: Colors.white),
                    index: 0,
                  ),
                  _buildNavItem(
                    icon: const Icon(FluentIcons.data_pie_16_regular,
                        color: Colors.white),
                    index: 1,
                  ),
                  const SizedBox(width: 48),
                  _buildNavItem(
                    icon: const Icon(FluentIcons.book_open_28_regular,
                        color: Colors.white),
                    index: 2,
                  ),
                  _buildNavItem(
                    icon: const ImageIcon(
                      AssetImage('assets/filter.png'),
                      color: Colors.white,
                    ),
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

  BarData barData = BarData(
    firstValue: 3800,
    secondValue: 5000,
    thirdValue: 4100,
    fourthValue: 4600,
    fifthValue: 3800,
    sixthValue: 4100,
  );

  Widget customCard(String text1, String numberText, String unitText,
      String iconPath, double width) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.07),
          border: Border.all(
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          )),
      // elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(width * .05),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    text1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "OpenSans",
                      fontSize: width * 0.048,
                    ),
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    iconPath,
                    height: width * 0.05,
                    width: width * .05,
                    color: darkGreen,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  numberText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "OpenSans",
                    fontSize: width * 0.09,
                  ),
                ),
                SizedBox(width: 8,),
                Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: Text(
                    textAlign: TextAlign.center,
                    unitText,
                    style: TextStyle(
                      fontFamily: "OpenSans",
                      color: darkGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
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

  Color darkGreen = Color.fromRGBO(68, 116, 106, 1);
  Color lightGreen = Color.fromRGBO(219, 234, 229, 1);
  Color textGreyColor = Color.fromRGBO(151, 151, 151, 1);
}
