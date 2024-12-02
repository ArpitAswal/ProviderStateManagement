import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_management/view_model/counter_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Here we define the this Provider for this particular class
    return ChangeNotifierProvider<CounterProvider>(
      create: (BuildContext context) => CounterProvider(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Counter Example'),
        ),
        body: Consumer<CounterProvider>(
          // to update the UI of Widget
          builder:
              (BuildContext context, CounterProvider value, Widget? child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //It is best practice to put your Consumer widgets as deep in the tree as possible. You don't want to rebuild large portions of the UI just because some detail somewhere changed.
                Text(
                  '${value.counter}',
                  style: TextStyle(color: Colors.amber, fontSize: 24),
                ),
                SizedBox(
                  height: 14.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        child: IconButton(
                            onPressed: value.decrement,
                            icon: Icon(
                              Icons.remove,
                              color: Colors.red,
                            ))),
                    Expanded(
                        child: IconButton(
                            onPressed: value.increment,
                            icon: Icon(
                              Icons.add,
                              color: Colors.green,
                            )))
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
