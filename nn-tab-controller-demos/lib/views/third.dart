import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robbinlaw/controllers/sumController.dart';

class ThirdView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<SumController>(
              //You can use bindings instead of init. Bindings are when this widget gets
              //rendered, you can create your Controller
              builder: (_) {
                print("count1 rebuild");
                return Text(
                  'Counter #1:    ${_.counter1?.count}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                );
              },
            ),
            Text("                        +"),
            GetX<SumController>(
              builder: (_) {
                print("count2 rebuild");
                return Text(
                  'Counter #2:    ${_.counter2?.count}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                );
              },
            ),
            Text("                        ="),
            GetX<SumController>(builder: (_) {
              print("sum rebuild");
              return Text(
                'Sum:                 ${_.sum}',
                style: TextStyle(fontWeight: FontWeight.bold),
              );
            }),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: Text("Increment Counter #1"),
              onPressed: () {
                Get.find<SumController>().increment();
                //_.increment();
              },
            ),
            ElevatedButton(
              child: Text("Increment Counter #2"),
              onPressed: () {
                Get.find<SumController>().increment2();
                //_.increment2();
              },
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: Text('Go to Previous View'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
