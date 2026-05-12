import 'package:drift/drift.dart';

part 'database.g.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username =>
      text().withLength(min: 3, max: 128).unique()(); // Email
  TextColumn get passwordHash => text()();
  TextColumn get role =>
      text().withDefault(const Constant('Traveler'))(); // Traveler or Guide

  // Name fields
  TextColumn get firstName => text().nullable()();
  TextColumn get lastName => text().nullable()();
  TextColumn get fullName => text().nullable()();

  // Address fields
  TextColumn get address => text().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get country => text().nullable()();
  TextColumn get phone => text().nullable()();

  // Guide specific / Background info
  TextColumn get guideLicenseUrl => text().nullable()();
  TextColumn get identityCardUrl => text().nullable()();
  TextColumn get avatarUrl => text().nullable()();
  TextColumn get coverPhotoUrl => text().nullable()();
  TextColumn get bio => text().nullable()();
  TextColumn get videoIntroUrl => text().nullable()();

  // Stats
  IntColumn get reviewCount => integer().withDefault(const Constant(0))();
  RealColumn get rating => real().withDefault(const Constant(0.0))();
}

class Languages extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
}

class UserLanguages extends Table {
  IntColumn get userId => integer().references(Users, #id)();
  IntColumn get languageId => integer().references(Languages, #id)();

  @override
  List<Set<Column>> get uniqueKeys => [
    {userId, languageId},
  ];
}

class Fees extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  IntColumn get minTravelers => integer()();
  IntColumn get maxTravelers => integer()();
  RealColumn get price => real()();
}

class Availability extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  TextColumn get dayOfWeek => text()(); // Monday, Tuesday, etc.
  TextColumn get fromTime => text()(); // 09:00 AM
  TextColumn get toTime => text()(); // 05:00 PM
}

class Trips extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  TextColumn get title => text()();
  TextColumn get destination => text()();
  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get endDate => dateTime().nullable()();
  TextColumn get status => text()(); // current, next, past, wishlist
  TextColumn get imageUrl => text().nullable()();
  IntColumn get guideId => integer().nullable().references(Users, #id)();
}

class Tours extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get location => text()();
  RealColumn get price => real()();
  RealColumn get rating => real().withDefault(const Constant(0.0))();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get date => text().nullable()();
  TextColumn get duration => text().nullable()();
  IntColumn get likes => integer().withDefault(const Constant(0))();
  IntColumn get guideId => integer().references(Users, #id)();
}

class Conversations extends Table {
  IntColumn get id => integer().autoIncrement()();

  @ReferenceName("startedConversations")
  IntColumn get user1Id => integer().references(Users, #id)();

  @ReferenceName("receivedConversations")
  IntColumn get user2Id => integer().references(Users, #id)();
}

class Messages extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get conversationId => integer().references(Conversations, #id)();
  IntColumn get senderId => integer().references(Users, #id)();
  TextColumn get content => text()();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
}

class News extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get date => text()();
  TextColumn get imageUrl => text()();
}

@DriftDatabase(
  tables: [
    Users,
    Languages,
    UserLanguages,
    Fees,
    Availability,
    Trips,
    Tours,
    Conversations,
    Messages,
    News,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        if (from < 4) {
          // Simplest strategy for dev: drop and recreate if version < 4
          // Or we can manually handle:
          // 1. Drop Guides and Experiences
          // 2. Add guideId to Tours
          // 3. Update Users table

          // For now, let's use a safe-ish destructive migration for dev
          for (final table in allTables) {
            await m.drop(table);
          }
          await m.createAll();
        }
      },
    );
  }
}
