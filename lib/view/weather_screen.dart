import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/weather_provider.dart';

class WeatherDisplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("WeatherDisplayScreen rebuild");
    // Selectively observe temperature changes using context.select.
    final selectedTemperature = context.select<WeatherProvider, double>(
      (provider) => provider.temperature,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Display'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("context.read Example"),
            ElevatedButton(
              onPressed: () {
                // Using context.read to update temperature without rebuilding.
                context.read<WeatherProvider>().updateTemperature(20.0);
              },
              child: const Text('Update Temperature (Read)'),
            ),
            const SizedBox(height: 20),
            const Text("context.watch Example"),
            // Using context.watch to rebuild the widget when wind speed changes.
            Text(
                'Current Wind Speed: ${context.watch<WeatherProvider>().windSpeed}'),
            ElevatedButton(
              onPressed: () {
                // Updating wind speed with context.read to avoid rebuild of this button.
                context.read<WeatherProvider>().updateWindSpeed(15.0);
              },
              child: const Text('Update Wind Speed'),
            ),
            const SizedBox(height: 20),
            const Text("context.select Example"),
            // Displaying temperature using context.select for selective rebuild.
            Text('Current Temperature: $selectedTemperature'),
            ElevatedButton(
              onPressed: () {
                // Updating temperature again using context.read.
                context.read<WeatherProvider>().updateTemperature(25.0);
              },
              child: const Text('Update Temperature (Select)'),
            ),
            const SizedBox(height: 20),
            const Text("context.read for Humidity"),
            ElevatedButton(
              onPressed: () {
                // This does not trigger a rebuild, as expected for context.read.
                context.read<WeatherProvider>().updateHumidity(18.0);
              },
              child: const Text('Update Humidity'),
            ),
          ],
        ),
      ),
    );
  }
}
