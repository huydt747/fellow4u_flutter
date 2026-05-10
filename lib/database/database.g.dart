// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
      maxTextLength: 128,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _passwordHashMeta = const VerificationMeta(
    'passwordHash',
  );
  @override
  late final GeneratedColumn<String> passwordHash = GeneratedColumn<String>(
    'password_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Traveler'),
  );
  static const VerificationMeta _firstNameMeta = const VerificationMeta(
    'firstName',
  );
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _countryMeta = const VerificationMeta(
    'country',
  );
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
    'country',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _guideLicenseUrlMeta = const VerificationMeta(
    'guideLicenseUrl',
  );
  @override
  late final GeneratedColumn<String> guideLicenseUrl = GeneratedColumn<String>(
    'guide_license_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _identityCardUrlMeta = const VerificationMeta(
    'identityCardUrl',
  );
  @override
  late final GeneratedColumn<String> identityCardUrl = GeneratedColumn<String>(
    'identity_card_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _avatarUrlMeta = const VerificationMeta(
    'avatarUrl',
  );
  @override
  late final GeneratedColumn<String> avatarUrl = GeneratedColumn<String>(
    'avatar_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _coverPhotoUrlMeta = const VerificationMeta(
    'coverPhotoUrl',
  );
  @override
  late final GeneratedColumn<String> coverPhotoUrl = GeneratedColumn<String>(
    'cover_photo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bioMeta = const VerificationMeta('bio');
  @override
  late final GeneratedColumn<String> bio = GeneratedColumn<String>(
    'bio',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _videoIntroUrlMeta = const VerificationMeta(
    'videoIntroUrl',
  );
  @override
  late final GeneratedColumn<String> videoIntroUrl = GeneratedColumn<String>(
    'video_intro_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _reviewCountMeta = const VerificationMeta(
    'reviewCount',
  );
  @override
  late final GeneratedColumn<int> reviewCount = GeneratedColumn<int>(
    'review_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _activityTitleMeta = const VerificationMeta(
    'activityTitle',
  );
  @override
  late final GeneratedColumn<String> activityTitle = GeneratedColumn<String>(
    'activity_title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _activityImageUrlMeta = const VerificationMeta(
    'activityImageUrl',
  );
  @override
  late final GeneratedColumn<String> activityImageUrl = GeneratedColumn<String>(
    'activity_image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    username,
    passwordHash,
    role,
    firstName,
    lastName,
    fullName,
    address,
    city,
    country,
    phone,
    guideLicenseUrl,
    identityCardUrl,
    avatarUrl,
    coverPhotoUrl,
    bio,
    videoIntroUrl,
    reviewCount,
    rating,
    activityTitle,
    activityImageUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password_hash')) {
      context.handle(
        _passwordHashMeta,
        passwordHash.isAcceptableOrUnknown(
          data['password_hash']!,
          _passwordHashMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_passwordHashMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    }
    if (data.containsKey('first_name')) {
      context.handle(
        _firstNameMeta,
        firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta),
      );
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    }
    if (data.containsKey('country')) {
      context.handle(
        _countryMeta,
        country.isAcceptableOrUnknown(data['country']!, _countryMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('guide_license_url')) {
      context.handle(
        _guideLicenseUrlMeta,
        guideLicenseUrl.isAcceptableOrUnknown(
          data['guide_license_url']!,
          _guideLicenseUrlMeta,
        ),
      );
    }
    if (data.containsKey('identity_card_url')) {
      context.handle(
        _identityCardUrlMeta,
        identityCardUrl.isAcceptableOrUnknown(
          data['identity_card_url']!,
          _identityCardUrlMeta,
        ),
      );
    }
    if (data.containsKey('avatar_url')) {
      context.handle(
        _avatarUrlMeta,
        avatarUrl.isAcceptableOrUnknown(data['avatar_url']!, _avatarUrlMeta),
      );
    }
    if (data.containsKey('cover_photo_url')) {
      context.handle(
        _coverPhotoUrlMeta,
        coverPhotoUrl.isAcceptableOrUnknown(
          data['cover_photo_url']!,
          _coverPhotoUrlMeta,
        ),
      );
    }
    if (data.containsKey('bio')) {
      context.handle(
        _bioMeta,
        bio.isAcceptableOrUnknown(data['bio']!, _bioMeta),
      );
    }
    if (data.containsKey('video_intro_url')) {
      context.handle(
        _videoIntroUrlMeta,
        videoIntroUrl.isAcceptableOrUnknown(
          data['video_intro_url']!,
          _videoIntroUrlMeta,
        ),
      );
    }
    if (data.containsKey('review_count')) {
      context.handle(
        _reviewCountMeta,
        reviewCount.isAcceptableOrUnknown(
          data['review_count']!,
          _reviewCountMeta,
        ),
      );
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    }
    if (data.containsKey('activity_title')) {
      context.handle(
        _activityTitleMeta,
        activityTitle.isAcceptableOrUnknown(
          data['activity_title']!,
          _activityTitleMeta,
        ),
      );
    }
    if (data.containsKey('activity_image_url')) {
      context.handle(
        _activityImageUrlMeta,
        activityImageUrl.isAcceptableOrUnknown(
          data['activity_image_url']!,
          _activityImageUrlMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      passwordHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password_hash'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      firstName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_name'],
      ),
      lastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name'],
      ),
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      ),
      country: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      guideLicenseUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}guide_license_url'],
      ),
      identityCardUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}identity_card_url'],
      ),
      avatarUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avatar_url'],
      ),
      coverPhotoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_photo_url'],
      ),
      bio: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bio'],
      ),
      videoIntroUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}video_intro_url'],
      ),
      reviewCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}review_count'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rating'],
      )!,
      activityTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}activity_title'],
      ),
      activityImageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}activity_image_url'],
      ),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String username;
  final String passwordHash;
  final String role;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? address;
  final String? city;
  final String? country;
  final String? phone;
  final String? guideLicenseUrl;
  final String? identityCardUrl;
  final String? avatarUrl;
  final String? coverPhotoUrl;
  final String? bio;
  final String? videoIntroUrl;
  final int reviewCount;
  final double rating;
  final String? activityTitle;
  final String? activityImageUrl;
  const User({
    required this.id,
    required this.username,
    required this.passwordHash,
    required this.role,
    this.firstName,
    this.lastName,
    this.fullName,
    this.address,
    this.city,
    this.country,
    this.phone,
    this.guideLicenseUrl,
    this.identityCardUrl,
    this.avatarUrl,
    this.coverPhotoUrl,
    this.bio,
    this.videoIntroUrl,
    required this.reviewCount,
    required this.rating,
    this.activityTitle,
    this.activityImageUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['password_hash'] = Variable<String>(passwordHash);
    map['role'] = Variable<String>(role);
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || fullName != null) {
      map['full_name'] = Variable<String>(fullName);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || guideLicenseUrl != null) {
      map['guide_license_url'] = Variable<String>(guideLicenseUrl);
    }
    if (!nullToAbsent || identityCardUrl != null) {
      map['identity_card_url'] = Variable<String>(identityCardUrl);
    }
    if (!nullToAbsent || avatarUrl != null) {
      map['avatar_url'] = Variable<String>(avatarUrl);
    }
    if (!nullToAbsent || coverPhotoUrl != null) {
      map['cover_photo_url'] = Variable<String>(coverPhotoUrl);
    }
    if (!nullToAbsent || bio != null) {
      map['bio'] = Variable<String>(bio);
    }
    if (!nullToAbsent || videoIntroUrl != null) {
      map['video_intro_url'] = Variable<String>(videoIntroUrl);
    }
    map['review_count'] = Variable<int>(reviewCount);
    map['rating'] = Variable<double>(rating);
    if (!nullToAbsent || activityTitle != null) {
      map['activity_title'] = Variable<String>(activityTitle);
    }
    if (!nullToAbsent || activityImageUrl != null) {
      map['activity_image_url'] = Variable<String>(activityImageUrl);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      username: Value(username),
      passwordHash: Value(passwordHash),
      role: Value(role),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      fullName: fullName == null && nullToAbsent
          ? const Value.absent()
          : Value(fullName),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      guideLicenseUrl: guideLicenseUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(guideLicenseUrl),
      identityCardUrl: identityCardUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(identityCardUrl),
      avatarUrl: avatarUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(avatarUrl),
      coverPhotoUrl: coverPhotoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(coverPhotoUrl),
      bio: bio == null && nullToAbsent ? const Value.absent() : Value(bio),
      videoIntroUrl: videoIntroUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(videoIntroUrl),
      reviewCount: Value(reviewCount),
      rating: Value(rating),
      activityTitle: activityTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(activityTitle),
      activityImageUrl: activityImageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(activityImageUrl),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      passwordHash: serializer.fromJson<String>(json['passwordHash']),
      role: serializer.fromJson<String>(json['role']),
      firstName: serializer.fromJson<String?>(json['firstName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      fullName: serializer.fromJson<String?>(json['fullName']),
      address: serializer.fromJson<String?>(json['address']),
      city: serializer.fromJson<String?>(json['city']),
      country: serializer.fromJson<String?>(json['country']),
      phone: serializer.fromJson<String?>(json['phone']),
      guideLicenseUrl: serializer.fromJson<String?>(json['guideLicenseUrl']),
      identityCardUrl: serializer.fromJson<String?>(json['identityCardUrl']),
      avatarUrl: serializer.fromJson<String?>(json['avatarUrl']),
      coverPhotoUrl: serializer.fromJson<String?>(json['coverPhotoUrl']),
      bio: serializer.fromJson<String?>(json['bio']),
      videoIntroUrl: serializer.fromJson<String?>(json['videoIntroUrl']),
      reviewCount: serializer.fromJson<int>(json['reviewCount']),
      rating: serializer.fromJson<double>(json['rating']),
      activityTitle: serializer.fromJson<String?>(json['activityTitle']),
      activityImageUrl: serializer.fromJson<String?>(json['activityImageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'passwordHash': serializer.toJson<String>(passwordHash),
      'role': serializer.toJson<String>(role),
      'firstName': serializer.toJson<String?>(firstName),
      'lastName': serializer.toJson<String?>(lastName),
      'fullName': serializer.toJson<String?>(fullName),
      'address': serializer.toJson<String?>(address),
      'city': serializer.toJson<String?>(city),
      'country': serializer.toJson<String?>(country),
      'phone': serializer.toJson<String?>(phone),
      'guideLicenseUrl': serializer.toJson<String?>(guideLicenseUrl),
      'identityCardUrl': serializer.toJson<String?>(identityCardUrl),
      'avatarUrl': serializer.toJson<String?>(avatarUrl),
      'coverPhotoUrl': serializer.toJson<String?>(coverPhotoUrl),
      'bio': serializer.toJson<String?>(bio),
      'videoIntroUrl': serializer.toJson<String?>(videoIntroUrl),
      'reviewCount': serializer.toJson<int>(reviewCount),
      'rating': serializer.toJson<double>(rating),
      'activityTitle': serializer.toJson<String?>(activityTitle),
      'activityImageUrl': serializer.toJson<String?>(activityImageUrl),
    };
  }

  User copyWith({
    int? id,
    String? username,
    String? passwordHash,
    String? role,
    Value<String?> firstName = const Value.absent(),
    Value<String?> lastName = const Value.absent(),
    Value<String?> fullName = const Value.absent(),
    Value<String?> address = const Value.absent(),
    Value<String?> city = const Value.absent(),
    Value<String?> country = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> guideLicenseUrl = const Value.absent(),
    Value<String?> identityCardUrl = const Value.absent(),
    Value<String?> avatarUrl = const Value.absent(),
    Value<String?> coverPhotoUrl = const Value.absent(),
    Value<String?> bio = const Value.absent(),
    Value<String?> videoIntroUrl = const Value.absent(),
    int? reviewCount,
    double? rating,
    Value<String?> activityTitle = const Value.absent(),
    Value<String?> activityImageUrl = const Value.absent(),
  }) => User(
    id: id ?? this.id,
    username: username ?? this.username,
    passwordHash: passwordHash ?? this.passwordHash,
    role: role ?? this.role,
    firstName: firstName.present ? firstName.value : this.firstName,
    lastName: lastName.present ? lastName.value : this.lastName,
    fullName: fullName.present ? fullName.value : this.fullName,
    address: address.present ? address.value : this.address,
    city: city.present ? city.value : this.city,
    country: country.present ? country.value : this.country,
    phone: phone.present ? phone.value : this.phone,
    guideLicenseUrl: guideLicenseUrl.present
        ? guideLicenseUrl.value
        : this.guideLicenseUrl,
    identityCardUrl: identityCardUrl.present
        ? identityCardUrl.value
        : this.identityCardUrl,
    avatarUrl: avatarUrl.present ? avatarUrl.value : this.avatarUrl,
    coverPhotoUrl: coverPhotoUrl.present
        ? coverPhotoUrl.value
        : this.coverPhotoUrl,
    bio: bio.present ? bio.value : this.bio,
    videoIntroUrl: videoIntroUrl.present
        ? videoIntroUrl.value
        : this.videoIntroUrl,
    reviewCount: reviewCount ?? this.reviewCount,
    rating: rating ?? this.rating,
    activityTitle: activityTitle.present
        ? activityTitle.value
        : this.activityTitle,
    activityImageUrl: activityImageUrl.present
        ? activityImageUrl.value
        : this.activityImageUrl,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      passwordHash: data.passwordHash.present
          ? data.passwordHash.value
          : this.passwordHash,
      role: data.role.present ? data.role.value : this.role,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      address: data.address.present ? data.address.value : this.address,
      city: data.city.present ? data.city.value : this.city,
      country: data.country.present ? data.country.value : this.country,
      phone: data.phone.present ? data.phone.value : this.phone,
      guideLicenseUrl: data.guideLicenseUrl.present
          ? data.guideLicenseUrl.value
          : this.guideLicenseUrl,
      identityCardUrl: data.identityCardUrl.present
          ? data.identityCardUrl.value
          : this.identityCardUrl,
      avatarUrl: data.avatarUrl.present ? data.avatarUrl.value : this.avatarUrl,
      coverPhotoUrl: data.coverPhotoUrl.present
          ? data.coverPhotoUrl.value
          : this.coverPhotoUrl,
      bio: data.bio.present ? data.bio.value : this.bio,
      videoIntroUrl: data.videoIntroUrl.present
          ? data.videoIntroUrl.value
          : this.videoIntroUrl,
      reviewCount: data.reviewCount.present
          ? data.reviewCount.value
          : this.reviewCount,
      rating: data.rating.present ? data.rating.value : this.rating,
      activityTitle: data.activityTitle.present
          ? data.activityTitle.value
          : this.activityTitle,
      activityImageUrl: data.activityImageUrl.present
          ? data.activityImageUrl.value
          : this.activityImageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('role: $role, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('fullName: $fullName, ')
          ..write('address: $address, ')
          ..write('city: $city, ')
          ..write('country: $country, ')
          ..write('phone: $phone, ')
          ..write('guideLicenseUrl: $guideLicenseUrl, ')
          ..write('identityCardUrl: $identityCardUrl, ')
          ..write('avatarUrl: $avatarUrl, ')
          ..write('coverPhotoUrl: $coverPhotoUrl, ')
          ..write('bio: $bio, ')
          ..write('videoIntroUrl: $videoIntroUrl, ')
          ..write('reviewCount: $reviewCount, ')
          ..write('rating: $rating, ')
          ..write('activityTitle: $activityTitle, ')
          ..write('activityImageUrl: $activityImageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    username,
    passwordHash,
    role,
    firstName,
    lastName,
    fullName,
    address,
    city,
    country,
    phone,
    guideLicenseUrl,
    identityCardUrl,
    avatarUrl,
    coverPhotoUrl,
    bio,
    videoIntroUrl,
    reviewCount,
    rating,
    activityTitle,
    activityImageUrl,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.username == this.username &&
          other.passwordHash == this.passwordHash &&
          other.role == this.role &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.fullName == this.fullName &&
          other.address == this.address &&
          other.city == this.city &&
          other.country == this.country &&
          other.phone == this.phone &&
          other.guideLicenseUrl == this.guideLicenseUrl &&
          other.identityCardUrl == this.identityCardUrl &&
          other.avatarUrl == this.avatarUrl &&
          other.coverPhotoUrl == this.coverPhotoUrl &&
          other.bio == this.bio &&
          other.videoIntroUrl == this.videoIntroUrl &&
          other.reviewCount == this.reviewCount &&
          other.rating == this.rating &&
          other.activityTitle == this.activityTitle &&
          other.activityImageUrl == this.activityImageUrl);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> username;
  final Value<String> passwordHash;
  final Value<String> role;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> fullName;
  final Value<String?> address;
  final Value<String?> city;
  final Value<String?> country;
  final Value<String?> phone;
  final Value<String?> guideLicenseUrl;
  final Value<String?> identityCardUrl;
  final Value<String?> avatarUrl;
  final Value<String?> coverPhotoUrl;
  final Value<String?> bio;
  final Value<String?> videoIntroUrl;
  final Value<int> reviewCount;
  final Value<double> rating;
  final Value<String?> activityTitle;
  final Value<String?> activityImageUrl;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.passwordHash = const Value.absent(),
    this.role = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.fullName = const Value.absent(),
    this.address = const Value.absent(),
    this.city = const Value.absent(),
    this.country = const Value.absent(),
    this.phone = const Value.absent(),
    this.guideLicenseUrl = const Value.absent(),
    this.identityCardUrl = const Value.absent(),
    this.avatarUrl = const Value.absent(),
    this.coverPhotoUrl = const Value.absent(),
    this.bio = const Value.absent(),
    this.videoIntroUrl = const Value.absent(),
    this.reviewCount = const Value.absent(),
    this.rating = const Value.absent(),
    this.activityTitle = const Value.absent(),
    this.activityImageUrl = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required String passwordHash,
    this.role = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.fullName = const Value.absent(),
    this.address = const Value.absent(),
    this.city = const Value.absent(),
    this.country = const Value.absent(),
    this.phone = const Value.absent(),
    this.guideLicenseUrl = const Value.absent(),
    this.identityCardUrl = const Value.absent(),
    this.avatarUrl = const Value.absent(),
    this.coverPhotoUrl = const Value.absent(),
    this.bio = const Value.absent(),
    this.videoIntroUrl = const Value.absent(),
    this.reviewCount = const Value.absent(),
    this.rating = const Value.absent(),
    this.activityTitle = const Value.absent(),
    this.activityImageUrl = const Value.absent(),
  }) : username = Value(username),
       passwordHash = Value(passwordHash);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? passwordHash,
    Expression<String>? role,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? fullName,
    Expression<String>? address,
    Expression<String>? city,
    Expression<String>? country,
    Expression<String>? phone,
    Expression<String>? guideLicenseUrl,
    Expression<String>? identityCardUrl,
    Expression<String>? avatarUrl,
    Expression<String>? coverPhotoUrl,
    Expression<String>? bio,
    Expression<String>? videoIntroUrl,
    Expression<int>? reviewCount,
    Expression<double>? rating,
    Expression<String>? activityTitle,
    Expression<String>? activityImageUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (passwordHash != null) 'password_hash': passwordHash,
      if (role != null) 'role': role,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (fullName != null) 'full_name': fullName,
      if (address != null) 'address': address,
      if (city != null) 'city': city,
      if (country != null) 'country': country,
      if (phone != null) 'phone': phone,
      if (guideLicenseUrl != null) 'guide_license_url': guideLicenseUrl,
      if (identityCardUrl != null) 'identity_card_url': identityCardUrl,
      if (avatarUrl != null) 'avatar_url': avatarUrl,
      if (coverPhotoUrl != null) 'cover_photo_url': coverPhotoUrl,
      if (bio != null) 'bio': bio,
      if (videoIntroUrl != null) 'video_intro_url': videoIntroUrl,
      if (reviewCount != null) 'review_count': reviewCount,
      if (rating != null) 'rating': rating,
      if (activityTitle != null) 'activity_title': activityTitle,
      if (activityImageUrl != null) 'activity_image_url': activityImageUrl,
    });
  }

  UsersCompanion copyWith({
    Value<int>? id,
    Value<String>? username,
    Value<String>? passwordHash,
    Value<String>? role,
    Value<String?>? firstName,
    Value<String?>? lastName,
    Value<String?>? fullName,
    Value<String?>? address,
    Value<String?>? city,
    Value<String?>? country,
    Value<String?>? phone,
    Value<String?>? guideLicenseUrl,
    Value<String?>? identityCardUrl,
    Value<String?>? avatarUrl,
    Value<String?>? coverPhotoUrl,
    Value<String?>? bio,
    Value<String?>? videoIntroUrl,
    Value<int>? reviewCount,
    Value<double>? rating,
    Value<String?>? activityTitle,
    Value<String?>? activityImageUrl,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      passwordHash: passwordHash ?? this.passwordHash,
      role: role ?? this.role,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      fullName: fullName ?? this.fullName,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      phone: phone ?? this.phone,
      guideLicenseUrl: guideLicenseUrl ?? this.guideLicenseUrl,
      identityCardUrl: identityCardUrl ?? this.identityCardUrl,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      coverPhotoUrl: coverPhotoUrl ?? this.coverPhotoUrl,
      bio: bio ?? this.bio,
      videoIntroUrl: videoIntroUrl ?? this.videoIntroUrl,
      reviewCount: reviewCount ?? this.reviewCount,
      rating: rating ?? this.rating,
      activityTitle: activityTitle ?? this.activityTitle,
      activityImageUrl: activityImageUrl ?? this.activityImageUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (passwordHash.present) {
      map['password_hash'] = Variable<String>(passwordHash.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (guideLicenseUrl.present) {
      map['guide_license_url'] = Variable<String>(guideLicenseUrl.value);
    }
    if (identityCardUrl.present) {
      map['identity_card_url'] = Variable<String>(identityCardUrl.value);
    }
    if (avatarUrl.present) {
      map['avatar_url'] = Variable<String>(avatarUrl.value);
    }
    if (coverPhotoUrl.present) {
      map['cover_photo_url'] = Variable<String>(coverPhotoUrl.value);
    }
    if (bio.present) {
      map['bio'] = Variable<String>(bio.value);
    }
    if (videoIntroUrl.present) {
      map['video_intro_url'] = Variable<String>(videoIntroUrl.value);
    }
    if (reviewCount.present) {
      map['review_count'] = Variable<int>(reviewCount.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (activityTitle.present) {
      map['activity_title'] = Variable<String>(activityTitle.value);
    }
    if (activityImageUrl.present) {
      map['activity_image_url'] = Variable<String>(activityImageUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('role: $role, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('fullName: $fullName, ')
          ..write('address: $address, ')
          ..write('city: $city, ')
          ..write('country: $country, ')
          ..write('phone: $phone, ')
          ..write('guideLicenseUrl: $guideLicenseUrl, ')
          ..write('identityCardUrl: $identityCardUrl, ')
          ..write('avatarUrl: $avatarUrl, ')
          ..write('coverPhotoUrl: $coverPhotoUrl, ')
          ..write('bio: $bio, ')
          ..write('videoIntroUrl: $videoIntroUrl, ')
          ..write('reviewCount: $reviewCount, ')
          ..write('rating: $rating, ')
          ..write('activityTitle: $activityTitle, ')
          ..write('activityImageUrl: $activityImageUrl')
          ..write(')'))
        .toString();
  }
}

class $LanguagesTable extends Languages
    with TableInfo<$LanguagesTable, Language> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LanguagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'languages';
  @override
  VerificationContext validateIntegrity(
    Insertable<Language> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Language map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Language(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $LanguagesTable createAlias(String alias) {
    return $LanguagesTable(attachedDatabase, alias);
  }
}

class Language extends DataClass implements Insertable<Language> {
  final int id;
  final String name;
  const Language({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  LanguagesCompanion toCompanion(bool nullToAbsent) {
    return LanguagesCompanion(id: Value(id), name: Value(name));
  }

  factory Language.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Language(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Language copyWith({int? id, String? name}) =>
      Language(id: id ?? this.id, name: name ?? this.name);
  Language copyWithCompanion(LanguagesCompanion data) {
    return Language(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Language(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Language && other.id == this.id && other.name == this.name);
}

class LanguagesCompanion extends UpdateCompanion<Language> {
  final Value<int> id;
  final Value<String> name;
  const LanguagesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  LanguagesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Language> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  LanguagesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return LanguagesCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LanguagesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $UserLanguagesTable extends UserLanguages
    with TableInfo<$UserLanguagesTable, UserLanguage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserLanguagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _languageIdMeta = const VerificationMeta(
    'languageId',
  );
  @override
  late final GeneratedColumn<int> languageId = GeneratedColumn<int>(
    'language_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES languages (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [userId, languageId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_languages';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserLanguage> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('language_id')) {
      context.handle(
        _languageIdMeta,
        languageId.isAcceptableOrUnknown(data['language_id']!, _languageIdMeta),
      );
    } else if (isInserting) {
      context.missing(_languageIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {userId, languageId},
  ];
  @override
  UserLanguage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserLanguage(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      languageId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}language_id'],
      )!,
    );
  }

  @override
  $UserLanguagesTable createAlias(String alias) {
    return $UserLanguagesTable(attachedDatabase, alias);
  }
}

class UserLanguage extends DataClass implements Insertable<UserLanguage> {
  final int userId;
  final int languageId;
  const UserLanguage({required this.userId, required this.languageId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['language_id'] = Variable<int>(languageId);
    return map;
  }

  UserLanguagesCompanion toCompanion(bool nullToAbsent) {
    return UserLanguagesCompanion(
      userId: Value(userId),
      languageId: Value(languageId),
    );
  }

  factory UserLanguage.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserLanguage(
      userId: serializer.fromJson<int>(json['userId']),
      languageId: serializer.fromJson<int>(json['languageId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'languageId': serializer.toJson<int>(languageId),
    };
  }

  UserLanguage copyWith({int? userId, int? languageId}) => UserLanguage(
    userId: userId ?? this.userId,
    languageId: languageId ?? this.languageId,
  );
  UserLanguage copyWithCompanion(UserLanguagesCompanion data) {
    return UserLanguage(
      userId: data.userId.present ? data.userId.value : this.userId,
      languageId: data.languageId.present
          ? data.languageId.value
          : this.languageId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserLanguage(')
          ..write('userId: $userId, ')
          ..write('languageId: $languageId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, languageId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserLanguage &&
          other.userId == this.userId &&
          other.languageId == this.languageId);
}

class UserLanguagesCompanion extends UpdateCompanion<UserLanguage> {
  final Value<int> userId;
  final Value<int> languageId;
  final Value<int> rowid;
  const UserLanguagesCompanion({
    this.userId = const Value.absent(),
    this.languageId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserLanguagesCompanion.insert({
    required int userId,
    required int languageId,
    this.rowid = const Value.absent(),
  }) : userId = Value(userId),
       languageId = Value(languageId);
  static Insertable<UserLanguage> custom({
    Expression<int>? userId,
    Expression<int>? languageId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (languageId != null) 'language_id': languageId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserLanguagesCompanion copyWith({
    Value<int>? userId,
    Value<int>? languageId,
    Value<int>? rowid,
  }) {
    return UserLanguagesCompanion(
      userId: userId ?? this.userId,
      languageId: languageId ?? this.languageId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (languageId.present) {
      map['language_id'] = Variable<int>(languageId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserLanguagesCompanion(')
          ..write('userId: $userId, ')
          ..write('languageId: $languageId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FeesTable extends Fees with TableInfo<$FeesTable, Fee> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _minTravelersMeta = const VerificationMeta(
    'minTravelers',
  );
  @override
  late final GeneratedColumn<int> minTravelers = GeneratedColumn<int>(
    'min_travelers',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _maxTravelersMeta = const VerificationMeta(
    'maxTravelers',
  );
  @override
  late final GeneratedColumn<int> maxTravelers = GeneratedColumn<int>(
    'max_travelers',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    minTravelers,
    maxTravelers,
    price,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fees';
  @override
  VerificationContext validateIntegrity(
    Insertable<Fee> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('min_travelers')) {
      context.handle(
        _minTravelersMeta,
        minTravelers.isAcceptableOrUnknown(
          data['min_travelers']!,
          _minTravelersMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_minTravelersMeta);
    }
    if (data.containsKey('max_travelers')) {
      context.handle(
        _maxTravelersMeta,
        maxTravelers.isAcceptableOrUnknown(
          data['max_travelers']!,
          _maxTravelersMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_maxTravelersMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Fee map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Fee(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      minTravelers: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}min_travelers'],
      )!,
      maxTravelers: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_travelers'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
    );
  }

  @override
  $FeesTable createAlias(String alias) {
    return $FeesTable(attachedDatabase, alias);
  }
}

class Fee extends DataClass implements Insertable<Fee> {
  final int id;
  final int userId;
  final int minTravelers;
  final int maxTravelers;
  final double price;
  const Fee({
    required this.id,
    required this.userId,
    required this.minTravelers,
    required this.maxTravelers,
    required this.price,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['min_travelers'] = Variable<int>(minTravelers);
    map['max_travelers'] = Variable<int>(maxTravelers);
    map['price'] = Variable<double>(price);
    return map;
  }

  FeesCompanion toCompanion(bool nullToAbsent) {
    return FeesCompanion(
      id: Value(id),
      userId: Value(userId),
      minTravelers: Value(minTravelers),
      maxTravelers: Value(maxTravelers),
      price: Value(price),
    );
  }

  factory Fee.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Fee(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      minTravelers: serializer.fromJson<int>(json['minTravelers']),
      maxTravelers: serializer.fromJson<int>(json['maxTravelers']),
      price: serializer.fromJson<double>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'minTravelers': serializer.toJson<int>(minTravelers),
      'maxTravelers': serializer.toJson<int>(maxTravelers),
      'price': serializer.toJson<double>(price),
    };
  }

  Fee copyWith({
    int? id,
    int? userId,
    int? minTravelers,
    int? maxTravelers,
    double? price,
  }) => Fee(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    minTravelers: minTravelers ?? this.minTravelers,
    maxTravelers: maxTravelers ?? this.maxTravelers,
    price: price ?? this.price,
  );
  Fee copyWithCompanion(FeesCompanion data) {
    return Fee(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      minTravelers: data.minTravelers.present
          ? data.minTravelers.value
          : this.minTravelers,
      maxTravelers: data.maxTravelers.present
          ? data.maxTravelers.value
          : this.maxTravelers,
      price: data.price.present ? data.price.value : this.price,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Fee(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('minTravelers: $minTravelers, ')
          ..write('maxTravelers: $maxTravelers, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, minTravelers, maxTravelers, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Fee &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.minTravelers == this.minTravelers &&
          other.maxTravelers == this.maxTravelers &&
          other.price == this.price);
}

class FeesCompanion extends UpdateCompanion<Fee> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> minTravelers;
  final Value<int> maxTravelers;
  final Value<double> price;
  const FeesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.minTravelers = const Value.absent(),
    this.maxTravelers = const Value.absent(),
    this.price = const Value.absent(),
  });
  FeesCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int minTravelers,
    required int maxTravelers,
    required double price,
  }) : userId = Value(userId),
       minTravelers = Value(minTravelers),
       maxTravelers = Value(maxTravelers),
       price = Value(price);
  static Insertable<Fee> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? minTravelers,
    Expression<int>? maxTravelers,
    Expression<double>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (minTravelers != null) 'min_travelers': minTravelers,
      if (maxTravelers != null) 'max_travelers': maxTravelers,
      if (price != null) 'price': price,
    });
  }

  FeesCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<int>? minTravelers,
    Value<int>? maxTravelers,
    Value<double>? price,
  }) {
    return FeesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      minTravelers: minTravelers ?? this.minTravelers,
      maxTravelers: maxTravelers ?? this.maxTravelers,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (minTravelers.present) {
      map['min_travelers'] = Variable<int>(minTravelers.value);
    }
    if (maxTravelers.present) {
      map['max_travelers'] = Variable<int>(maxTravelers.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('minTravelers: $minTravelers, ')
          ..write('maxTravelers: $maxTravelers, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $AvailabilityTable extends Availability
    with TableInfo<$AvailabilityTable, AvailabilityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AvailabilityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _dayOfWeekMeta = const VerificationMeta(
    'dayOfWeek',
  );
  @override
  late final GeneratedColumn<String> dayOfWeek = GeneratedColumn<String>(
    'day_of_week',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fromTimeMeta = const VerificationMeta(
    'fromTime',
  );
  @override
  late final GeneratedColumn<String> fromTime = GeneratedColumn<String>(
    'from_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _toTimeMeta = const VerificationMeta('toTime');
  @override
  late final GeneratedColumn<String> toTime = GeneratedColumn<String>(
    'to_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    dayOfWeek,
    fromTime,
    toTime,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'availability';
  @override
  VerificationContext validateIntegrity(
    Insertable<AvailabilityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('day_of_week')) {
      context.handle(
        _dayOfWeekMeta,
        dayOfWeek.isAcceptableOrUnknown(data['day_of_week']!, _dayOfWeekMeta),
      );
    } else if (isInserting) {
      context.missing(_dayOfWeekMeta);
    }
    if (data.containsKey('from_time')) {
      context.handle(
        _fromTimeMeta,
        fromTime.isAcceptableOrUnknown(data['from_time']!, _fromTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_fromTimeMeta);
    }
    if (data.containsKey('to_time')) {
      context.handle(
        _toTimeMeta,
        toTime.isAcceptableOrUnknown(data['to_time']!, _toTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_toTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AvailabilityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AvailabilityData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      dayOfWeek: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}day_of_week'],
      )!,
      fromTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}from_time'],
      )!,
      toTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}to_time'],
      )!,
    );
  }

  @override
  $AvailabilityTable createAlias(String alias) {
    return $AvailabilityTable(attachedDatabase, alias);
  }
}

class AvailabilityData extends DataClass
    implements Insertable<AvailabilityData> {
  final int id;
  final int userId;
  final String dayOfWeek;
  final String fromTime;
  final String toTime;
  const AvailabilityData({
    required this.id,
    required this.userId,
    required this.dayOfWeek,
    required this.fromTime,
    required this.toTime,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['day_of_week'] = Variable<String>(dayOfWeek);
    map['from_time'] = Variable<String>(fromTime);
    map['to_time'] = Variable<String>(toTime);
    return map;
  }

  AvailabilityCompanion toCompanion(bool nullToAbsent) {
    return AvailabilityCompanion(
      id: Value(id),
      userId: Value(userId),
      dayOfWeek: Value(dayOfWeek),
      fromTime: Value(fromTime),
      toTime: Value(toTime),
    );
  }

  factory AvailabilityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AvailabilityData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      dayOfWeek: serializer.fromJson<String>(json['dayOfWeek']),
      fromTime: serializer.fromJson<String>(json['fromTime']),
      toTime: serializer.fromJson<String>(json['toTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'dayOfWeek': serializer.toJson<String>(dayOfWeek),
      'fromTime': serializer.toJson<String>(fromTime),
      'toTime': serializer.toJson<String>(toTime),
    };
  }

  AvailabilityData copyWith({
    int? id,
    int? userId,
    String? dayOfWeek,
    String? fromTime,
    String? toTime,
  }) => AvailabilityData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    dayOfWeek: dayOfWeek ?? this.dayOfWeek,
    fromTime: fromTime ?? this.fromTime,
    toTime: toTime ?? this.toTime,
  );
  AvailabilityData copyWithCompanion(AvailabilityCompanion data) {
    return AvailabilityData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      dayOfWeek: data.dayOfWeek.present ? data.dayOfWeek.value : this.dayOfWeek,
      fromTime: data.fromTime.present ? data.fromTime.value : this.fromTime,
      toTime: data.toTime.present ? data.toTime.value : this.toTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AvailabilityData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('fromTime: $fromTime, ')
          ..write('toTime: $toTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, dayOfWeek, fromTime, toTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AvailabilityData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.dayOfWeek == this.dayOfWeek &&
          other.fromTime == this.fromTime &&
          other.toTime == this.toTime);
}

class AvailabilityCompanion extends UpdateCompanion<AvailabilityData> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> dayOfWeek;
  final Value<String> fromTime;
  final Value<String> toTime;
  const AvailabilityCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.dayOfWeek = const Value.absent(),
    this.fromTime = const Value.absent(),
    this.toTime = const Value.absent(),
  });
  AvailabilityCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String dayOfWeek,
    required String fromTime,
    required String toTime,
  }) : userId = Value(userId),
       dayOfWeek = Value(dayOfWeek),
       fromTime = Value(fromTime),
       toTime = Value(toTime);
  static Insertable<AvailabilityData> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? dayOfWeek,
    Expression<String>? fromTime,
    Expression<String>? toTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (dayOfWeek != null) 'day_of_week': dayOfWeek,
      if (fromTime != null) 'from_time': fromTime,
      if (toTime != null) 'to_time': toTime,
    });
  }

  AvailabilityCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<String>? dayOfWeek,
    Value<String>? fromTime,
    Value<String>? toTime,
  }) {
    return AvailabilityCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      fromTime: fromTime ?? this.fromTime,
      toTime: toTime ?? this.toTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (dayOfWeek.present) {
      map['day_of_week'] = Variable<String>(dayOfWeek.value);
    }
    if (fromTime.present) {
      map['from_time'] = Variable<String>(fromTime.value);
    }
    if (toTime.present) {
      map['to_time'] = Variable<String>(toTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AvailabilityCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('fromTime: $fromTime, ')
          ..write('toTime: $toTime')
          ..write(')'))
        .toString();
  }
}

class $TripsTable extends Trips with TableInfo<$TripsTable, Trip> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TripsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _destinationMeta = const VerificationMeta(
    'destination',
  );
  @override
  late final GeneratedColumn<String> destination = GeneratedColumn<String>(
    'destination',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _guideIdMeta = const VerificationMeta(
    'guideId',
  );
  @override
  late final GeneratedColumn<int> guideId = GeneratedColumn<int>(
    'guide_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    title,
    destination,
    startDate,
    endDate,
    status,
    imageUrl,
    guideId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trips';
  @override
  VerificationContext validateIntegrity(
    Insertable<Trip> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('destination')) {
      context.handle(
        _destinationMeta,
        destination.isAcceptableOrUnknown(
          data['destination']!,
          _destinationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_destinationMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('guide_id')) {
      context.handle(
        _guideIdMeta,
        guideId.isAcceptableOrUnknown(data['guide_id']!, _guideIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Trip map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Trip(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      destination: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}destination'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      ),
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      guideId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}guide_id'],
      ),
    );
  }

  @override
  $TripsTable createAlias(String alias) {
    return $TripsTable(attachedDatabase, alias);
  }
}

class Trip extends DataClass implements Insertable<Trip> {
  final int id;
  final int userId;
  final String title;
  final String destination;
  final DateTime? startDate;
  final DateTime? endDate;
  final String status;
  final String? imageUrl;
  final int? guideId;
  const Trip({
    required this.id,
    required this.userId,
    required this.title,
    required this.destination,
    this.startDate,
    this.endDate,
    required this.status,
    this.imageUrl,
    this.guideId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['title'] = Variable<String>(title);
    map['destination'] = Variable<String>(destination);
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || guideId != null) {
      map['guide_id'] = Variable<int>(guideId);
    }
    return map;
  }

  TripsCompanion toCompanion(bool nullToAbsent) {
    return TripsCompanion(
      id: Value(id),
      userId: Value(userId),
      title: Value(title),
      destination: Value(destination),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      status: Value(status),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      guideId: guideId == null && nullToAbsent
          ? const Value.absent()
          : Value(guideId),
    );
  }

  factory Trip.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Trip(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      title: serializer.fromJson<String>(json['title']),
      destination: serializer.fromJson<String>(json['destination']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      status: serializer.fromJson<String>(json['status']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      guideId: serializer.fromJson<int?>(json['guideId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'title': serializer.toJson<String>(title),
      'destination': serializer.toJson<String>(destination),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'status': serializer.toJson<String>(status),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'guideId': serializer.toJson<int?>(guideId),
    };
  }

  Trip copyWith({
    int? id,
    int? userId,
    String? title,
    String? destination,
    Value<DateTime?> startDate = const Value.absent(),
    Value<DateTime?> endDate = const Value.absent(),
    String? status,
    Value<String?> imageUrl = const Value.absent(),
    Value<int?> guideId = const Value.absent(),
  }) => Trip(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    title: title ?? this.title,
    destination: destination ?? this.destination,
    startDate: startDate.present ? startDate.value : this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    status: status ?? this.status,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    guideId: guideId.present ? guideId.value : this.guideId,
  );
  Trip copyWithCompanion(TripsCompanion data) {
    return Trip(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      title: data.title.present ? data.title.value : this.title,
      destination: data.destination.present
          ? data.destination.value
          : this.destination,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      status: data.status.present ? data.status.value : this.status,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      guideId: data.guideId.present ? data.guideId.value : this.guideId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Trip(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('destination: $destination, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('status: $status, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('guideId: $guideId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    title,
    destination,
    startDate,
    endDate,
    status,
    imageUrl,
    guideId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Trip &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.title == this.title &&
          other.destination == this.destination &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.status == this.status &&
          other.imageUrl == this.imageUrl &&
          other.guideId == this.guideId);
}

class TripsCompanion extends UpdateCompanion<Trip> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> title;
  final Value<String> destination;
  final Value<DateTime?> startDate;
  final Value<DateTime?> endDate;
  final Value<String> status;
  final Value<String?> imageUrl;
  final Value<int?> guideId;
  const TripsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.title = const Value.absent(),
    this.destination = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.status = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.guideId = const Value.absent(),
  });
  TripsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String title,
    required String destination,
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    required String status,
    this.imageUrl = const Value.absent(),
    this.guideId = const Value.absent(),
  }) : userId = Value(userId),
       title = Value(title),
       destination = Value(destination),
       status = Value(status);
  static Insertable<Trip> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? title,
    Expression<String>? destination,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? status,
    Expression<String>? imageUrl,
    Expression<int>? guideId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (title != null) 'title': title,
      if (destination != null) 'destination': destination,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (status != null) 'status': status,
      if (imageUrl != null) 'image_url': imageUrl,
      if (guideId != null) 'guide_id': guideId,
    });
  }

  TripsCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<String>? title,
    Value<String>? destination,
    Value<DateTime?>? startDate,
    Value<DateTime?>? endDate,
    Value<String>? status,
    Value<String?>? imageUrl,
    Value<int?>? guideId,
  }) {
    return TripsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      destination: destination ?? this.destination,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      imageUrl: imageUrl ?? this.imageUrl,
      guideId: guideId ?? this.guideId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (destination.present) {
      map['destination'] = Variable<String>(destination.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (guideId.present) {
      map['guide_id'] = Variable<int>(guideId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TripsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('destination: $destination, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('status: $status, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('guideId: $guideId')
          ..write(')'))
        .toString();
  }
}

class $GuidesTable extends Guides with TableInfo<$GuidesTable, Guide> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GuidesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _avatarUrlMeta = const VerificationMeta(
    'avatarUrl',
  );
  @override
  late final GeneratedColumn<String> avatarUrl = GeneratedColumn<String>(
    'avatar_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _reviewCountMeta = const VerificationMeta(
    'reviewCount',
  );
  @override
  late final GeneratedColumn<int> reviewCount = GeneratedColumn<int>(
    'review_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    avatarUrl,
    location,
    rating,
    reviewCount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'guides';
  @override
  VerificationContext validateIntegrity(
    Insertable<Guide> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('avatar_url')) {
      context.handle(
        _avatarUrlMeta,
        avatarUrl.isAcceptableOrUnknown(data['avatar_url']!, _avatarUrlMeta),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    }
    if (data.containsKey('review_count')) {
      context.handle(
        _reviewCountMeta,
        reviewCount.isAcceptableOrUnknown(
          data['review_count']!,
          _reviewCountMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Guide map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Guide(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      avatarUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avatar_url'],
      ),
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rating'],
      )!,
      reviewCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}review_count'],
      )!,
    );
  }

  @override
  $GuidesTable createAlias(String alias) {
    return $GuidesTable(attachedDatabase, alias);
  }
}

class Guide extends DataClass implements Insertable<Guide> {
  final int id;
  final String name;
  final String? avatarUrl;
  final String location;
  final double rating;
  final int reviewCount;
  const Guide({
    required this.id,
    required this.name,
    this.avatarUrl,
    required this.location,
    required this.rating,
    required this.reviewCount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || avatarUrl != null) {
      map['avatar_url'] = Variable<String>(avatarUrl);
    }
    map['location'] = Variable<String>(location);
    map['rating'] = Variable<double>(rating);
    map['review_count'] = Variable<int>(reviewCount);
    return map;
  }

  GuidesCompanion toCompanion(bool nullToAbsent) {
    return GuidesCompanion(
      id: Value(id),
      name: Value(name),
      avatarUrl: avatarUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(avatarUrl),
      location: Value(location),
      rating: Value(rating),
      reviewCount: Value(reviewCount),
    );
  }

  factory Guide.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Guide(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      avatarUrl: serializer.fromJson<String?>(json['avatarUrl']),
      location: serializer.fromJson<String>(json['location']),
      rating: serializer.fromJson<double>(json['rating']),
      reviewCount: serializer.fromJson<int>(json['reviewCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'avatarUrl': serializer.toJson<String?>(avatarUrl),
      'location': serializer.toJson<String>(location),
      'rating': serializer.toJson<double>(rating),
      'reviewCount': serializer.toJson<int>(reviewCount),
    };
  }

  Guide copyWith({
    int? id,
    String? name,
    Value<String?> avatarUrl = const Value.absent(),
    String? location,
    double? rating,
    int? reviewCount,
  }) => Guide(
    id: id ?? this.id,
    name: name ?? this.name,
    avatarUrl: avatarUrl.present ? avatarUrl.value : this.avatarUrl,
    location: location ?? this.location,
    rating: rating ?? this.rating,
    reviewCount: reviewCount ?? this.reviewCount,
  );
  Guide copyWithCompanion(GuidesCompanion data) {
    return Guide(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      avatarUrl: data.avatarUrl.present ? data.avatarUrl.value : this.avatarUrl,
      location: data.location.present ? data.location.value : this.location,
      rating: data.rating.present ? data.rating.value : this.rating,
      reviewCount: data.reviewCount.present
          ? data.reviewCount.value
          : this.reviewCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Guide(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('avatarUrl: $avatarUrl, ')
          ..write('location: $location, ')
          ..write('rating: $rating, ')
          ..write('reviewCount: $reviewCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, avatarUrl, location, rating, reviewCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Guide &&
          other.id == this.id &&
          other.name == this.name &&
          other.avatarUrl == this.avatarUrl &&
          other.location == this.location &&
          other.rating == this.rating &&
          other.reviewCount == this.reviewCount);
}

class GuidesCompanion extends UpdateCompanion<Guide> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> avatarUrl;
  final Value<String> location;
  final Value<double> rating;
  final Value<int> reviewCount;
  const GuidesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.avatarUrl = const Value.absent(),
    this.location = const Value.absent(),
    this.rating = const Value.absent(),
    this.reviewCount = const Value.absent(),
  });
  GuidesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.avatarUrl = const Value.absent(),
    required String location,
    this.rating = const Value.absent(),
    this.reviewCount = const Value.absent(),
  }) : name = Value(name),
       location = Value(location);
  static Insertable<Guide> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? avatarUrl,
    Expression<String>? location,
    Expression<double>? rating,
    Expression<int>? reviewCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (avatarUrl != null) 'avatar_url': avatarUrl,
      if (location != null) 'location': location,
      if (rating != null) 'rating': rating,
      if (reviewCount != null) 'review_count': reviewCount,
    });
  }

  GuidesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? avatarUrl,
    Value<String>? location,
    Value<double>? rating,
    Value<int>? reviewCount,
  }) {
    return GuidesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      location: location ?? this.location,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (avatarUrl.present) {
      map['avatar_url'] = Variable<String>(avatarUrl.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (reviewCount.present) {
      map['review_count'] = Variable<int>(reviewCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GuidesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('avatarUrl: $avatarUrl, ')
          ..write('location: $location, ')
          ..write('rating: $rating, ')
          ..write('reviewCount: $reviewCount')
          ..write(')'))
        .toString();
  }
}

class $ToursTable extends Tours with TableInfo<$ToursTable, Tour> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ToursTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationMeta = const VerificationMeta(
    'duration',
  );
  @override
  late final GeneratedColumn<String> duration = GeneratedColumn<String>(
    'duration',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _likesMeta = const VerificationMeta('likes');
  @override
  late final GeneratedColumn<int> likes = GeneratedColumn<int>(
    'likes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    location,
    price,
    rating,
    imageUrl,
    date,
    duration,
    likes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tours';
  @override
  VerificationContext validateIntegrity(
    Insertable<Tour> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    }
    if (data.containsKey('likes')) {
      context.handle(
        _likesMeta,
        likes.isAcceptableOrUnknown(data['likes']!, _likesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tour map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tour(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rating'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      ),
      duration: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}duration'],
      ),
      likes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}likes'],
      )!,
    );
  }

  @override
  $ToursTable createAlias(String alias) {
    return $ToursTable(attachedDatabase, alias);
  }
}

class Tour extends DataClass implements Insertable<Tour> {
  final int id;
  final String title;
  final String location;
  final double price;
  final double rating;
  final String? imageUrl;
  final String? date;
  final String? duration;
  final int likes;
  const Tour({
    required this.id,
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
    this.imageUrl,
    this.date,
    this.duration,
    required this.likes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['location'] = Variable<String>(location);
    map['price'] = Variable<double>(price);
    map['rating'] = Variable<double>(rating);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<String>(date);
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<String>(duration);
    }
    map['likes'] = Variable<int>(likes);
    return map;
  }

  ToursCompanion toCompanion(bool nullToAbsent) {
    return ToursCompanion(
      id: Value(id),
      title: Value(title),
      location: Value(location),
      price: Value(price),
      rating: Value(rating),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      likes: Value(likes),
    );
  }

  factory Tour.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tour(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      location: serializer.fromJson<String>(json['location']),
      price: serializer.fromJson<double>(json['price']),
      rating: serializer.fromJson<double>(json['rating']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      date: serializer.fromJson<String?>(json['date']),
      duration: serializer.fromJson<String?>(json['duration']),
      likes: serializer.fromJson<int>(json['likes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'location': serializer.toJson<String>(location),
      'price': serializer.toJson<double>(price),
      'rating': serializer.toJson<double>(rating),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'date': serializer.toJson<String?>(date),
      'duration': serializer.toJson<String?>(duration),
      'likes': serializer.toJson<int>(likes),
    };
  }

  Tour copyWith({
    int? id,
    String? title,
    String? location,
    double? price,
    double? rating,
    Value<String?> imageUrl = const Value.absent(),
    Value<String?> date = const Value.absent(),
    Value<String?> duration = const Value.absent(),
    int? likes,
  }) => Tour(
    id: id ?? this.id,
    title: title ?? this.title,
    location: location ?? this.location,
    price: price ?? this.price,
    rating: rating ?? this.rating,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    date: date.present ? date.value : this.date,
    duration: duration.present ? duration.value : this.duration,
    likes: likes ?? this.likes,
  );
  Tour copyWithCompanion(ToursCompanion data) {
    return Tour(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      location: data.location.present ? data.location.value : this.location,
      price: data.price.present ? data.price.value : this.price,
      rating: data.rating.present ? data.rating.value : this.rating,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      date: data.date.present ? data.date.value : this.date,
      duration: data.duration.present ? data.duration.value : this.duration,
      likes: data.likes.present ? data.likes.value : this.likes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tour(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('location: $location, ')
          ..write('price: $price, ')
          ..write('rating: $rating, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('date: $date, ')
          ..write('duration: $duration, ')
          ..write('likes: $likes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    location,
    price,
    rating,
    imageUrl,
    date,
    duration,
    likes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tour &&
          other.id == this.id &&
          other.title == this.title &&
          other.location == this.location &&
          other.price == this.price &&
          other.rating == this.rating &&
          other.imageUrl == this.imageUrl &&
          other.date == this.date &&
          other.duration == this.duration &&
          other.likes == this.likes);
}

class ToursCompanion extends UpdateCompanion<Tour> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> location;
  final Value<double> price;
  final Value<double> rating;
  final Value<String?> imageUrl;
  final Value<String?> date;
  final Value<String?> duration;
  final Value<int> likes;
  const ToursCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.location = const Value.absent(),
    this.price = const Value.absent(),
    this.rating = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.date = const Value.absent(),
    this.duration = const Value.absent(),
    this.likes = const Value.absent(),
  });
  ToursCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String location,
    required double price,
    this.rating = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.date = const Value.absent(),
    this.duration = const Value.absent(),
    this.likes = const Value.absent(),
  }) : title = Value(title),
       location = Value(location),
       price = Value(price);
  static Insertable<Tour> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? location,
    Expression<double>? price,
    Expression<double>? rating,
    Expression<String>? imageUrl,
    Expression<String>? date,
    Expression<String>? duration,
    Expression<int>? likes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (location != null) 'location': location,
      if (price != null) 'price': price,
      if (rating != null) 'rating': rating,
      if (imageUrl != null) 'image_url': imageUrl,
      if (date != null) 'date': date,
      if (duration != null) 'duration': duration,
      if (likes != null) 'likes': likes,
    });
  }

  ToursCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? location,
    Value<double>? price,
    Value<double>? rating,
    Value<String?>? imageUrl,
    Value<String?>? date,
    Value<String?>? duration,
    Value<int>? likes,
  }) {
    return ToursCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      location: location ?? this.location,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      imageUrl: imageUrl ?? this.imageUrl,
      date: date ?? this.date,
      duration: duration ?? this.duration,
      likes: likes ?? this.likes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (duration.present) {
      map['duration'] = Variable<String>(duration.value);
    }
    if (likes.present) {
      map['likes'] = Variable<int>(likes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ToursCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('location: $location, ')
          ..write('price: $price, ')
          ..write('rating: $rating, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('date: $date, ')
          ..write('duration: $duration, ')
          ..write('likes: $likes')
          ..write(')'))
        .toString();
  }
}

class $ExperiencesTable extends Experiences
    with TableInfo<$ExperiencesTable, Experience> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExperiencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _guideIdMeta = const VerificationMeta(
    'guideId',
  );
  @override
  late final GeneratedColumn<int> guideId = GeneratedColumn<int>(
    'guide_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    location,
    price,
    rating,
    imageUrl,
    guideId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'experiences';
  @override
  VerificationContext validateIntegrity(
    Insertable<Experience> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('guide_id')) {
      context.handle(
        _guideIdMeta,
        guideId.isAcceptableOrUnknown(data['guide_id']!, _guideIdMeta),
      );
    } else if (isInserting) {
      context.missing(_guideIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Experience map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Experience(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rating'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      guideId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}guide_id'],
      )!,
    );
  }

  @override
  $ExperiencesTable createAlias(String alias) {
    return $ExperiencesTable(attachedDatabase, alias);
  }
}

class Experience extends DataClass implements Insertable<Experience> {
  final int id;
  final String title;
  final String location;
  final double price;
  final double rating;
  final String? imageUrl;
  final int guideId;
  const Experience({
    required this.id,
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
    this.imageUrl,
    required this.guideId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['location'] = Variable<String>(location);
    map['price'] = Variable<double>(price);
    map['rating'] = Variable<double>(rating);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['guide_id'] = Variable<int>(guideId);
    return map;
  }

  ExperiencesCompanion toCompanion(bool nullToAbsent) {
    return ExperiencesCompanion(
      id: Value(id),
      title: Value(title),
      location: Value(location),
      price: Value(price),
      rating: Value(rating),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      guideId: Value(guideId),
    );
  }

  factory Experience.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Experience(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      location: serializer.fromJson<String>(json['location']),
      price: serializer.fromJson<double>(json['price']),
      rating: serializer.fromJson<double>(json['rating']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      guideId: serializer.fromJson<int>(json['guideId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'location': serializer.toJson<String>(location),
      'price': serializer.toJson<double>(price),
      'rating': serializer.toJson<double>(rating),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'guideId': serializer.toJson<int>(guideId),
    };
  }

  Experience copyWith({
    int? id,
    String? title,
    String? location,
    double? price,
    double? rating,
    Value<String?> imageUrl = const Value.absent(),
    int? guideId,
  }) => Experience(
    id: id ?? this.id,
    title: title ?? this.title,
    location: location ?? this.location,
    price: price ?? this.price,
    rating: rating ?? this.rating,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    guideId: guideId ?? this.guideId,
  );
  Experience copyWithCompanion(ExperiencesCompanion data) {
    return Experience(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      location: data.location.present ? data.location.value : this.location,
      price: data.price.present ? data.price.value : this.price,
      rating: data.rating.present ? data.rating.value : this.rating,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      guideId: data.guideId.present ? data.guideId.value : this.guideId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Experience(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('location: $location, ')
          ..write('price: $price, ')
          ..write('rating: $rating, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('guideId: $guideId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, location, price, rating, imageUrl, guideId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Experience &&
          other.id == this.id &&
          other.title == this.title &&
          other.location == this.location &&
          other.price == this.price &&
          other.rating == this.rating &&
          other.imageUrl == this.imageUrl &&
          other.guideId == this.guideId);
}

class ExperiencesCompanion extends UpdateCompanion<Experience> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> location;
  final Value<double> price;
  final Value<double> rating;
  final Value<String?> imageUrl;
  final Value<int> guideId;
  const ExperiencesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.location = const Value.absent(),
    this.price = const Value.absent(),
    this.rating = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.guideId = const Value.absent(),
  });
  ExperiencesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String location,
    required double price,
    this.rating = const Value.absent(),
    this.imageUrl = const Value.absent(),
    required int guideId,
  }) : title = Value(title),
       location = Value(location),
       price = Value(price),
       guideId = Value(guideId);
  static Insertable<Experience> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? location,
    Expression<double>? price,
    Expression<double>? rating,
    Expression<String>? imageUrl,
    Expression<int>? guideId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (location != null) 'location': location,
      if (price != null) 'price': price,
      if (rating != null) 'rating': rating,
      if (imageUrl != null) 'image_url': imageUrl,
      if (guideId != null) 'guide_id': guideId,
    });
  }

  ExperiencesCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? location,
    Value<double>? price,
    Value<double>? rating,
    Value<String?>? imageUrl,
    Value<int>? guideId,
  }) {
    return ExperiencesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      location: location ?? this.location,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      imageUrl: imageUrl ?? this.imageUrl,
      guideId: guideId ?? this.guideId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (guideId.present) {
      map['guide_id'] = Variable<int>(guideId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExperiencesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('location: $location, ')
          ..write('price: $price, ')
          ..write('rating: $rating, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('guideId: $guideId')
          ..write(')'))
        .toString();
  }
}

class $ConversationsTable extends Conversations
    with TableInfo<$ConversationsTable, Conversation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConversationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _user1IdMeta = const VerificationMeta(
    'user1Id',
  );
  @override
  late final GeneratedColumn<int> user1Id = GeneratedColumn<int>(
    'user1_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _user2IdMeta = const VerificationMeta(
    'user2Id',
  );
  @override
  late final GeneratedColumn<int> user2Id = GeneratedColumn<int>(
    'user2_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, user1Id, user2Id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'conversations';
  @override
  VerificationContext validateIntegrity(
    Insertable<Conversation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user1_id')) {
      context.handle(
        _user1IdMeta,
        user1Id.isAcceptableOrUnknown(data['user1_id']!, _user1IdMeta),
      );
    } else if (isInserting) {
      context.missing(_user1IdMeta);
    }
    if (data.containsKey('user2_id')) {
      context.handle(
        _user2IdMeta,
        user2Id.isAcceptableOrUnknown(data['user2_id']!, _user2IdMeta),
      );
    } else if (isInserting) {
      context.missing(_user2IdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Conversation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Conversation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      user1Id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user1_id'],
      )!,
      user2Id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user2_id'],
      )!,
    );
  }

  @override
  $ConversationsTable createAlias(String alias) {
    return $ConversationsTable(attachedDatabase, alias);
  }
}

class Conversation extends DataClass implements Insertable<Conversation> {
  final int id;
  final int user1Id;
  final int user2Id;
  const Conversation({
    required this.id,
    required this.user1Id,
    required this.user2Id,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user1_id'] = Variable<int>(user1Id);
    map['user2_id'] = Variable<int>(user2Id);
    return map;
  }

  ConversationsCompanion toCompanion(bool nullToAbsent) {
    return ConversationsCompanion(
      id: Value(id),
      user1Id: Value(user1Id),
      user2Id: Value(user2Id),
    );
  }

  factory Conversation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Conversation(
      id: serializer.fromJson<int>(json['id']),
      user1Id: serializer.fromJson<int>(json['user1Id']),
      user2Id: serializer.fromJson<int>(json['user2Id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'user1Id': serializer.toJson<int>(user1Id),
      'user2Id': serializer.toJson<int>(user2Id),
    };
  }

  Conversation copyWith({int? id, int? user1Id, int? user2Id}) => Conversation(
    id: id ?? this.id,
    user1Id: user1Id ?? this.user1Id,
    user2Id: user2Id ?? this.user2Id,
  );
  Conversation copyWithCompanion(ConversationsCompanion data) {
    return Conversation(
      id: data.id.present ? data.id.value : this.id,
      user1Id: data.user1Id.present ? data.user1Id.value : this.user1Id,
      user2Id: data.user2Id.present ? data.user2Id.value : this.user2Id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Conversation(')
          ..write('id: $id, ')
          ..write('user1Id: $user1Id, ')
          ..write('user2Id: $user2Id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, user1Id, user2Id);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Conversation &&
          other.id == this.id &&
          other.user1Id == this.user1Id &&
          other.user2Id == this.user2Id);
}

class ConversationsCompanion extends UpdateCompanion<Conversation> {
  final Value<int> id;
  final Value<int> user1Id;
  final Value<int> user2Id;
  const ConversationsCompanion({
    this.id = const Value.absent(),
    this.user1Id = const Value.absent(),
    this.user2Id = const Value.absent(),
  });
  ConversationsCompanion.insert({
    this.id = const Value.absent(),
    required int user1Id,
    required int user2Id,
  }) : user1Id = Value(user1Id),
       user2Id = Value(user2Id);
  static Insertable<Conversation> custom({
    Expression<int>? id,
    Expression<int>? user1Id,
    Expression<int>? user2Id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (user1Id != null) 'user1_id': user1Id,
      if (user2Id != null) 'user2_id': user2Id,
    });
  }

  ConversationsCompanion copyWith({
    Value<int>? id,
    Value<int>? user1Id,
    Value<int>? user2Id,
  }) {
    return ConversationsCompanion(
      id: id ?? this.id,
      user1Id: user1Id ?? this.user1Id,
      user2Id: user2Id ?? this.user2Id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (user1Id.present) {
      map['user1_id'] = Variable<int>(user1Id.value);
    }
    if (user2Id.present) {
      map['user2_id'] = Variable<int>(user2Id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConversationsCompanion(')
          ..write('id: $id, ')
          ..write('user1Id: $user1Id, ')
          ..write('user2Id: $user2Id')
          ..write(')'))
        .toString();
  }
}

class $MessagesTable extends Messages with TableInfo<$MessagesTable, Message> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _conversationIdMeta = const VerificationMeta(
    'conversationId',
  );
  @override
  late final GeneratedColumn<int> conversationId = GeneratedColumn<int>(
    'conversation_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES conversations (id)',
    ),
  );
  static const VerificationMeta _senderIdMeta = const VerificationMeta(
    'senderId',
  );
  @override
  late final GeneratedColumn<int> senderId = GeneratedColumn<int>(
    'sender_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    conversationId,
    senderId,
    content,
    timestamp,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'messages';
  @override
  VerificationContext validateIntegrity(
    Insertable<Message> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('conversation_id')) {
      context.handle(
        _conversationIdMeta,
        conversationId.isAcceptableOrUnknown(
          data['conversation_id']!,
          _conversationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conversationIdMeta);
    }
    if (data.containsKey('sender_id')) {
      context.handle(
        _senderIdMeta,
        senderId.isAcceptableOrUnknown(data['sender_id']!, _senderIdMeta),
      );
    } else if (isInserting) {
      context.missing(_senderIdMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Message map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Message(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      conversationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}conversation_id'],
      )!,
      senderId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sender_id'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
    );
  }

  @override
  $MessagesTable createAlias(String alias) {
    return $MessagesTable(attachedDatabase, alias);
  }
}

class Message extends DataClass implements Insertable<Message> {
  final int id;
  final int conversationId;
  final int senderId;
  final String content;
  final DateTime timestamp;
  const Message({
    required this.id,
    required this.conversationId,
    required this.senderId,
    required this.content,
    required this.timestamp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['conversation_id'] = Variable<int>(conversationId);
    map['sender_id'] = Variable<int>(senderId);
    map['content'] = Variable<String>(content);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  MessagesCompanion toCompanion(bool nullToAbsent) {
    return MessagesCompanion(
      id: Value(id),
      conversationId: Value(conversationId),
      senderId: Value(senderId),
      content: Value(content),
      timestamp: Value(timestamp),
    );
  }

  factory Message.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Message(
      id: serializer.fromJson<int>(json['id']),
      conversationId: serializer.fromJson<int>(json['conversationId']),
      senderId: serializer.fromJson<int>(json['senderId']),
      content: serializer.fromJson<String>(json['content']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'conversationId': serializer.toJson<int>(conversationId),
      'senderId': serializer.toJson<int>(senderId),
      'content': serializer.toJson<String>(content),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  Message copyWith({
    int? id,
    int? conversationId,
    int? senderId,
    String? content,
    DateTime? timestamp,
  }) => Message(
    id: id ?? this.id,
    conversationId: conversationId ?? this.conversationId,
    senderId: senderId ?? this.senderId,
    content: content ?? this.content,
    timestamp: timestamp ?? this.timestamp,
  );
  Message copyWithCompanion(MessagesCompanion data) {
    return Message(
      id: data.id.present ? data.id.value : this.id,
      conversationId: data.conversationId.present
          ? data.conversationId.value
          : this.conversationId,
      senderId: data.senderId.present ? data.senderId.value : this.senderId,
      content: data.content.present ? data.content.value : this.content,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Message(')
          ..write('id: $id, ')
          ..write('conversationId: $conversationId, ')
          ..write('senderId: $senderId, ')
          ..write('content: $content, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, conversationId, senderId, content, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Message &&
          other.id == this.id &&
          other.conversationId == this.conversationId &&
          other.senderId == this.senderId &&
          other.content == this.content &&
          other.timestamp == this.timestamp);
}

class MessagesCompanion extends UpdateCompanion<Message> {
  final Value<int> id;
  final Value<int> conversationId;
  final Value<int> senderId;
  final Value<String> content;
  final Value<DateTime> timestamp;
  const MessagesCompanion({
    this.id = const Value.absent(),
    this.conversationId = const Value.absent(),
    this.senderId = const Value.absent(),
    this.content = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  MessagesCompanion.insert({
    this.id = const Value.absent(),
    required int conversationId,
    required int senderId,
    required String content,
    this.timestamp = const Value.absent(),
  }) : conversationId = Value(conversationId),
       senderId = Value(senderId),
       content = Value(content);
  static Insertable<Message> custom({
    Expression<int>? id,
    Expression<int>? conversationId,
    Expression<int>? senderId,
    Expression<String>? content,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (conversationId != null) 'conversation_id': conversationId,
      if (senderId != null) 'sender_id': senderId,
      if (content != null) 'content': content,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  MessagesCompanion copyWith({
    Value<int>? id,
    Value<int>? conversationId,
    Value<int>? senderId,
    Value<String>? content,
    Value<DateTime>? timestamp,
  }) {
    return MessagesCompanion(
      id: id ?? this.id,
      conversationId: conversationId ?? this.conversationId,
      senderId: senderId ?? this.senderId,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (conversationId.present) {
      map['conversation_id'] = Variable<int>(conversationId.value);
    }
    if (senderId.present) {
      map['sender_id'] = Variable<int>(senderId.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessagesCompanion(')
          ..write('id: $id, ')
          ..write('conversationId: $conversationId, ')
          ..write('senderId: $senderId, ')
          ..write('content: $content, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $NewsTable extends News with TableInfo<$NewsTable, New> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, date, imageUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'news';
  @override
  VerificationContext validateIntegrity(
    Insertable<New> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  New map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return New(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      )!,
    );
  }

  @override
  $NewsTable createAlias(String alias) {
    return $NewsTable(attachedDatabase, alias);
  }
}

class New extends DataClass implements Insertable<New> {
  final int id;
  final String title;
  final String date;
  final String imageUrl;
  const New({
    required this.id,
    required this.title,
    required this.date,
    required this.imageUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['date'] = Variable<String>(date);
    map['image_url'] = Variable<String>(imageUrl);
    return map;
  }

  NewsCompanion toCompanion(bool nullToAbsent) {
    return NewsCompanion(
      id: Value(id),
      title: Value(title),
      date: Value(date),
      imageUrl: Value(imageUrl),
    );
  }

  factory New.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return New(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      date: serializer.fromJson<String>(json['date']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'date': serializer.toJson<String>(date),
      'imageUrl': serializer.toJson<String>(imageUrl),
    };
  }

  New copyWith({int? id, String? title, String? date, String? imageUrl}) => New(
    id: id ?? this.id,
    title: title ?? this.title,
    date: date ?? this.date,
    imageUrl: imageUrl ?? this.imageUrl,
  );
  New copyWithCompanion(NewsCompanion data) {
    return New(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      date: data.date.present ? data.date.value : this.date,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('New(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('date: $date, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, date, imageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is New &&
          other.id == this.id &&
          other.title == this.title &&
          other.date == this.date &&
          other.imageUrl == this.imageUrl);
}

class NewsCompanion extends UpdateCompanion<New> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> date;
  final Value<String> imageUrl;
  const NewsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.date = const Value.absent(),
    this.imageUrl = const Value.absent(),
  });
  NewsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String date,
    required String imageUrl,
  }) : title = Value(title),
       date = Value(date),
       imageUrl = Value(imageUrl);
  static Insertable<New> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? date,
    Expression<String>? imageUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (date != null) 'date': date,
      if (imageUrl != null) 'image_url': imageUrl,
    });
  }

  NewsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? date,
    Value<String>? imageUrl,
  }) {
    return NewsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('date: $date, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $LanguagesTable languages = $LanguagesTable(this);
  late final $UserLanguagesTable userLanguages = $UserLanguagesTable(this);
  late final $FeesTable fees = $FeesTable(this);
  late final $AvailabilityTable availability = $AvailabilityTable(this);
  late final $TripsTable trips = $TripsTable(this);
  late final $GuidesTable guides = $GuidesTable(this);
  late final $ToursTable tours = $ToursTable(this);
  late final $ExperiencesTable experiences = $ExperiencesTable(this);
  late final $ConversationsTable conversations = $ConversationsTable(this);
  late final $MessagesTable messages = $MessagesTable(this);
  late final $NewsTable news = $NewsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    languages,
    userLanguages,
    fees,
    availability,
    trips,
    guides,
    tours,
    experiences,
    conversations,
    messages,
    news,
  ];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      required String username,
      required String passwordHash,
      Value<String> role,
      Value<String?> firstName,
      Value<String?> lastName,
      Value<String?> fullName,
      Value<String?> address,
      Value<String?> city,
      Value<String?> country,
      Value<String?> phone,
      Value<String?> guideLicenseUrl,
      Value<String?> identityCardUrl,
      Value<String?> avatarUrl,
      Value<String?> coverPhotoUrl,
      Value<String?> bio,
      Value<String?> videoIntroUrl,
      Value<int> reviewCount,
      Value<double> rating,
      Value<String?> activityTitle,
      Value<String?> activityImageUrl,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      Value<String> username,
      Value<String> passwordHash,
      Value<String> role,
      Value<String?> firstName,
      Value<String?> lastName,
      Value<String?> fullName,
      Value<String?> address,
      Value<String?> city,
      Value<String?> country,
      Value<String?> phone,
      Value<String?> guideLicenseUrl,
      Value<String?> identityCardUrl,
      Value<String?> avatarUrl,
      Value<String?> coverPhotoUrl,
      Value<String?> bio,
      Value<String?> videoIntroUrl,
      Value<int> reviewCount,
      Value<double> rating,
      Value<String?> activityTitle,
      Value<String?> activityImageUrl,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UserLanguagesTable, List<UserLanguage>>
  _userLanguagesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userLanguages,
    aliasName: $_aliasNameGenerator(db.users.id, db.userLanguages.userId),
  );

  $$UserLanguagesTableProcessedTableManager get userLanguagesRefs {
    final manager = $$UserLanguagesTableTableManager(
      $_db,
      $_db.userLanguages,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_userLanguagesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$FeesTable, List<Fee>> _feesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.fees,
    aliasName: $_aliasNameGenerator(db.users.id, db.fees.userId),
  );

  $$FeesTableProcessedTableManager get feesRefs {
    final manager = $$FeesTableTableManager(
      $_db,
      $_db.fees,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_feesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AvailabilityTable, List<AvailabilityData>>
  _availabilityRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.availability,
    aliasName: $_aliasNameGenerator(db.users.id, db.availability.userId),
  );

  $$AvailabilityTableProcessedTableManager get availabilityRefs {
    final manager = $$AvailabilityTableTableManager(
      $_db,
      $_db.availability,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_availabilityRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ExperiencesTable, List<Experience>>
  _experiencesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.experiences,
    aliasName: $_aliasNameGenerator(db.users.id, db.experiences.guideId),
  );

  $$ExperiencesTableProcessedTableManager get experiencesRefs {
    final manager = $$ExperiencesTableTableManager(
      $_db,
      $_db.experiences,
    ).filter((f) => f.guideId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_experiencesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ConversationsTable, List<Conversation>>
  _startedConversationsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.conversations,
    aliasName: $_aliasNameGenerator(db.users.id, db.conversations.user1Id),
  );

  $$ConversationsTableProcessedTableManager get startedConversations {
    final manager = $$ConversationsTableTableManager(
      $_db,
      $_db.conversations,
    ).filter((f) => f.user1Id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _startedConversationsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ConversationsTable, List<Conversation>>
  _receivedConversationsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.conversations,
        aliasName: $_aliasNameGenerator(db.users.id, db.conversations.user2Id),
      );

  $$ConversationsTableProcessedTableManager get receivedConversations {
    final manager = $$ConversationsTableTableManager(
      $_db,
      $_db.conversations,
    ).filter((f) => f.user2Id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _receivedConversationsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MessagesTable, List<Message>> _messagesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.messages,
    aliasName: $_aliasNameGenerator(db.users.id, db.messages.senderId),
  );

  $$MessagesTableProcessedTableManager get messagesRefs {
    final manager = $$MessagesTableTableManager(
      $_db,
      $_db.messages,
    ).filter((f) => f.senderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_messagesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get guideLicenseUrl => $composableBuilder(
    column: $table.guideLicenseUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get identityCardUrl => $composableBuilder(
    column: $table.identityCardUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get avatarUrl => $composableBuilder(
    column: $table.avatarUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverPhotoUrl => $composableBuilder(
    column: $table.coverPhotoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bio => $composableBuilder(
    column: $table.bio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get videoIntroUrl => $composableBuilder(
    column: $table.videoIntroUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reviewCount => $composableBuilder(
    column: $table.reviewCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get activityTitle => $composableBuilder(
    column: $table.activityTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get activityImageUrl => $composableBuilder(
    column: $table.activityImageUrl,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> userLanguagesRefs(
    Expression<bool> Function($$UserLanguagesTableFilterComposer f) f,
  ) {
    final $$UserLanguagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userLanguages,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserLanguagesTableFilterComposer(
            $db: $db,
            $table: $db.userLanguages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> feesRefs(
    Expression<bool> Function($$FeesTableFilterComposer f) f,
  ) {
    final $$FeesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.fees,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FeesTableFilterComposer(
            $db: $db,
            $table: $db.fees,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> availabilityRefs(
    Expression<bool> Function($$AvailabilityTableFilterComposer f) f,
  ) {
    final $$AvailabilityTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.availability,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AvailabilityTableFilterComposer(
            $db: $db,
            $table: $db.availability,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> experiencesRefs(
    Expression<bool> Function($$ExperiencesTableFilterComposer f) f,
  ) {
    final $$ExperiencesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.experiences,
      getReferencedColumn: (t) => t.guideId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExperiencesTableFilterComposer(
            $db: $db,
            $table: $db.experiences,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> startedConversations(
    Expression<bool> Function($$ConversationsTableFilterComposer f) f,
  ) {
    final $$ConversationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.conversations,
      getReferencedColumn: (t) => t.user1Id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConversationsTableFilterComposer(
            $db: $db,
            $table: $db.conversations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> receivedConversations(
    Expression<bool> Function($$ConversationsTableFilterComposer f) f,
  ) {
    final $$ConversationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.conversations,
      getReferencedColumn: (t) => t.user2Id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConversationsTableFilterComposer(
            $db: $db,
            $table: $db.conversations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> messagesRefs(
    Expression<bool> Function($$MessagesTableFilterComposer f) f,
  ) {
    final $$MessagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.messages,
      getReferencedColumn: (t) => t.senderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessagesTableFilterComposer(
            $db: $db,
            $table: $db.messages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get guideLicenseUrl => $composableBuilder(
    column: $table.guideLicenseUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get identityCardUrl => $composableBuilder(
    column: $table.identityCardUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get avatarUrl => $composableBuilder(
    column: $table.avatarUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverPhotoUrl => $composableBuilder(
    column: $table.coverPhotoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bio => $composableBuilder(
    column: $table.bio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get videoIntroUrl => $composableBuilder(
    column: $table.videoIntroUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reviewCount => $composableBuilder(
    column: $table.reviewCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activityTitle => $composableBuilder(
    column: $table.activityTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activityImageUrl => $composableBuilder(
    column: $table.activityImageUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => column,
  );

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get guideLicenseUrl => $composableBuilder(
    column: $table.guideLicenseUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get identityCardUrl => $composableBuilder(
    column: $table.identityCardUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get avatarUrl =>
      $composableBuilder(column: $table.avatarUrl, builder: (column) => column);

  GeneratedColumn<String> get coverPhotoUrl => $composableBuilder(
    column: $table.coverPhotoUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bio =>
      $composableBuilder(column: $table.bio, builder: (column) => column);

  GeneratedColumn<String> get videoIntroUrl => $composableBuilder(
    column: $table.videoIntroUrl,
    builder: (column) => column,
  );

  GeneratedColumn<int> get reviewCount => $composableBuilder(
    column: $table.reviewCount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<String> get activityTitle => $composableBuilder(
    column: $table.activityTitle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get activityImageUrl => $composableBuilder(
    column: $table.activityImageUrl,
    builder: (column) => column,
  );

  Expression<T> userLanguagesRefs<T extends Object>(
    Expression<T> Function($$UserLanguagesTableAnnotationComposer a) f,
  ) {
    final $$UserLanguagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userLanguages,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserLanguagesTableAnnotationComposer(
            $db: $db,
            $table: $db.userLanguages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> feesRefs<T extends Object>(
    Expression<T> Function($$FeesTableAnnotationComposer a) f,
  ) {
    final $$FeesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.fees,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FeesTableAnnotationComposer(
            $db: $db,
            $table: $db.fees,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> availabilityRefs<T extends Object>(
    Expression<T> Function($$AvailabilityTableAnnotationComposer a) f,
  ) {
    final $$AvailabilityTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.availability,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AvailabilityTableAnnotationComposer(
            $db: $db,
            $table: $db.availability,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> experiencesRefs<T extends Object>(
    Expression<T> Function($$ExperiencesTableAnnotationComposer a) f,
  ) {
    final $$ExperiencesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.experiences,
      getReferencedColumn: (t) => t.guideId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExperiencesTableAnnotationComposer(
            $db: $db,
            $table: $db.experiences,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> startedConversations<T extends Object>(
    Expression<T> Function($$ConversationsTableAnnotationComposer a) f,
  ) {
    final $$ConversationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.conversations,
      getReferencedColumn: (t) => t.user1Id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConversationsTableAnnotationComposer(
            $db: $db,
            $table: $db.conversations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> receivedConversations<T extends Object>(
    Expression<T> Function($$ConversationsTableAnnotationComposer a) f,
  ) {
    final $$ConversationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.conversations,
      getReferencedColumn: (t) => t.user2Id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConversationsTableAnnotationComposer(
            $db: $db,
            $table: $db.conversations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> messagesRefs<T extends Object>(
    Expression<T> Function($$MessagesTableAnnotationComposer a) f,
  ) {
    final $$MessagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.messages,
      getReferencedColumn: (t) => t.senderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessagesTableAnnotationComposer(
            $db: $db,
            $table: $db.messages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, $$UsersTableReferences),
          User,
          PrefetchHooks Function({
            bool userLanguagesRefs,
            bool feesRefs,
            bool availabilityRefs,
            bool experiencesRefs,
            bool startedConversations,
            bool receivedConversations,
            bool messagesRefs,
          })
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String> passwordHash = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<String?> firstName = const Value.absent(),
                Value<String?> lastName = const Value.absent(),
                Value<String?> fullName = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> guideLicenseUrl = const Value.absent(),
                Value<String?> identityCardUrl = const Value.absent(),
                Value<String?> avatarUrl = const Value.absent(),
                Value<String?> coverPhotoUrl = const Value.absent(),
                Value<String?> bio = const Value.absent(),
                Value<String?> videoIntroUrl = const Value.absent(),
                Value<int> reviewCount = const Value.absent(),
                Value<double> rating = const Value.absent(),
                Value<String?> activityTitle = const Value.absent(),
                Value<String?> activityImageUrl = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                username: username,
                passwordHash: passwordHash,
                role: role,
                firstName: firstName,
                lastName: lastName,
                fullName: fullName,
                address: address,
                city: city,
                country: country,
                phone: phone,
                guideLicenseUrl: guideLicenseUrl,
                identityCardUrl: identityCardUrl,
                avatarUrl: avatarUrl,
                coverPhotoUrl: coverPhotoUrl,
                bio: bio,
                videoIntroUrl: videoIntroUrl,
                reviewCount: reviewCount,
                rating: rating,
                activityTitle: activityTitle,
                activityImageUrl: activityImageUrl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String username,
                required String passwordHash,
                Value<String> role = const Value.absent(),
                Value<String?> firstName = const Value.absent(),
                Value<String?> lastName = const Value.absent(),
                Value<String?> fullName = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> guideLicenseUrl = const Value.absent(),
                Value<String?> identityCardUrl = const Value.absent(),
                Value<String?> avatarUrl = const Value.absent(),
                Value<String?> coverPhotoUrl = const Value.absent(),
                Value<String?> bio = const Value.absent(),
                Value<String?> videoIntroUrl = const Value.absent(),
                Value<int> reviewCount = const Value.absent(),
                Value<double> rating = const Value.absent(),
                Value<String?> activityTitle = const Value.absent(),
                Value<String?> activityImageUrl = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                username: username,
                passwordHash: passwordHash,
                role: role,
                firstName: firstName,
                lastName: lastName,
                fullName: fullName,
                address: address,
                city: city,
                country: country,
                phone: phone,
                guideLicenseUrl: guideLicenseUrl,
                identityCardUrl: identityCardUrl,
                avatarUrl: avatarUrl,
                coverPhotoUrl: coverPhotoUrl,
                bio: bio,
                videoIntroUrl: videoIntroUrl,
                reviewCount: reviewCount,
                rating: rating,
                activityTitle: activityTitle,
                activityImageUrl: activityImageUrl,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                userLanguagesRefs = false,
                feesRefs = false,
                availabilityRefs = false,
                experiencesRefs = false,
                startedConversations = false,
                receivedConversations = false,
                messagesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (userLanguagesRefs) db.userLanguages,
                    if (feesRefs) db.fees,
                    if (availabilityRefs) db.availability,
                    if (experiencesRefs) db.experiences,
                    if (startedConversations) db.conversations,
                    if (receivedConversations) db.conversations,
                    if (messagesRefs) db.messages,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (userLanguagesRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          UserLanguage
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._userLanguagesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).userLanguagesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (feesRefs)
                        await $_getPrefetchedData<User, $UsersTable, Fee>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._feesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(db, table, p0).feesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (availabilityRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          AvailabilityData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._availabilityRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).availabilityRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (experiencesRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          Experience
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._experiencesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).experiencesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.guideId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (startedConversations)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          Conversation
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._startedConversationsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).startedConversations,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.user1Id == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (receivedConversations)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          Conversation
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._receivedConversationsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).receivedConversations,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.user2Id == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (messagesRefs)
                        await $_getPrefetchedData<User, $UsersTable, Message>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._messagesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).messagesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.senderId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, $$UsersTableReferences),
      User,
      PrefetchHooks Function({
        bool userLanguagesRefs,
        bool feesRefs,
        bool availabilityRefs,
        bool experiencesRefs,
        bool startedConversations,
        bool receivedConversations,
        bool messagesRefs,
      })
    >;
typedef $$LanguagesTableCreateCompanionBuilder =
    LanguagesCompanion Function({Value<int> id, required String name});
typedef $$LanguagesTableUpdateCompanionBuilder =
    LanguagesCompanion Function({Value<int> id, Value<String> name});

final class $$LanguagesTableReferences
    extends BaseReferences<_$AppDatabase, $LanguagesTable, Language> {
  $$LanguagesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UserLanguagesTable, List<UserLanguage>>
  _userLanguagesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userLanguages,
    aliasName: $_aliasNameGenerator(
      db.languages.id,
      db.userLanguages.languageId,
    ),
  );

  $$UserLanguagesTableProcessedTableManager get userLanguagesRefs {
    final manager = $$UserLanguagesTableTableManager(
      $_db,
      $_db.userLanguages,
    ).filter((f) => f.languageId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_userLanguagesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LanguagesTableFilterComposer
    extends Composer<_$AppDatabase, $LanguagesTable> {
  $$LanguagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> userLanguagesRefs(
    Expression<bool> Function($$UserLanguagesTableFilterComposer f) f,
  ) {
    final $$UserLanguagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userLanguages,
      getReferencedColumn: (t) => t.languageId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserLanguagesTableFilterComposer(
            $db: $db,
            $table: $db.userLanguages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LanguagesTableOrderingComposer
    extends Composer<_$AppDatabase, $LanguagesTable> {
  $$LanguagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LanguagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LanguagesTable> {
  $$LanguagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> userLanguagesRefs<T extends Object>(
    Expression<T> Function($$UserLanguagesTableAnnotationComposer a) f,
  ) {
    final $$UserLanguagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userLanguages,
      getReferencedColumn: (t) => t.languageId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserLanguagesTableAnnotationComposer(
            $db: $db,
            $table: $db.userLanguages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LanguagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LanguagesTable,
          Language,
          $$LanguagesTableFilterComposer,
          $$LanguagesTableOrderingComposer,
          $$LanguagesTableAnnotationComposer,
          $$LanguagesTableCreateCompanionBuilder,
          $$LanguagesTableUpdateCompanionBuilder,
          (Language, $$LanguagesTableReferences),
          Language,
          PrefetchHooks Function({bool userLanguagesRefs})
        > {
  $$LanguagesTableTableManager(_$AppDatabase db, $LanguagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LanguagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LanguagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LanguagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => LanguagesCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  LanguagesCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LanguagesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userLanguagesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (userLanguagesRefs) db.userLanguages,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (userLanguagesRefs)
                    await $_getPrefetchedData<
                      Language,
                      $LanguagesTable,
                      UserLanguage
                    >(
                      currentTable: table,
                      referencedTable: $$LanguagesTableReferences
                          ._userLanguagesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$LanguagesTableReferences(
                            db,
                            table,
                            p0,
                          ).userLanguagesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.languageId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$LanguagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LanguagesTable,
      Language,
      $$LanguagesTableFilterComposer,
      $$LanguagesTableOrderingComposer,
      $$LanguagesTableAnnotationComposer,
      $$LanguagesTableCreateCompanionBuilder,
      $$LanguagesTableUpdateCompanionBuilder,
      (Language, $$LanguagesTableReferences),
      Language,
      PrefetchHooks Function({bool userLanguagesRefs})
    >;
typedef $$UserLanguagesTableCreateCompanionBuilder =
    UserLanguagesCompanion Function({
      required int userId,
      required int languageId,
      Value<int> rowid,
    });
typedef $$UserLanguagesTableUpdateCompanionBuilder =
    UserLanguagesCompanion Function({
      Value<int> userId,
      Value<int> languageId,
      Value<int> rowid,
    });

final class $$UserLanguagesTableReferences
    extends BaseReferences<_$AppDatabase, $UserLanguagesTable, UserLanguage> {
  $$UserLanguagesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.userLanguages.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LanguagesTable _languageIdTable(_$AppDatabase db) =>
      db.languages.createAlias(
        $_aliasNameGenerator(db.userLanguages.languageId, db.languages.id),
      );

  $$LanguagesTableProcessedTableManager get languageId {
    final $_column = $_itemColumn<int>('language_id')!;

    final manager = $$LanguagesTableTableManager(
      $_db,
      $_db.languages,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_languageIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UserLanguagesTableFilterComposer
    extends Composer<_$AppDatabase, $UserLanguagesTable> {
  $$UserLanguagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LanguagesTableFilterComposer get languageId {
    final $$LanguagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.languageId,
      referencedTable: $db.languages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LanguagesTableFilterComposer(
            $db: $db,
            $table: $db.languages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserLanguagesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserLanguagesTable> {
  $$UserLanguagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LanguagesTableOrderingComposer get languageId {
    final $$LanguagesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.languageId,
      referencedTable: $db.languages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LanguagesTableOrderingComposer(
            $db: $db,
            $table: $db.languages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserLanguagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserLanguagesTable> {
  $$UserLanguagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LanguagesTableAnnotationComposer get languageId {
    final $$LanguagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.languageId,
      referencedTable: $db.languages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LanguagesTableAnnotationComposer(
            $db: $db,
            $table: $db.languages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserLanguagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserLanguagesTable,
          UserLanguage,
          $$UserLanguagesTableFilterComposer,
          $$UserLanguagesTableOrderingComposer,
          $$UserLanguagesTableAnnotationComposer,
          $$UserLanguagesTableCreateCompanionBuilder,
          $$UserLanguagesTableUpdateCompanionBuilder,
          (UserLanguage, $$UserLanguagesTableReferences),
          UserLanguage,
          PrefetchHooks Function({bool userId, bool languageId})
        > {
  $$UserLanguagesTableTableManager(_$AppDatabase db, $UserLanguagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserLanguagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserLanguagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserLanguagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> userId = const Value.absent(),
                Value<int> languageId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserLanguagesCompanion(
                userId: userId,
                languageId: languageId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int userId,
                required int languageId,
                Value<int> rowid = const Value.absent(),
              }) => UserLanguagesCompanion.insert(
                userId: userId,
                languageId: languageId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserLanguagesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false, languageId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$UserLanguagesTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$UserLanguagesTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (languageId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.languageId,
                                referencedTable: $$UserLanguagesTableReferences
                                    ._languageIdTable(db),
                                referencedColumn: $$UserLanguagesTableReferences
                                    ._languageIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UserLanguagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserLanguagesTable,
      UserLanguage,
      $$UserLanguagesTableFilterComposer,
      $$UserLanguagesTableOrderingComposer,
      $$UserLanguagesTableAnnotationComposer,
      $$UserLanguagesTableCreateCompanionBuilder,
      $$UserLanguagesTableUpdateCompanionBuilder,
      (UserLanguage, $$UserLanguagesTableReferences),
      UserLanguage,
      PrefetchHooks Function({bool userId, bool languageId})
    >;
typedef $$FeesTableCreateCompanionBuilder =
    FeesCompanion Function({
      Value<int> id,
      required int userId,
      required int minTravelers,
      required int maxTravelers,
      required double price,
    });
typedef $$FeesTableUpdateCompanionBuilder =
    FeesCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<int> minTravelers,
      Value<int> maxTravelers,
      Value<double> price,
    });

final class $$FeesTableReferences
    extends BaseReferences<_$AppDatabase, $FeesTable, Fee> {
  $$FeesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias($_aliasNameGenerator(db.fees.userId, db.users.id));

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FeesTableFilterComposer extends Composer<_$AppDatabase, $FeesTable> {
  $$FeesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minTravelers => $composableBuilder(
    column: $table.minTravelers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxTravelers => $composableBuilder(
    column: $table.maxTravelers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FeesTableOrderingComposer extends Composer<_$AppDatabase, $FeesTable> {
  $$FeesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minTravelers => $composableBuilder(
    column: $table.minTravelers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxTravelers => $composableBuilder(
    column: $table.maxTravelers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FeesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FeesTable> {
  $$FeesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get minTravelers => $composableBuilder(
    column: $table.minTravelers,
    builder: (column) => column,
  );

  GeneratedColumn<int> get maxTravelers => $composableBuilder(
    column: $table.maxTravelers,
    builder: (column) => column,
  );

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FeesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FeesTable,
          Fee,
          $$FeesTableFilterComposer,
          $$FeesTableOrderingComposer,
          $$FeesTableAnnotationComposer,
          $$FeesTableCreateCompanionBuilder,
          $$FeesTableUpdateCompanionBuilder,
          (Fee, $$FeesTableReferences),
          Fee,
          PrefetchHooks Function({bool userId})
        > {
  $$FeesTableTableManager(_$AppDatabase db, $FeesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FeesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FeesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FeesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<int> minTravelers = const Value.absent(),
                Value<int> maxTravelers = const Value.absent(),
                Value<double> price = const Value.absent(),
              }) => FeesCompanion(
                id: id,
                userId: userId,
                minTravelers: minTravelers,
                maxTravelers: maxTravelers,
                price: price,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required int minTravelers,
                required int maxTravelers,
                required double price,
              }) => FeesCompanion.insert(
                id: id,
                userId: userId,
                minTravelers: minTravelers,
                maxTravelers: maxTravelers,
                price: price,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$FeesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$FeesTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$FeesTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FeesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FeesTable,
      Fee,
      $$FeesTableFilterComposer,
      $$FeesTableOrderingComposer,
      $$FeesTableAnnotationComposer,
      $$FeesTableCreateCompanionBuilder,
      $$FeesTableUpdateCompanionBuilder,
      (Fee, $$FeesTableReferences),
      Fee,
      PrefetchHooks Function({bool userId})
    >;
typedef $$AvailabilityTableCreateCompanionBuilder =
    AvailabilityCompanion Function({
      Value<int> id,
      required int userId,
      required String dayOfWeek,
      required String fromTime,
      required String toTime,
    });
typedef $$AvailabilityTableUpdateCompanionBuilder =
    AvailabilityCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<String> dayOfWeek,
      Value<String> fromTime,
      Value<String> toTime,
    });

final class $$AvailabilityTableReferences
    extends
        BaseReferences<_$AppDatabase, $AvailabilityTable, AvailabilityData> {
  $$AvailabilityTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.availability.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AvailabilityTableFilterComposer
    extends Composer<_$AppDatabase, $AvailabilityTable> {
  $$AvailabilityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fromTime => $composableBuilder(
    column: $table.fromTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get toTime => $composableBuilder(
    column: $table.toTime,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AvailabilityTableOrderingComposer
    extends Composer<_$AppDatabase, $AvailabilityTable> {
  $$AvailabilityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fromTime => $composableBuilder(
    column: $table.fromTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get toTime => $composableBuilder(
    column: $table.toTime,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AvailabilityTableAnnotationComposer
    extends Composer<_$AppDatabase, $AvailabilityTable> {
  $$AvailabilityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get dayOfWeek =>
      $composableBuilder(column: $table.dayOfWeek, builder: (column) => column);

  GeneratedColumn<String> get fromTime =>
      $composableBuilder(column: $table.fromTime, builder: (column) => column);

  GeneratedColumn<String> get toTime =>
      $composableBuilder(column: $table.toTime, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AvailabilityTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AvailabilityTable,
          AvailabilityData,
          $$AvailabilityTableFilterComposer,
          $$AvailabilityTableOrderingComposer,
          $$AvailabilityTableAnnotationComposer,
          $$AvailabilityTableCreateCompanionBuilder,
          $$AvailabilityTableUpdateCompanionBuilder,
          (AvailabilityData, $$AvailabilityTableReferences),
          AvailabilityData,
          PrefetchHooks Function({bool userId})
        > {
  $$AvailabilityTableTableManager(_$AppDatabase db, $AvailabilityTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AvailabilityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AvailabilityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AvailabilityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<String> dayOfWeek = const Value.absent(),
                Value<String> fromTime = const Value.absent(),
                Value<String> toTime = const Value.absent(),
              }) => AvailabilityCompanion(
                id: id,
                userId: userId,
                dayOfWeek: dayOfWeek,
                fromTime: fromTime,
                toTime: toTime,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required String dayOfWeek,
                required String fromTime,
                required String toTime,
              }) => AvailabilityCompanion.insert(
                id: id,
                userId: userId,
                dayOfWeek: dayOfWeek,
                fromTime: fromTime,
                toTime: toTime,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AvailabilityTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$AvailabilityTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$AvailabilityTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AvailabilityTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AvailabilityTable,
      AvailabilityData,
      $$AvailabilityTableFilterComposer,
      $$AvailabilityTableOrderingComposer,
      $$AvailabilityTableAnnotationComposer,
      $$AvailabilityTableCreateCompanionBuilder,
      $$AvailabilityTableUpdateCompanionBuilder,
      (AvailabilityData, $$AvailabilityTableReferences),
      AvailabilityData,
      PrefetchHooks Function({bool userId})
    >;
typedef $$TripsTableCreateCompanionBuilder =
    TripsCompanion Function({
      Value<int> id,
      required int userId,
      required String title,
      required String destination,
      Value<DateTime?> startDate,
      Value<DateTime?> endDate,
      required String status,
      Value<String?> imageUrl,
      Value<int?> guideId,
    });
typedef $$TripsTableUpdateCompanionBuilder =
    TripsCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<String> title,
      Value<String> destination,
      Value<DateTime?> startDate,
      Value<DateTime?> endDate,
      Value<String> status,
      Value<String?> imageUrl,
      Value<int?> guideId,
    });

final class $$TripsTableReferences
    extends BaseReferences<_$AppDatabase, $TripsTable, Trip> {
  $$TripsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias($_aliasNameGenerator(db.trips.userId, db.users.id));

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _guideIdTable(_$AppDatabase db) =>
      db.users.createAlias($_aliasNameGenerator(db.trips.guideId, db.users.id));

  $$UsersTableProcessedTableManager? get guideId {
    final $_column = $_itemColumn<int>('guide_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_guideIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TripsTableFilterComposer extends Composer<_$AppDatabase, $TripsTable> {
  $$TripsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get destination => $composableBuilder(
    column: $table.destination,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableFilterComposer get guideId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.guideId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TripsTableOrderingComposer
    extends Composer<_$AppDatabase, $TripsTable> {
  $$TripsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get destination => $composableBuilder(
    column: $table.destination,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableOrderingComposer get guideId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.guideId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TripsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TripsTable> {
  $$TripsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get destination => $composableBuilder(
    column: $table.destination,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableAnnotationComposer get guideId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.guideId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TripsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TripsTable,
          Trip,
          $$TripsTableFilterComposer,
          $$TripsTableOrderingComposer,
          $$TripsTableAnnotationComposer,
          $$TripsTableCreateCompanionBuilder,
          $$TripsTableUpdateCompanionBuilder,
          (Trip, $$TripsTableReferences),
          Trip,
          PrefetchHooks Function({bool userId, bool guideId})
        > {
  $$TripsTableTableManager(_$AppDatabase db, $TripsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TripsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TripsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TripsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> destination = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<int?> guideId = const Value.absent(),
              }) => TripsCompanion(
                id: id,
                userId: userId,
                title: title,
                destination: destination,
                startDate: startDate,
                endDate: endDate,
                status: status,
                imageUrl: imageUrl,
                guideId: guideId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required String title,
                required String destination,
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                required String status,
                Value<String?> imageUrl = const Value.absent(),
                Value<int?> guideId = const Value.absent(),
              }) => TripsCompanion.insert(
                id: id,
                userId: userId,
                title: title,
                destination: destination,
                startDate: startDate,
                endDate: endDate,
                status: status,
                imageUrl: imageUrl,
                guideId: guideId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$TripsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false, guideId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$TripsTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$TripsTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (guideId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.guideId,
                                referencedTable: $$TripsTableReferences
                                    ._guideIdTable(db),
                                referencedColumn: $$TripsTableReferences
                                    ._guideIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TripsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TripsTable,
      Trip,
      $$TripsTableFilterComposer,
      $$TripsTableOrderingComposer,
      $$TripsTableAnnotationComposer,
      $$TripsTableCreateCompanionBuilder,
      $$TripsTableUpdateCompanionBuilder,
      (Trip, $$TripsTableReferences),
      Trip,
      PrefetchHooks Function({bool userId, bool guideId})
    >;
typedef $$GuidesTableCreateCompanionBuilder =
    GuidesCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> avatarUrl,
      required String location,
      Value<double> rating,
      Value<int> reviewCount,
    });
typedef $$GuidesTableUpdateCompanionBuilder =
    GuidesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> avatarUrl,
      Value<String> location,
      Value<double> rating,
      Value<int> reviewCount,
    });

class $$GuidesTableFilterComposer
    extends Composer<_$AppDatabase, $GuidesTable> {
  $$GuidesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get avatarUrl => $composableBuilder(
    column: $table.avatarUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reviewCount => $composableBuilder(
    column: $table.reviewCount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GuidesTableOrderingComposer
    extends Composer<_$AppDatabase, $GuidesTable> {
  $$GuidesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get avatarUrl => $composableBuilder(
    column: $table.avatarUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reviewCount => $composableBuilder(
    column: $table.reviewCount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GuidesTableAnnotationComposer
    extends Composer<_$AppDatabase, $GuidesTable> {
  $$GuidesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get avatarUrl =>
      $composableBuilder(column: $table.avatarUrl, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<int> get reviewCount => $composableBuilder(
    column: $table.reviewCount,
    builder: (column) => column,
  );
}

class $$GuidesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GuidesTable,
          Guide,
          $$GuidesTableFilterComposer,
          $$GuidesTableOrderingComposer,
          $$GuidesTableAnnotationComposer,
          $$GuidesTableCreateCompanionBuilder,
          $$GuidesTableUpdateCompanionBuilder,
          (Guide, BaseReferences<_$AppDatabase, $GuidesTable, Guide>),
          Guide,
          PrefetchHooks Function()
        > {
  $$GuidesTableTableManager(_$AppDatabase db, $GuidesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GuidesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GuidesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GuidesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> avatarUrl = const Value.absent(),
                Value<String> location = const Value.absent(),
                Value<double> rating = const Value.absent(),
                Value<int> reviewCount = const Value.absent(),
              }) => GuidesCompanion(
                id: id,
                name: name,
                avatarUrl: avatarUrl,
                location: location,
                rating: rating,
                reviewCount: reviewCount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> avatarUrl = const Value.absent(),
                required String location,
                Value<double> rating = const Value.absent(),
                Value<int> reviewCount = const Value.absent(),
              }) => GuidesCompanion.insert(
                id: id,
                name: name,
                avatarUrl: avatarUrl,
                location: location,
                rating: rating,
                reviewCount: reviewCount,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GuidesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GuidesTable,
      Guide,
      $$GuidesTableFilterComposer,
      $$GuidesTableOrderingComposer,
      $$GuidesTableAnnotationComposer,
      $$GuidesTableCreateCompanionBuilder,
      $$GuidesTableUpdateCompanionBuilder,
      (Guide, BaseReferences<_$AppDatabase, $GuidesTable, Guide>),
      Guide,
      PrefetchHooks Function()
    >;
typedef $$ToursTableCreateCompanionBuilder =
    ToursCompanion Function({
      Value<int> id,
      required String title,
      required String location,
      required double price,
      Value<double> rating,
      Value<String?> imageUrl,
      Value<String?> date,
      Value<String?> duration,
      Value<int> likes,
    });
typedef $$ToursTableUpdateCompanionBuilder =
    ToursCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> location,
      Value<double> price,
      Value<double> rating,
      Value<String?> imageUrl,
      Value<String?> date,
      Value<String?> duration,
      Value<int> likes,
    });

class $$ToursTableFilterComposer extends Composer<_$AppDatabase, $ToursTable> {
  $$ToursTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get likes => $composableBuilder(
    column: $table.likes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ToursTableOrderingComposer
    extends Composer<_$AppDatabase, $ToursTable> {
  $$ToursTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get likes => $composableBuilder(
    column: $table.likes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ToursTableAnnotationComposer
    extends Composer<_$AppDatabase, $ToursTable> {
  $$ToursTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<int> get likes =>
      $composableBuilder(column: $table.likes, builder: (column) => column);
}

class $$ToursTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ToursTable,
          Tour,
          $$ToursTableFilterComposer,
          $$ToursTableOrderingComposer,
          $$ToursTableAnnotationComposer,
          $$ToursTableCreateCompanionBuilder,
          $$ToursTableUpdateCompanionBuilder,
          (Tour, BaseReferences<_$AppDatabase, $ToursTable, Tour>),
          Tour,
          PrefetchHooks Function()
        > {
  $$ToursTableTableManager(_$AppDatabase db, $ToursTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ToursTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ToursTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ToursTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> location = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<double> rating = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> date = const Value.absent(),
                Value<String?> duration = const Value.absent(),
                Value<int> likes = const Value.absent(),
              }) => ToursCompanion(
                id: id,
                title: title,
                location: location,
                price: price,
                rating: rating,
                imageUrl: imageUrl,
                date: date,
                duration: duration,
                likes: likes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String location,
                required double price,
                Value<double> rating = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> date = const Value.absent(),
                Value<String?> duration = const Value.absent(),
                Value<int> likes = const Value.absent(),
              }) => ToursCompanion.insert(
                id: id,
                title: title,
                location: location,
                price: price,
                rating: rating,
                imageUrl: imageUrl,
                date: date,
                duration: duration,
                likes: likes,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ToursTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ToursTable,
      Tour,
      $$ToursTableFilterComposer,
      $$ToursTableOrderingComposer,
      $$ToursTableAnnotationComposer,
      $$ToursTableCreateCompanionBuilder,
      $$ToursTableUpdateCompanionBuilder,
      (Tour, BaseReferences<_$AppDatabase, $ToursTable, Tour>),
      Tour,
      PrefetchHooks Function()
    >;
typedef $$ExperiencesTableCreateCompanionBuilder =
    ExperiencesCompanion Function({
      Value<int> id,
      required String title,
      required String location,
      required double price,
      Value<double> rating,
      Value<String?> imageUrl,
      required int guideId,
    });
typedef $$ExperiencesTableUpdateCompanionBuilder =
    ExperiencesCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> location,
      Value<double> price,
      Value<double> rating,
      Value<String?> imageUrl,
      Value<int> guideId,
    });

final class $$ExperiencesTableReferences
    extends BaseReferences<_$AppDatabase, $ExperiencesTable, Experience> {
  $$ExperiencesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _guideIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.experiences.guideId, db.users.id),
  );

  $$UsersTableProcessedTableManager get guideId {
    final $_column = $_itemColumn<int>('guide_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_guideIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ExperiencesTableFilterComposer
    extends Composer<_$AppDatabase, $ExperiencesTable> {
  $$ExperiencesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get guideId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.guideId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExperiencesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExperiencesTable> {
  $$ExperiencesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get guideId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.guideId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExperiencesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExperiencesTable> {
  $$ExperiencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  $$UsersTableAnnotationComposer get guideId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.guideId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExperiencesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExperiencesTable,
          Experience,
          $$ExperiencesTableFilterComposer,
          $$ExperiencesTableOrderingComposer,
          $$ExperiencesTableAnnotationComposer,
          $$ExperiencesTableCreateCompanionBuilder,
          $$ExperiencesTableUpdateCompanionBuilder,
          (Experience, $$ExperiencesTableReferences),
          Experience,
          PrefetchHooks Function({bool guideId})
        > {
  $$ExperiencesTableTableManager(_$AppDatabase db, $ExperiencesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExperiencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExperiencesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExperiencesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> location = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<double> rating = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<int> guideId = const Value.absent(),
              }) => ExperiencesCompanion(
                id: id,
                title: title,
                location: location,
                price: price,
                rating: rating,
                imageUrl: imageUrl,
                guideId: guideId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String location,
                required double price,
                Value<double> rating = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                required int guideId,
              }) => ExperiencesCompanion.insert(
                id: id,
                title: title,
                location: location,
                price: price,
                rating: rating,
                imageUrl: imageUrl,
                guideId: guideId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ExperiencesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({guideId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (guideId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.guideId,
                                referencedTable: $$ExperiencesTableReferences
                                    ._guideIdTable(db),
                                referencedColumn: $$ExperiencesTableReferences
                                    ._guideIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ExperiencesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExperiencesTable,
      Experience,
      $$ExperiencesTableFilterComposer,
      $$ExperiencesTableOrderingComposer,
      $$ExperiencesTableAnnotationComposer,
      $$ExperiencesTableCreateCompanionBuilder,
      $$ExperiencesTableUpdateCompanionBuilder,
      (Experience, $$ExperiencesTableReferences),
      Experience,
      PrefetchHooks Function({bool guideId})
    >;
typedef $$ConversationsTableCreateCompanionBuilder =
    ConversationsCompanion Function({
      Value<int> id,
      required int user1Id,
      required int user2Id,
    });
typedef $$ConversationsTableUpdateCompanionBuilder =
    ConversationsCompanion Function({
      Value<int> id,
      Value<int> user1Id,
      Value<int> user2Id,
    });

final class $$ConversationsTableReferences
    extends BaseReferences<_$AppDatabase, $ConversationsTable, Conversation> {
  $$ConversationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _user1IdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.conversations.user1Id, db.users.id),
  );

  $$UsersTableProcessedTableManager get user1Id {
    final $_column = $_itemColumn<int>('user1_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_user1IdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _user2IdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.conversations.user2Id, db.users.id),
  );

  $$UsersTableProcessedTableManager get user2Id {
    final $_column = $_itemColumn<int>('user2_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_user2IdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$MessagesTable, List<Message>> _messagesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.messages,
    aliasName: $_aliasNameGenerator(
      db.conversations.id,
      db.messages.conversationId,
    ),
  );

  $$MessagesTableProcessedTableManager get messagesRefs {
    final manager = $$MessagesTableTableManager(
      $_db,
      $_db.messages,
    ).filter((f) => f.conversationId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_messagesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ConversationsTableFilterComposer
    extends Composer<_$AppDatabase, $ConversationsTable> {
  $$ConversationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get user1Id {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.user1Id,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableFilterComposer get user2Id {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.user2Id,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> messagesRefs(
    Expression<bool> Function($$MessagesTableFilterComposer f) f,
  ) {
    final $$MessagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.messages,
      getReferencedColumn: (t) => t.conversationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessagesTableFilterComposer(
            $db: $db,
            $table: $db.messages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ConversationsTableOrderingComposer
    extends Composer<_$AppDatabase, $ConversationsTable> {
  $$ConversationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get user1Id {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.user1Id,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableOrderingComposer get user2Id {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.user2Id,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ConversationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConversationsTable> {
  $$ConversationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$UsersTableAnnotationComposer get user1Id {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.user1Id,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableAnnotationComposer get user2Id {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.user2Id,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> messagesRefs<T extends Object>(
    Expression<T> Function($$MessagesTableAnnotationComposer a) f,
  ) {
    final $$MessagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.messages,
      getReferencedColumn: (t) => t.conversationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessagesTableAnnotationComposer(
            $db: $db,
            $table: $db.messages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ConversationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ConversationsTable,
          Conversation,
          $$ConversationsTableFilterComposer,
          $$ConversationsTableOrderingComposer,
          $$ConversationsTableAnnotationComposer,
          $$ConversationsTableCreateCompanionBuilder,
          $$ConversationsTableUpdateCompanionBuilder,
          (Conversation, $$ConversationsTableReferences),
          Conversation,
          PrefetchHooks Function({
            bool user1Id,
            bool user2Id,
            bool messagesRefs,
          })
        > {
  $$ConversationsTableTableManager(_$AppDatabase db, $ConversationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConversationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConversationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConversationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> user1Id = const Value.absent(),
                Value<int> user2Id = const Value.absent(),
              }) => ConversationsCompanion(
                id: id,
                user1Id: user1Id,
                user2Id: user2Id,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int user1Id,
                required int user2Id,
              }) => ConversationsCompanion.insert(
                id: id,
                user1Id: user1Id,
                user2Id: user2Id,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ConversationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({user1Id = false, user2Id = false, messagesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (messagesRefs) db.messages],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (user1Id) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.user1Id,
                                    referencedTable:
                                        $$ConversationsTableReferences
                                            ._user1IdTable(db),
                                    referencedColumn:
                                        $$ConversationsTableReferences
                                            ._user1IdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (user2Id) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.user2Id,
                                    referencedTable:
                                        $$ConversationsTableReferences
                                            ._user2IdTable(db),
                                    referencedColumn:
                                        $$ConversationsTableReferences
                                            ._user2IdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (messagesRefs)
                        await $_getPrefetchedData<
                          Conversation,
                          $ConversationsTable,
                          Message
                        >(
                          currentTable: table,
                          referencedTable: $$ConversationsTableReferences
                              ._messagesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ConversationsTableReferences(
                                db,
                                table,
                                p0,
                              ).messagesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.conversationId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ConversationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ConversationsTable,
      Conversation,
      $$ConversationsTableFilterComposer,
      $$ConversationsTableOrderingComposer,
      $$ConversationsTableAnnotationComposer,
      $$ConversationsTableCreateCompanionBuilder,
      $$ConversationsTableUpdateCompanionBuilder,
      (Conversation, $$ConversationsTableReferences),
      Conversation,
      PrefetchHooks Function({bool user1Id, bool user2Id, bool messagesRefs})
    >;
typedef $$MessagesTableCreateCompanionBuilder =
    MessagesCompanion Function({
      Value<int> id,
      required int conversationId,
      required int senderId,
      required String content,
      Value<DateTime> timestamp,
    });
typedef $$MessagesTableUpdateCompanionBuilder =
    MessagesCompanion Function({
      Value<int> id,
      Value<int> conversationId,
      Value<int> senderId,
      Value<String> content,
      Value<DateTime> timestamp,
    });

final class $$MessagesTableReferences
    extends BaseReferences<_$AppDatabase, $MessagesTable, Message> {
  $$MessagesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ConversationsTable _conversationIdTable(_$AppDatabase db) =>
      db.conversations.createAlias(
        $_aliasNameGenerator(db.messages.conversationId, db.conversations.id),
      );

  $$ConversationsTableProcessedTableManager get conversationId {
    final $_column = $_itemColumn<int>('conversation_id')!;

    final manager = $$ConversationsTableTableManager(
      $_db,
      $_db.conversations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_conversationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _senderIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.messages.senderId, db.users.id),
  );

  $$UsersTableProcessedTableManager get senderId {
    final $_column = $_itemColumn<int>('sender_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_senderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MessagesTableFilterComposer
    extends Composer<_$AppDatabase, $MessagesTable> {
  $$MessagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  $$ConversationsTableFilterComposer get conversationId {
    final $$ConversationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.conversationId,
      referencedTable: $db.conversations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConversationsTableFilterComposer(
            $db: $db,
            $table: $db.conversations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableFilterComposer get senderId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.senderId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MessagesTableOrderingComposer
    extends Composer<_$AppDatabase, $MessagesTable> {
  $$MessagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  $$ConversationsTableOrderingComposer get conversationId {
    final $$ConversationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.conversationId,
      referencedTable: $db.conversations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConversationsTableOrderingComposer(
            $db: $db,
            $table: $db.conversations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableOrderingComposer get senderId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.senderId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MessagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MessagesTable> {
  $$MessagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  $$ConversationsTableAnnotationComposer get conversationId {
    final $$ConversationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.conversationId,
      referencedTable: $db.conversations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConversationsTableAnnotationComposer(
            $db: $db,
            $table: $db.conversations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableAnnotationComposer get senderId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.senderId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MessagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MessagesTable,
          Message,
          $$MessagesTableFilterComposer,
          $$MessagesTableOrderingComposer,
          $$MessagesTableAnnotationComposer,
          $$MessagesTableCreateCompanionBuilder,
          $$MessagesTableUpdateCompanionBuilder,
          (Message, $$MessagesTableReferences),
          Message,
          PrefetchHooks Function({bool conversationId, bool senderId})
        > {
  $$MessagesTableTableManager(_$AppDatabase db, $MessagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MessagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MessagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MessagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> conversationId = const Value.absent(),
                Value<int> senderId = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
              }) => MessagesCompanion(
                id: id,
                conversationId: conversationId,
                senderId: senderId,
                content: content,
                timestamp: timestamp,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int conversationId,
                required int senderId,
                required String content,
                Value<DateTime> timestamp = const Value.absent(),
              }) => MessagesCompanion.insert(
                id: id,
                conversationId: conversationId,
                senderId: senderId,
                content: content,
                timestamp: timestamp,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MessagesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({conversationId = false, senderId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (conversationId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.conversationId,
                                referencedTable: $$MessagesTableReferences
                                    ._conversationIdTable(db),
                                referencedColumn: $$MessagesTableReferences
                                    ._conversationIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (senderId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.senderId,
                                referencedTable: $$MessagesTableReferences
                                    ._senderIdTable(db),
                                referencedColumn: $$MessagesTableReferences
                                    ._senderIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MessagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MessagesTable,
      Message,
      $$MessagesTableFilterComposer,
      $$MessagesTableOrderingComposer,
      $$MessagesTableAnnotationComposer,
      $$MessagesTableCreateCompanionBuilder,
      $$MessagesTableUpdateCompanionBuilder,
      (Message, $$MessagesTableReferences),
      Message,
      PrefetchHooks Function({bool conversationId, bool senderId})
    >;
typedef $$NewsTableCreateCompanionBuilder =
    NewsCompanion Function({
      Value<int> id,
      required String title,
      required String date,
      required String imageUrl,
    });
typedef $$NewsTableUpdateCompanionBuilder =
    NewsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> date,
      Value<String> imageUrl,
    });

class $$NewsTableFilterComposer extends Composer<_$AppDatabase, $NewsTable> {
  $$NewsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NewsTableOrderingComposer extends Composer<_$AppDatabase, $NewsTable> {
  $$NewsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NewsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NewsTable> {
  $$NewsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);
}

class $$NewsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NewsTable,
          New,
          $$NewsTableFilterComposer,
          $$NewsTableOrderingComposer,
          $$NewsTableAnnotationComposer,
          $$NewsTableCreateCompanionBuilder,
          $$NewsTableUpdateCompanionBuilder,
          (New, BaseReferences<_$AppDatabase, $NewsTable, New>),
          New,
          PrefetchHooks Function()
        > {
  $$NewsTableTableManager(_$AppDatabase db, $NewsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NewsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NewsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NewsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<String> imageUrl = const Value.absent(),
              }) => NewsCompanion(
                id: id,
                title: title,
                date: date,
                imageUrl: imageUrl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String date,
                required String imageUrl,
              }) => NewsCompanion.insert(
                id: id,
                title: title,
                date: date,
                imageUrl: imageUrl,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NewsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NewsTable,
      New,
      $$NewsTableFilterComposer,
      $$NewsTableOrderingComposer,
      $$NewsTableAnnotationComposer,
      $$NewsTableCreateCompanionBuilder,
      $$NewsTableUpdateCompanionBuilder,
      (New, BaseReferences<_$AppDatabase, $NewsTable, New>),
      New,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$LanguagesTableTableManager get languages =>
      $$LanguagesTableTableManager(_db, _db.languages);
  $$UserLanguagesTableTableManager get userLanguages =>
      $$UserLanguagesTableTableManager(_db, _db.userLanguages);
  $$FeesTableTableManager get fees => $$FeesTableTableManager(_db, _db.fees);
  $$AvailabilityTableTableManager get availability =>
      $$AvailabilityTableTableManager(_db, _db.availability);
  $$TripsTableTableManager get trips =>
      $$TripsTableTableManager(_db, _db.trips);
  $$GuidesTableTableManager get guides =>
      $$GuidesTableTableManager(_db, _db.guides);
  $$ToursTableTableManager get tours =>
      $$ToursTableTableManager(_db, _db.tours);
  $$ExperiencesTableTableManager get experiences =>
      $$ExperiencesTableTableManager(_db, _db.experiences);
  $$ConversationsTableTableManager get conversations =>
      $$ConversationsTableTableManager(_db, _db.conversations);
  $$MessagesTableTableManager get messages =>
      $$MessagesTableTableManager(_db, _db.messages);
  $$NewsTableTableManager get news => $$NewsTableTableManager(_db, _db.news);
}
