import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:path/path.dart' as p;

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  try {
    final formData = await context.request.formData();
    final fileField = formData.files['file'];

    if (fileField == null) {
      return Response.json(
        statusCode: HttpStatus.badRequest,
        body: {'message': 'No file uploaded'},
      );
    }

    // Save to a private directory (NOT in public) to force custom route handling
    final uploadDir = Directory(p.join(Directory.current.path, 'uploads'));
    if (!uploadDir.existsSync()) {
      uploadDir.createSync(recursive: true);
    }

    // Generate unique filename
    final extension = p.extension(fileField.name);
    final fileName = '${DateTime.now().millisecondsSinceEpoch}_${fileField.name}';
    final filePath = p.join(uploadDir.path, fileName);

    // Save file
    final bytes = await fileField.readAsBytes();
    await File(filePath).writeAsBytes(bytes);

    // Return the public URL
    // Note: In local dev, this is http://localhost:8080/uploads/filename
    final fileUrl = '/uploads/$fileName';

    return Response.json(
      body: {
        'message': 'File uploaded successfully',
        'url': fileUrl,
      },
    );
  } catch (e) {
    return Response.json(
      statusCode: HttpStatus.internalServerError,
      body: {'message': 'Upload failed: $e'},
    );
  }
}
