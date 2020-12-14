import 'package:blood_app/api/api_endpoints.dart';
import 'package:blood_app/models/user.dart';
import 'package:blood_app/shared_ui/sharedui.dart';
import 'package:flutter/material.dart';

const _propertyTextStyle = TextStyle(fontSize: 18, color: SharedUI.lightGray);
const _infoTextStyle = TextStyle(fontSize: 18);

class ProfileBody extends StatelessWidget {
  double height;
  double width;
  User user;

  ProfileBody(this.user);

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 0.07),
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: width / 4,
              backgroundColor: SharedUI.lightGray,
              backgroundImage: NetworkImage(API.kBASE_URL + user.profileImage),
            ),
            _myCustomCard(
                height,
                width,
                buildCardContent("Full name", user.fullName, "Email",
                    user.email, height, width)),
            _myCustomCard(
                height,
                width,
                buildCardContent("Address", user.municipal + " " + user.state,
                    "Phone number", user.phoneNumber, height, width)),
            _myCustomCard(
                height,
                width,
                buildCardContent(
                    "Blood Type",
                    user.bloodType,
                    "Birth date",
                    user.birthDay +
                        "/" +
                        user.birthMonth +
                        "/" +
                        user.birthYear,
                    height,
                    width)),
          ],
        ),
      ),
    );
  }
}

Widget _myCustomCard(double height, double width, child) {
  return Container(
    width: width,
    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: SharedUI.lightGray, offset: Offset(0, 0), blurRadius: 3)
        ]),
    child: child,
  );
}

Column buildCardContent(String property1, String value1, String property2,
    String value2, double height, double width) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$property1:",
            style: _propertyTextStyle,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Text(
            "$value1",
            softWrap: true,
            style: _infoTextStyle,
          ),
        ],
      ),
      SizedBox(
        height: height * 0.01,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$property2:",
            style: _propertyTextStyle,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Text(
            "$value2",
            softWrap: true,
            style: _infoTextStyle,
          ),
        ],
      ),
    ],
  );
}
