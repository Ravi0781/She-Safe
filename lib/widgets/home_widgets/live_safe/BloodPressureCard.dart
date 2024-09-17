import 'package:flutter/material.dart';

import '../../../BloodPressureScreen.dart';

class BloodPressureCard extends StatelessWidget {
  final Function? onMapFunction;

  const BloodPressureCard({Key? key, this.onMapFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          InkWell(

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CountdownScreen(),
                ),
              );
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 50,
                width: 50,
                child: Center(
                  child: Image.asset(
                    'assets/icons8-blood-pressure-64.png',
                    height: 32,
                  ),
                ),
              ),
            ),
          ),
          Text('Blood Pressure')
        ],
      ),
    );
  }
}
