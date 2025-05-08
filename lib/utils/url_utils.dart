import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UrlUtils {
  UrlUtils._();
  static Future<void> openLink(String urlString) async {
    if (!urlString.startsWith("http") && urlString.contains("www")) {
      urlString = "https://$urlString";
    }
    final Uri url = Uri.parse(urlString);
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  static Future<void> openMail(String emailAddress, String subject, String message) async {
    emailAddress = "mailto:$emailAddress?subject=$subject&body=$message";
    final Uri url = Uri.parse(emailAddress);
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  static Future<void> openWhatsapp(String number) async {
    final url = Uri.parse("https://api.whatsapp.com/send/?phone=$number");
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  static Future<void> openCall(String number) async {
    final url = "tel:$number";
    await launchUrlString(
      url,
      mode: LaunchMode.externalApplication,
    );
  }
}
