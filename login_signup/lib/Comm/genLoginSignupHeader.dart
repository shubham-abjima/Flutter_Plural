import 'package:flutter/material.dart';

class genLoginSignupHeader extends StatelessWidget {
  String headerName;

  genLoginSignupHeader(this.headerName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 30.0),
          Text(
            headerName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 1, 53, 96),
              fontSize: 35.0,
            ),
          ),
          SizedBox(height: 10.0),
          Image.network(
            "https://d2q79iu7y748jz.cloudfront.net/s/_squarelogo/92aeb857524d43be50d8b121727916b8",
            fit: BoxFit.cover,
            height: 150.0,
            width: 150.0,
          ),
          SizedBox(height: 15.0),
          // Text(
          //   'Sample Code',
          //   style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       color: Colors.black38,
          //       fontSize: 25.0),
          // ),
          // SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
