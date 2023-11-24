import 'dart:async';
import 'package:http/http.dart' as http;

class BlynkApi {
  static final String authToken = 'zrx4GLdGIbkte1_KbjzclBhnBJWKncLM';
  static final String updateUrl = 'https://blynk.cloud/external/api/update';
  static final String getDataUrl = 'https://blynk.cloud/external/api/get';

  static void toggleLed(bool isOn, int ledVirtualPin) async {
    int value = isOn ? 1 : 0;
    String url = '$updateUrl?token=$authToken&v$ledVirtualPin=$value';
    await http.get(Uri.parse(url));
  }

  static void setBrightness(double brightness) async {
    int brightnessValue = brightness.clamp(0, 255).round();
    String url = '$updateUrl?token=$authToken&v7=$brightnessValue';
    await http.get(Uri.parse(url));
  }

  static Future<int?> getTemperature() async {
    String url = '$getDataUrl?token=$authToken&v3';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return int.tryParse(response.body);
      }
    } catch (e) {
      print('Error getting temperature data: $e');
    }
    return null;
  }

  static Future<int?> getHumidity() async {
    String url = '$getDataUrl?token=$authToken&v2';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return int.tryParse(response.body);
      }
    } catch (e) {
      print('Error getting humidity data: $e');
    }
    return null;
  }

  static Future<int?> getLdrValue() async {
    String url = '$getDataUrl?token=$authToken&v4';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return int.tryParse(response.body);
      }
    } catch (e) {
      print('Error getting LDR Value data: $e');
    }
    return null;
  }
}
