import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_management/view/counter_screen.dart';
import 'package:provider_management/view/product_page.dart';
import 'package:provider_management/view/provider_screen.dart';
import 'package:provider_management/view/word_example.dart';
import 'package:provider_management/view_model/cart_provider.dart';
import 'package:provider_management/view_model/weather_provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => CartProvider()),
      ChangeNotifierProvider(create: (_) => WeatherProvider())
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Features',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: MainClass(),
    );
  }
}

class MainClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Provider State Management"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "We need to understand three main concepts to use Provider State Management",
                softWrap: true,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                "ChangeNotifier",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                  "It is a simple class, which provides change notification to its listeners. It is used for the listener to observe a model for changes.",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.blue,
                  )),
              SizedBox(height: 8.0),
              Text(
                "ChangeNotifierProvider",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                  "It is the widget that provides a instance of a ChangeNotifier to its descendants.",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.blue,
                  )),
              Text(
                  "There are two ways to do this-\n 1. If we have to define instance of a single provider then we can define in particular class build \n 2. If we have to define the instance of multiple provider then we can define in runApp by using MultiProvider. It's a list of different provider being used within its scope",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black38,
                  )),
              SizedBox(height: 8.0),
              Text("Consumer",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(
                height: 4.0,
              ),
              Text(
                  "It is a type of provider that does not do any fancy work. It just calls the provider in a new widget and delegates its build implementation to the builder.",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.blue,
                  )),
              SizedBox(height: 8.0),
              Text(
                  "Let's see the working of these concepts. How to use these concept together to manage the state by seeing different examples"),
              SizedBox(height: 4.0),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CounterScreen()));
                        },
                        child: Text("CounterExample")),
                  ),
                  SizedBox(width: 12.0),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WordExample()));
                        },
                        child: Text("WordsExample")),
                  ),
                  SizedBox(width: 12.0),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductPage()));
                        },
                        child: Text("CartExample")),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Text(
                  "Let's delve into more when to define provider in MultiProvider or to define in a specific screen",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                  )),
              SizedBox(height: 4.0),
              Text(
                  "Defining ChangeNotifierProvider in main.dart (Global Providers). The provider is created at the root level (like in main.dart) using a MultiProvider, making the provider globally accessible throughout the app.",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.blue,
                  )),
              SizedBox(height: 4.0),
              Text(
                  "This is useful for:\n"
                  ". Global or shared state that needs to be accessed across multiple screens or the entire app (e.g., user authentication, theme management, app settings).\n"
                  ". Persistent data that should remain in memory for the duration of the app’s lifecycle.\n"
                  ". Efficient state sharing between multiple widgets and screens.",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black45,
                  )),
              SizedBox(height: 4.0),
              Text(
                "Example:\n"
                "void main() {\n"
                "runApp(\n"
                "MultiProvider(\n"
                "providers: [\n"
                "ChangeNotifierProvider(create: (_) => AuthProvider()),\n" // Shared throughout the app
                "ChangeNotifierProvider(create: (_) => DataProvider()),]\n" // Shared throughout the app
                "child: MyApp());}\n",
              ),
              SizedBox(height: 4.0),
              Text(
                  "If the state or data is only relevant to a specific screen or part of your app, you can define the provider locally within that screen.",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.blue,
                  )),
              SizedBox(height: 4.0),
              Text(
                  "This is useful for:\n"
                  ". Screen-specific state that only applies to that screen or widget (e.g., form validation, local UI state).\n"
                  ". Short-lived state that can be discarded when navigating away from the screen.",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black45,
                  )),
              SizedBox(height: 4.0),
              Text(
                  "Example:\n"
                  "Widget build(BuildContext context) {\n"
                  "return ChangeNotifierProvider(\n"
                  "create: (_) => DataProvider(),\n" // Only available in this screen
                  "child: Consumer<DataProvider>(\n"
                  "builder: (context, dataProvider, child) {\n"
                  "return Scaffold()}));",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                  )),
              SizedBox(height: 8.0),
              Text("How to use Provider: Context.read, watch and select",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.blue,
                  )),
              SizedBox(height: 4.0),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProviderScreen()));
                  },
                  child: Text("ClickHere")),
            ],
          ),
        ),
      ),
    );
  }
}
