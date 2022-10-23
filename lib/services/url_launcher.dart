import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  static Future<void> sms(String phoneNumber) async {
    final sms = Uri.parse('sms:$phoneNumber');
    if (await canLaunchUrl(sms)) {
      launchUrl(sms);
    } else {
      throw 'Could not launch $sms';
    }
  }

  static Future<void> call(String phoneNumber) async {
    final call = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(call)) {
      launchUrl(call);
    } else {
      throw 'Could not launch $call';
    }
  }
}
