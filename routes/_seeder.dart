import 'package:dart_frog/dart_frog.dart';
import 'package:drift/drift.dart';
import '../lib/database/database.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response.json(statusCode: 405, body: {'message': 'Method not allowed'});
  }

  final db = context.read<AppDatabase>();

  // Check if already seeded to avoid duplicates
  final guidesCount = await db.select(db.guides).get();
  if (guidesCount.isNotEmpty) {
    return Response.json(body: {'message': 'Database already seeded'});
  }

  // 1. Seed Guides
  await db.into(db.guides).insert(
    GuidesCompanion.insert(
      name: 'Tuan Tran',
      location: 'Danang, Vietnam',
      reviewCount: const Value(127),
      avatarUrl: const Value('img/avatar/5.png'),
    ),
  );
  await db.into(db.guides).insert(
    GuidesCompanion.insert(
      name: 'Emmy',
      location: 'Hanoi, Vietnam',
      reviewCount: const Value(89),
      avatarUrl: const Value('img/avatar/6.png'),
    ),
  );
  await db.into(db.guides).insert(
    GuidesCompanion.insert(
      name: 'Linh Hana',
      location: 'Danang, Vietnam',
      reviewCount: const Value(127),
      avatarUrl: const Value('img/avatar/7.png'),
    ),
  );
  await db.into(db.guides).insert(
    GuidesCompanion.insert(
      name: 'Khai Ho',
      location: 'Ho Chi Minh, Vietnam',
      reviewCount: const Value(127),
      avatarUrl: const Value('img/avatar/8.png'),
    ),
  );

  // 2. Seed Tours (Featured Tours)
  await db.into(db.tours).insert(
    ToursCompanion.insert(
      title: 'Da Nang - Ba Na - Hoi An',
      location: 'Jan 30, 2020 • 3 days', // Hacking location to store date & duration for now since schema is limited
      price: 400.0,
      rating: const Value(1247.0), // Using rating to store likes
      imageUrl: const Value('img/scene/1.png'),
    ),
  );
  await db.into(db.tours).insert(
    ToursCompanion.insert(
      title: 'Melbourne - Sydney',
      location: 'Jan 30, 2020 • 3 days',
      price: 600.0,
      rating: const Value(1247.0),
      imageUrl: const Value('img/scene/2.png'),
    ),
  );
  await db.into(db.tours).insert(
    ToursCompanion.insert(
      title: 'Hanoi - Ha Long Bay',
      location: 'Jan 30, 2020 • 3 days',
      price: 300.0,
      rating: const Value(1247.0),
      imageUrl: const Value('img/scene/3.png'),
    ),
  );

  // 3. Seed Experiences (Top Experiences)
  await db.into(db.experiences).insert(
    ExperiencesCompanion.insert(
      title: '2 Hour Bicycle Tour exploring Hoian',
      location: 'Hoian, Vietnam',
      price: 0.0, // Default since no price
      rating: const Value(0.0),
      imageUrl: const Value('img/scene/1_vertical.png'),
      // The DB schema for Experiences doesn't have guideName or guideImageUrl.
      // We will just store the guideId or something? Actually schema has id, title, location, price, rating, imageUrl.
      // To match UI exactly we'll need to modify the DB schema, or append it to the title? Let's just use what we have. We'll join or hardcode the guide data.
    ),
  );
  await db.into(db.experiences).insert(
    ExperiencesCompanion.insert(
      title: '1 day at Bana Hill',
      location: 'Bana, Vietnam',
      price: 0.0,
      rating: const Value(0.0),
      imageUrl: const Value('img/scene/2_vertical.png'),
    ),
  );

  // 4. Seed User for Profile
  final user1Id = await db.into(db.users).insert(
    UsersCompanion.insert(
      username: 'tuantran@example.com',
      passwordHash: 'password',
      fullName: const Value('Tuan Tran'),
      avatarUrl: const Value('/img/avatar/1.png'), // used in profile
      coverPhotoUrl: const Value('https://images.unsplash.com/photo-1542332213-31f87348057f?q=80&w=1000&auto=format&fit=crop'),
      reviewCount: const Value(127),
      bio: const Value("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
      videoIntroUrl: const Value('https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=1000&auto=format&fit=crop'),
    ),
  );

  // Languages for User 1
  final lang1Id = await db.into(db.languages).insert(LanguagesCompanion.insert(name: 'Vietnamese'));
  final lang2Id = await db.into(db.languages).insert(LanguagesCompanion.insert(name: 'English'));
  final lang3Id = await db.into(db.languages).insert(LanguagesCompanion.insert(name: 'Korean'));

  await db.into(db.userLanguages).insert(UserLanguagesCompanion.insert(userId: user1Id, languageId: lang1Id));
  await db.into(db.userLanguages).insert(UserLanguagesCompanion.insert(userId: user1Id, languageId: lang2Id));
  await db.into(db.userLanguages).insert(UserLanguagesCompanion.insert(userId: user1Id, languageId: lang3Id));

  // 5. Seed Trips for User 1
  await db.into(db.trips).insert(
    TripsCompanion.insert(
      userId: user1Id,
      title: 'Melbourne - Sydney',
      destination: 'Sydney',
      startDate: const Value(null), // we use string formatting in UI anyway
      endDate: const Value(null),
      status: 'wishlist',
      imageUrl: const Value('img/sydney.png'),
    ),
  );
  await db.into(db.trips).insert(
    TripsCompanion.insert(
      userId: user1Id,
      title: 'Hanoi - Ha Long Bay',
      destination: 'Ha Long Bay',
      startDate: const Value(null),
      endDate: const Value(null),
      status: 'wishlist',
      imageUrl: const Value('img/halong.png'),
    ),
  );

  // 6. Seed Chat Users (peers to chat with)
  final user2Id = await db.into(db.users).insert(
    UsersCompanion.insert(
      username: 'emmy@example.com',
      passwordHash: 'password',
      fullName: const Value('Emmy'),
      avatarUrl: const Value('/img/avatar/6.png'),
      bio: const Value('Travel lover from Hanoi'),
    ),
  );
  final user3Id = await db.into(db.users).insert(
    UsersCompanion.insert(
      username: 'linhhana@example.com',
      passwordHash: 'password',
      fullName: const Value('Linh Hana'),
      avatarUrl: const Value('/img/avatar/7.png'),
      bio: const Value('Exploring the world one city at a time'),
    ),
  );
  final user4Id = await db.into(db.users).insert(
    UsersCompanion.insert(
      username: 'khaiho@example.com',
      passwordHash: 'password',
      fullName: const Value('Khai Ho'),
      avatarUrl: const Value('/img/avatar/8.png'),
      bio: const Value('Professional tour guide in HCMC'),
    ),
  );

  // 7. Seed Conversations & Messages
  // --- Conversation 1: user1 <-> Emmy ---
  final conv1Id = await db.into(db.conversations).insert(
    ConversationsCompanion.insert(user1Id: user1Id, user2Id: user2Id),
  );
  await db.into(db.messages).insert(
    MessagesCompanion.insert(
      conversationId: conv1Id,
      senderId: user2Id,
      content: 'Hi! Are you available for a tour in Da Nang next week?',
      timestamp: Value(DateTime.now().subtract(const Duration(hours: 5))),
    ),
  );
  await db.into(db.messages).insert(
    MessagesCompanion.insert(
      conversationId: conv1Id,
      senderId: user1Id,
      content: 'Hello Emmy! Yes, I am available. What dates are you thinking?',
      timestamp: Value(DateTime.now().subtract(const Duration(hours: 4, minutes: 50))),
    ),
  );
  await db.into(db.messages).insert(
    MessagesCompanion.insert(
      conversationId: conv1Id,
      senderId: user2Id,
      content: 'I was thinking from Monday to Wednesday. Is that okay?',
      timestamp: Value(DateTime.now().subtract(const Duration(hours: 4, minutes: 30))),
    ),
  );
  await db.into(db.messages).insert(
    MessagesCompanion.insert(
      conversationId: conv1Id,
      senderId: user1Id,
      content: 'Perfect! I will prepare the itinerary for you 😊',
      timestamp: Value(DateTime.now().subtract(const Duration(hours: 4))),
    ),
  );
  await db.into(db.messages).insert(
    MessagesCompanion.insert(
      conversationId: conv1Id,
      senderId: user2Id,
      content: 'Thank you so much! Can\'t wait!',
      timestamp: Value(DateTime.now().subtract(const Duration(hours: 3, minutes: 45))),
    ),
  );

  // --- Conversation 2: user1 <-> Linh Hana ---
  final conv2Id = await db.into(db.conversations).insert(
    ConversationsCompanion.insert(user1Id: user1Id, user2Id: user3Id),
  );
  await db.into(db.messages).insert(
    MessagesCompanion.insert(
      conversationId: conv2Id,
      senderId: user3Id,
      content: 'Hey Tuan! I saw your profile and your tours look amazing!',
      timestamp: Value(DateTime.now().subtract(const Duration(days: 1, hours: 2))),
    ),
  );
  await db.into(db.messages).insert(
    MessagesCompanion.insert(
      conversationId: conv2Id,
      senderId: user1Id,
      content: 'Thanks Linh! Which tour caught your eye?',
      timestamp: Value(DateTime.now().subtract(const Duration(days: 1, hours: 1))),
    ),
  );
  await db.into(db.messages).insert(
    MessagesCompanion.insert(
      conversationId: conv2Id,
      senderId: user3Id,
      content: 'The Da Nang - Ba Na - Hoi An tour. How much for 2 people?',
      timestamp: Value(DateTime.now().subtract(const Duration(days: 1))),
    ),
  );

  // --- Conversation 3: user1 <-> Khai Ho ---
  final conv3Id = await db.into(db.conversations).insert(
    ConversationsCompanion.insert(user1Id: user4Id, user2Id: user1Id),
  );
  await db.into(db.messages).insert(
    MessagesCompanion.insert(
      conversationId: conv3Id,
      senderId: user4Id,
      content: 'Bro, are you coming to the guide meetup this weekend?',
      timestamp: Value(DateTime.now().subtract(const Duration(hours: 8))),
    ),
  );
  await db.into(db.messages).insert(
    MessagesCompanion.insert(
      conversationId: conv3Id,
      senderId: user1Id,
      content: 'Hey Khai! Yep, I\'ll be there. See you Saturday!',
      timestamp: Value(DateTime.now().subtract(const Duration(hours: 7))),
    ),
  );
  await db.into(db.messages).insert(
    MessagesCompanion.insert(
      conversationId: conv3Id,
      senderId: user4Id,
      content: 'Awesome! Let\'s grab coffee before the event 👍',
      timestamp: Value(DateTime.now().subtract(const Duration(hours: 6))),
    ),
  );

  return Response.json(body: {'message': 'Database seeded successfully'});
}
