// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, implicit_dynamic_list_literal

import 'dart:io';

import 'package:dart_frog/dart_frog.dart';


import '../routes/index.dart' as index;
import '../routes/_seeder.dart' as seeder;
import '../routes/trips/index.dart' as trips_index;
import '../routes/profile/[id].dart' as profile_$id;
import '../routes/explore/index.dart' as explore_index;
import '../routes/auth/update.dart' as auth_update;
import '../routes/auth/signup.dart' as auth_signup;
import '../routes/auth/login.dart' as auth_login;
import '../routes/api/trips/index.dart' as api_trips_index;
import '../routes/api/profile/update.dart' as api_profile_update;
import '../routes/api/profile/index.dart' as api_profile_index;
import '../routes/api/chat/index.dart' as api_chat_index;
import '../routes/api/chat/[peerId].dart' as api_chat_$peer_id;

import '../routes/_middleware.dart' as middleware;
import '../routes/api/_middleware.dart' as api_middleware;

void main() async {
  final address = InternetAddress.tryParse('') ?? InternetAddress.anyIPv6;
  final port = int.tryParse(Platform.environment['PORT'] ?? '8080') ?? 8080;
  hotReload(() => createServer(address, port));
}

Future<HttpServer> createServer(InternetAddress address, int port) {
  final handler = Cascade().add(buildRootHandler()).handler;
  return serve(handler, address, port);
}

Handler buildRootHandler() {
  final pipeline = const Pipeline().addMiddleware(middleware.middleware);
  final router = Router()
    ..mount('/', (context) => buildHandler()(context))
    ..mount('/trips', (context) => buildTripsHandler()(context))
    ..mount('/profile', (context) => buildProfileHandler()(context))
    ..mount('/explore', (context) => buildExploreHandler()(context))
    ..mount('/auth', (context) => buildAuthHandler()(context))
    ..mount('/api/trips', (context) => buildApiTripsHandler()(context))
    ..mount('/api/profile', (context) => buildApiProfileHandler()(context))
    ..mount('/api/chat', (context) => buildApiChatHandler()(context));
  return pipeline.addHandler(router);
}

Handler buildHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/_seeder', (context) => seeder.onRequest(context,))..all('/', (context) => index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildTripsHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => trips_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildProfileHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/<id>', (context,id,) => profile_$id.onRequest(context,id,));
  return pipeline.addHandler(router);
}

Handler buildExploreHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => explore_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildAuthHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/login', (context) => auth_login.onRequest(context,))..all('/signup', (context) => auth_signup.onRequest(context,))..all('/update', (context) => auth_update.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildApiTripsHandler() {
  final pipeline = const Pipeline().addMiddleware(api_middleware.middleware);
  final router = Router()
    ..all('/', (context) => api_trips_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildApiProfileHandler() {
  final pipeline = const Pipeline().addMiddleware(api_middleware.middleware);
  final router = Router()
    ..all('/update', (context) => api_profile_update.onRequest(context,))..all('/', (context) => api_profile_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildApiChatHandler() {
  final pipeline = const Pipeline().addMiddleware(api_middleware.middleware);
  final router = Router()
    ..all('/<peerId>', (context,peerId,) => api_chat_$peer_id.onRequest(context,peerId,))..all('/', (context) => api_chat_index.onRequest(context,));
  return pipeline.addHandler(router);
}

