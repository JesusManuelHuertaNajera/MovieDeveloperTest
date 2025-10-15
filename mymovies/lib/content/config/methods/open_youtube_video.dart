import 'package:url_launcher/url_launcher.dart';

void openYoutubeVideo(String videoKey) async {
  final url = 'https://www.youtube.com/watch?v=$videoKey';

  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  } else {
    print('Could not launch $url');
  }
}
