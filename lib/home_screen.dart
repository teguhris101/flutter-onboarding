import 'package:flutter/material.dart';
import 'package:travelappbwa/colors.dart';
import 'package:travelappbwa/detail_location.dart';
import 'package:travelappbwa/dummy_data.dart';
import 'package:travelappbwa/fonts.dart';
import 'package:travelappbwa/helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var queryData = MediaQueryApp(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserProfile(),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Let’s enjoy your${'\n'}Vacation',
                    style: poppinHeadline,
                  ),
                ),
                Container(
                  child: InputComponent(),
                  margin: EdgeInsets.only(bottom: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Popular Countries', style: poppinHeadline2),
                      Text("See All", style: poppinBody),
                    ],
                  ),
                ),
                Container(
                  height: queryData.querySize.width * 0.3 * 1.5,
                  margin: EdgeInsets.only(bottom: 10, top: 5),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: popularCountries.length,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      itemBuilder: (BuildContext context, int index) {
                        var data = popularCountries[index];
                        return RenderItem(data: data, key: Key(data.name));
                      }),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Ongoing Event', style: poppinHeadline2),
                      Text("See All", style: poppinBody),
                    ],
                  ),
                ),
                Container(
                  height: queryData.querySize.width * 0.45,
                  margin: EdgeInsets.only(top: 5),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: ongoingEvent.length,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      itemBuilder: (BuildContext context, int index) {
                        var data = ongoingEvent[index];
                        return RenderEventItem(
                            data: data, key: Key(data.eventName));
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network('https://picsum.photos/id/237/100/100',
                width: 50, height: 50),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello, User.', style: poppinSubhead),
                Text('Good Morning.', style: poppinBody),
              ],
            ),
          ),
          Spacer(flex: 1),
          Icon(
            Icons.notifications_none,
            color: greyText1,
          ),
        ],
      ),
    );
  }
}

class InputComponent extends StatelessWidget {
  const InputComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Input country here...',
        prefixIcon: Icon(Icons.search),
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}

class RenderItem extends StatelessWidget {
  final data;
  const RenderItem({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var queryData = MediaQueryApp(context);
    var cardWidth = queryData.querySize.width * 0.3;
    var imageName = 'assets/images/${data.name.toString().toLowerCase()}.jpg';
    return Card(
      elevation: 0.5,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: cardWidth,
        decoration: BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: cardWidth,
                  height: cardWidth * 1.1,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imageName),
                      fit: BoxFit.fitHeight,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      data.name,
                      overflow: TextOverflow.ellipsis,
                      style: poppinBody.merge(
                        TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () => nextScreen(context, DetailLocation(data: data)),
            )
          ],
        ),
      ),
    );
  }
}

class RenderEventItem extends StatelessWidget {
  final data;
  const RenderEventItem({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var queryData = MediaQueryApp(context);
    var cardWidth = queryData.querySize.width * 0.6;
    var borderRadius = BorderRadius.circular(20);
    var imageName = 'assets/images/${data.image.toString().toLowerCase()}.jpg';

    return Card(
      elevation: 0.5,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: cardWidth,
        decoration: BoxDecoration(
          color: grey,
          borderRadius: borderRadius,
        ),
        child: Stack(
          children: [
            Container(
              width: cardWidth,
              height: cardWidth * 0.45 / 0.6,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageName),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: borderRadius),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.9), Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                ),
                borderRadius: borderRadius,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    data.eventName,
                    style: poppinSubhead.merge(TextStyle(color: white)),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.location_pin, color: greyText3, size: 18),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          data.location,
                          style: poppinBody.merge(
                            TextStyle(color: greyText3),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
