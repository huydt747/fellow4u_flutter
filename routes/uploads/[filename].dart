import 'dart:convert';
import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:path/path.dart' as p;

Future<Response> onRequest(RequestContext context, String filename) async {
  final filePath = p.join(Directory.current.path, 'uploads', filename);
  final file = File(filePath);

  if (!file.existsSync()) {
    return Response(statusCode: HttpStatus.notFound);
  }

  final bytes = await file.readAsBytes();
  
  // Return the image as a Base64 string inside a JSON object
  // This is the most compatible way to send binary data through Dart Frog
  return Response.json(
    body: {
      'data': base64Encode(bytes),
      'mimeType': p.extension(filename).toLowerCase() == '.png' ? 'image/png' : 'image/jpeg',
    },
  );
}
