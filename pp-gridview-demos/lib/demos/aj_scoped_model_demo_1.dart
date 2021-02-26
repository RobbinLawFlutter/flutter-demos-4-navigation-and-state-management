//This app demonstrates the use of the ScopedModel package
//that looks after the state management for the app.
//Also our first look at properities vs fields.
//Properties have a getter and possibly a setter
//where as fields do not.

//ScopedModel by whatsupcoders.
//https://www.youtube.com/watch?v=kpOT4OTzKLU

//scoped model by the flutter community.
//https://medium.com/@soonsantos/how-to-use-scopedmodel-in-flutter-f4178a728f99

import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

// Start by creating a class that has a counter and a method to increment it.
// Note: It must inheirit from Model.
class MyCounterModel extends Model {
  //Private field.
  int _counter = 0;
  //Public property.
  int get counter => _counter;
  //This is equivalent to above.
  int get counter1 {
    return _counter;
  }

  void increment() {
    //Increment the counter
    _counter++;

    //The notifyListeners method comes from the
    //base Model of the ScopedModel package.
    notifyListeners();
  }
}

class MyScopedModelDemo1 extends StatelessWidget {
  final MyCounterModel myModel = MyCounterModel();

  @override
  Widget build(BuildContext context) {
    //At the top level of our app, we'll, create a ScopedModel Widget.
    //This will provide the MyCounterModel to all
    //children in the app that request it
    //using a ScopedModelDescendant.
    return ScopedModel<MyCounterModel>(
        model: myModel,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Scoped-Model Demo 1'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Times button has been pushed:',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                //Create a ScopedModelDescendant. This widget will get the
                //MyCounterModel from the nearest parent ScopedModel<CounterModel>
                //model property.
                //It will hand that MyCounterModel to our builder method,
                //via the model parm of the anonymous funciton, and
                //rebuild any time the MyCounterModel changes (i.e. after we
                //notifyListeners in the Model).
                ScopedModelDescendant<MyCounterModel>(
                  builder: (contextParm, childParm, modelParm) {
                    return Text(
                      modelParm.counter.toString(),
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // Use the ScopedModelDescendant again in order to use the increment
          // method from the MyCounterModel
          floatingActionButton: ScopedModelDescendant<MyCounterModel>(
            builder: (contextParm, childParm, modelParm) {
              return FloatingActionButton(
                //backgroundColor: Colors.black,
                //Address of the model.increment method from the
                //MyCounterModel class.
                onPressed: modelParm.increment,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              );
            },
          ),
        ));
  }
}
