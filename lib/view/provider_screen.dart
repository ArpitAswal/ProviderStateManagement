import 'package:flutter/material.dart';
import 'package:provider_management/view/weather_screen.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Access Of ChangeNotifier Class"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Provider.of",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 4.0,
              ),
              Text(
                  "Provider.of<T> is returns the class of type T and creates a dependency on it. Usually, your class of type T will be some type of ChangeNotifier. So if you do something like Provider.of<UserProvider>, this gets the class of UserProvider. With this, you can access the property and methods of the class.",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.blue,
                  )),
              SizedBox(
                height: 4.0,
              ),
              Text(
                  "Provider.of can take the parameter listen . This means that it listens to the change as given by notifyListeners , and rebuilds the widget. By default, listen is set to true. You can override this and set it as false, so that the widget does not rebuild unnecessarily.",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.redAccent,
                  )),
              SizedBox(
                height: 4.0,
              ),
              Text(
                  "ElevatedButton(\n"
                  "onPressed: () {\n"
                  "Provider.of<UserProvider>(context, listen: false).removeCurrentUser();\n"
                  "},child: Text('Remove Current User'),)",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black54,
                  )),
              SizedBox(
                height: 8.0,
              ),
              Text("context.read",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 4.0,
              ),
              Text(
                  "Context.read is like Provider.of(context, listen: false) , but with certain restrictions. \n"
                  "Since it does not cause the widget to rebuild, you will most likely use this to call events that do not need to rebuild the current widget.",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.blue,
                  )),
              SizedBox(
                height: 4.0,
              ),
              Text(
                  "You would’t want to rebuild the widget with loginUser, since you will redirect the user after a successful login anyways.",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.redAccent,
                  )),
              SizedBox(
                height: 4.0,
              ),
              Text(
                  "ElevatedButton(\n"
                  "onPressed: () {\n"
                  "context.read<UserProvider>().loginUser(newLoginUser);\n"
                  "Navigator.pushReplacementNamed(context, '/');\n"
                  "},child: Text('Login User'),)",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black54,
                  )),
              SizedBox(
                height: 4.0,
              ),
              Text(
                  "Note: The documentation mentions that you should not call this in build since it is unsafe.",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black54,
                  )),
              SizedBox(
                height: 8.0,
              ),
              Text("context.watch",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 4.0,
              ),
              Text(
                  "Context.watch is basically Provider.of(context, listen: true). So upon notifyListeners, this will rebuild the widget.\n"
                  "Since this rebuilds the widget, you’ll use this for pretty much anything, including exposing values that change, and for calling events.",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.blue,
                  )),
              SizedBox(
                height: 4.0,
              ),
              Text(
                  "This is the opposite of read , since you can only use this inside build . The logic for this is identical to the explanation above. This makes widgets rebuild, thus should be called inside build.",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.redAccent,
                  )),
              SizedBox(
                height: 4.0,
              ),
              Text(
                  " final temperatureProvider = context.watch<TemperatureProvider>();\n"
                  "ElevatedButton(\n"
                  "onPressed: () {\n"
                  "temperatureProvider.updateTemperature(temperatureProvider.currentTemperature + 1)\n"
                  "},child: Text('Update Temperature'),)",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black54,
                  )),
              SizedBox(
                height: 8.0,
              ),
              Text("context.select",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 4.0,
              ),
              Text(
                  " Let’s say you need access to a value that changes, but at the same time you don’t want to make the widget rebuild every time any other value in the class calls notifyListeners. You just want to rebuild when a certain value of your choice changes selectively.",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.blue,
                  )),
              SizedBox(
                height: 4.0,
              ),
              Text(
                  "Let’s say you only want to trigger rebuild upon the update of certain properties, like you only want to rebuild when you update the temperature and not rebuild when you update the humidity. You want to selectively rebuild.",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.redAccent,
                  )),
              SizedBox(
                height: 4.0,
              ),
              Text(
                  "final temp = context.select((WeatherProvider i) => i.temperature);\n"
                  "ElevatedButton(\n"
                  "onPressed: () {\n"
                  " context.read<WeatherProvider>().updateTemperature(15);\n"
                  "},child: Text('Rebuilt'),)\n"
                  "ElevatedButton(\n"
                  "onPressed: () {\n"
                  " context.read<WeatherProvider>().updateHumidity(1.5);\n"
                  "},child: Text('Not Rebuilt'),)",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black54,
                  )),
              SizedBox(height: 8.0),
              Text("Summary", style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                  ". context.read to call events that do not trigger rebuild for widget",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.green,
                  )),
              Text(
                  ". context.watch for displaying values and any kind of general rebuild for widget",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.green,
                  )),
              Text(
                  ". context.select to display and selectively rebuild widget for certain value",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.green,
                  )),
              SizedBox(height: 4.0),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WeatherDisplayScreen()));
                  },
                  child: Text("Let's see in practical way")),
            ],
          ),
        ),
      ),
    );
  }
}
