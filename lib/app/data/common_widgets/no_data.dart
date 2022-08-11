import 'package:flutter/material.dart';

class NoDataView extends StatelessWidget {
  final String messageText;

  const NoDataView([this.messageText = "No data found"]);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 250,
        width: 250,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(messageText),
              ),
            )
          ],
        ),
      ),
    );
  }
}
