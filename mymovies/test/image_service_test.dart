import 'package:flutter_test/flutter_test.dart';
import 'package:mymovies/content/config/methods/dowload_image.dart';

void main() {
  test(
    'getBase64ImageFromUrl returns base64 string for a real image',
    () async {
      // Use a URL that is stable and likely to exist
      final imageUrl =
          'https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png';

      try {
        final result = await getBase64ImageFromUrl(imageUrl);

        // Validations
        expect(result, isNotNull);
        expect(result, isA<String>());
        expect(result!.length, greaterThan(0));
      } catch (e) {
        fail('Network error: $e');
      }
    },
  );

  test(
    'getBase64ImageFromUrl returns null for a non-existent image',
    () async {
      final imageUrl =
          'https://upload.wikimedia.org/wikipedia/commons/nonexistentimage.png';

      try {
        final result = await getBase64ImageFromUrl(imageUrl);
        expect(result, null);
      } catch (e) {
        // If network fails, mark test as failed
        fail('Network error: $e');
      }
    },
  );
}
