import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserImageWithIcon extends StatelessWidget {
  UserImageWithIcon({
    Key? key,
    this.profileImage,
  }) : super(key: key);

  final String? profileImage;

  final mainColor = Color.fromARGB(255, 4, 136, 183);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 175,
          height: 175,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: profileImage != null && profileImage!.isNotEmpty
                ? Image(image: AssetImage(profileImage!))
                : Container(
                    color: Colors.grey[200],
                    child: Icon(
                      Icons.person,
                      size: 150,
                      color: Colors.grey[400],
                    ),
                  ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: mainColor,
            ),
            child: const Icon(
              FontAwesomeIcons.pencil,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
