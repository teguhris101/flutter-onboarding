import 'package:flutter/material.dart';
import 'package:travelappbwa/colors.dart';
import 'package:travelappbwa/dummy_data.dart';
import 'package:travelappbwa/fonts.dart';
import 'package:travelappbwa/helper.dart';

class DetailLocation extends StatefulWidget {
  final data;
  const DetailLocation({required this.data, Key? key}) : super(key: key);

  @override
  _DetailLocationState createState() => _DetailLocationState();
}

class _DetailLocationState extends State<DetailLocation> {
  @override
  Widget build(BuildContext context) {
    var queryData = MediaQueryApp(context);
    var data = widget.data;
    var imageName =
        'assets/images/${widget.data.name.toString().toLowerCase()}.jpg';

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: purple4,
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: queryData.querySize.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imageName),
                                  fit: BoxFit.fitHeight),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: IconButton(
                                  color: purple1,
                                  icon: Icon(Icons.arrow_back),
                                  onPressed: () => prevScreen(context),
                                ),
                              ),
                              FavoritePlaceIcon(placeName: data.name),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${data.name}, ${data.country}',
                              style: poppinHeadline,
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                LocationDesc(
                                  icon: Icons.star_rounded,
                                  value: data.rate.toStringAsFixed(2),
                                ),
                                LocationDesc(
                                  icon: Icons.cloud,
                                  value: '${data.temp.toString()}"C',
                                ),
                                LocationDesc(
                                  icon: Icons.flag,
                                  value: emoji(country: data.code.toString()),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Description", style: poppinHeadline2),
                      SizedBox(height: 10),
                      Text(
                        desc,
                        style: poppinBody.merge(
                          TextStyle(color: black),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LocationDesc extends StatelessWidget {
  final IconData icon;
  final String value;
  const LocationDesc({
    Key? key,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: purple3,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: purple1, size: 30),
        ),
        Text(value, style: poppinHeadline2)
      ],
    );
  }
}

class FavoritePlaceIcon extends StatefulWidget {
  final placeName;
  const FavoritePlaceIcon({Key? key, required this.placeName})
      : super(key: key);

  @override
  _FavoritePlaceIconState createState() => _FavoritePlaceIconState();
}

class _FavoritePlaceIconState extends State<FavoritePlaceIcon> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    var data = widget.placeName;
    var indexData = favPlace.indexWhere((element) => element == data);
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: indexData >= 0 ? purple3 : white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        color: purple1,
        icon: Icon(indexData >= 0 ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          setState(() {
            if (indexData < 0) {
              favPlace.add(data);
            } else {
              favPlace.removeAt(indexData);
            }
            isFavorite = !isFavorite;
          });
        },
      ),
    );
  }
}
