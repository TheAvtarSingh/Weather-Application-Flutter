import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/screens/locationPage.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: SizedBox(
        width: 50,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            navigateAndDisplaySelection(context);
          },
          child: Text("Fetch Your Location"),
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 29, 36, 122)),
        ),
      ),
    );
    ;
  }

  Future<void> navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => YourLocation()),
    );

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('Set Location as : $result')));
    ScaffoldBar();
  }
}
