import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/features/projects_page/models/project_model.dart';

/// Real shipped apps, sourced from the project owner's STORE LINKS document.
/// Descriptions are paraphrased from each app's own store listing where it
/// could be fetched. Cardfeast and Dellioo's store listings couldn't be
/// reached to source an icon/description automatically (TODO: replace with
/// real assets/copy once available).
final List<ProjectModel> kProjects = [
  ProjectModel(
    id: 'pay4power',
    name: 'Pay4Power',
    description:
        'Buy electricity tokens from any Nigerian disco via web, mobile, USSD, bank branch, or POS.',
    iconAsset: 'assets/images/projects/pay4power.png',
    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.pay4power.p4p',
    appStoreUrl: 'https://apps.apple.com/ng/app/pay4power/id1626172903',
    // Verified against the private repo Pay4PowerLtd/p4p_customer_mobile (dev branch).
    techDetails: const ProjectTechDetails(
      role: 'Sole developer',
      architecture:
          'Feature-first Clean Architecture. Each feature is split into data (datasources, models, mappers, repository implementations), domain (entities, repository contracts, use cases) and presentation (pages, providers, widgets).',
      stateManagement:
          'Riverpod. Use cases are wired through providers into StateNotifierProviders that expose AsyncValue loading, data and error states; StateProvider holds light UI state. Notifiers cancel in-flight requests with Dio cancel tokens.',
      routing:
          'auto_route with a code-generated AppRouter (RootStackRouter) and an AutoRouteObserver. The router is registered in GetIt, so non-UI code can redirect the user, for example to sign-in when a session expires.',
      networking:
          'Dio behind one ApiService per backend microservice (user management, wallet, bill payment, reporting), each with its own flavor-based base URL. Adds bearer-token headers, request logging and cancellation, and maps failures to typed exceptions with user-facing messages.',
      storage:
          'flutter_secure_storage for the persisted user session; flavor-specific .env files loaded with flutter_dotenv; Firebase Remote Config for remotely managed values.',
      techStack: [
        'Flutter',
        'Dart',
        'Riverpod',
        'auto_route',
        'Dio',
        'GetIt',
        'Firebase Messaging',
        'Crashlytics',
        'Remote Config',
        'Google ML Kit',
        'Amplitude',
        'flutter_screenutil',
      ],
      highlights: [
        'Electricity, airtime, data, TV and internet purchases, plus wallet funding and checkout including bank transfer.',
        'A backend-driven service catalogue: each service reports a status (available, unavailable, coming soon or disabled), so services can be switched on or off without an app release.',
        'Three build flavors (dev, staging, prod) with separate entry points, package IDs, API hosts and environment files.',
        'KYC with a camera-based liveness check using on-device Google ML Kit face detection, and tiered account upgrades.',
        'Biometric sign-in with local_auth, a transaction PIN, and an inactivity timer that logs the user out after a countdown.',
        'Push notifications through Firebase Cloud Messaging and local notifications; Android SMS Retriever for OTP auto-fill.',
        'In-app update prompts using the upgrader package, plus a force-update screen.',
        'Transaction history with PDF receipt generation, and Amplitude product analytics.',
      ],
    ),
  ),
  ProjectModel(
    id: 'p4p_merchant',
    name: 'P4P Merchant',
    description:
        'The merchant companion to Pay4Power, letting agents sell electricity tokens on behalf of customers across all Nigerian discos.',
    iconAsset: 'assets/images/projects/p4p_merchant.png',
    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.pay4powerm.p4p',
    appStoreUrl: 'https://apps.apple.com/ng/app/pay4power-merchant/id1636521513',
    // Verified against the private repo Pay4PowerLtd/merchant-mobile (dev branch).
    techDetails: const ProjectTechDetails(
      role: 'Sole developer',
      architecture:
          'Feature-first Clean Architecture. Network-backed features (airtime, data, electricity, TV, internet, wallet funding, KYC, history) are split into data, domain and presentation layers; simpler screens such as spending limits and payouts are presentation-only.',
      stateManagement:
          'Riverpod. StateNotifierProviders over AsyncValue drive loading, data and error states, with autoDispose and family variants for screen-scoped and parameterised state.',
      routing: 'auto_route with a code-generated router.',
      networking:
          'Dio behind one ApiService per backend service (user management, wallet, bill payment, reporting), with bearer-token headers and typed exceptions.',
      storage:
          'flutter_secure_storage for the persisted session; Firebase Remote Config for remotely managed values.',
      techStack: [
        'Flutter',
        'Dart',
        'Riverpod',
        'auto_route',
        'Dio',
        'GetIt',
        'flutter_gen',
        'Firebase Messaging',
        'Crashlytics',
        'Remote Config',
        'Amplitude',
        'Google ML Kit',
      ],
      highlights: [
        'Agent tooling for selling electricity, airtime, data, TV and internet on behalf of customers, with commission and earnings metrics.',
        'Merchant onboarding and KYC: BVN validation, business registration, owner and director setup, and selfie capture with on-device face detection.',
        'Spending limits and payouts for the merchant account.',
        'Transaction PIN management (change and OTP-verified reset), biometric sign-in with local_auth, and an inactivity tracker.',
        'Dev, staging and prod flavors with separate entry points.',
        'PDF receipts that can be printed or shared; push and local notifications; in-app update prompts.',
      ],
    ),
  ),
  ProjectModel(
    id: 'puex',
    name: 'Puex',
    description:
        'A finance platform for digital asset trading alongside everyday bill payments, airtime, data, and cable subscriptions.',
    iconAsset: 'assets/images/projects/puex.png',
    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.puex.app',
    appStoreUrl: 'https://apps.apple.com/us/app/puex-app/id6758914677',
    // Verified against the private repo pudigital-puex/MOBILE-APP-PUEX (main branch).
    techDetails: const ProjectTechDetails(
      role: 'Sole developer',
      architecture:
          'Feature-first Clean Architecture with domain, data and presentation layers per feature. Data flows datasource, ApiService (Dio), model, mapper, entity, Riverpod provider, UI; repositories catch exceptions and map them to domain errors with user-facing messages.',
      stateManagement:
          'Riverpod: StateNotifierProvider with AsyncValue, rendered with when(data, loading, error). Dependency injection is a GetIt and Riverpod hybrid: cross-cutting singletons (Dio, ApiService, router, storage, analytics, Crashlytics) live in GetIt, while feature repositories and datasources are plain Riverpod providers.',
      routing: 'auto_route with a code-generated router.',
      networking:
          'Dio behind a central ApiService with typed exceptions mapped to domain errors. Backend-supplied HTML is only ever rendered through a sanitising renderer.',
      storage:
          'flutter_secure_storage. Secrets are compiled in per flavor with --dart-define-from-file instead of being bundled as assets; Firebase Remote Config for remote values.',
      techStack: [
        'Flutter',
        'Dart',
        'Riverpod',
        'auto_route',
        'Dio',
        'GetIt',
        'Shorebird',
        'Firebase',
        'Mixpanel',
        'AppsFlyer',
        'Freshchat',
        'Dojah',
      ],
      highlights: [
        'Fintech app for Nigeria and Ghana: crypto exchange, gift cards, bill payments (airtime, data, electricity, TV, betting funding), wallets, transfers and KYC.',
        'Dev, staging and prod flavors that install side by side, each with its own package ID and Firebase options.',
        'Backend-driven feature gating: service and currency status endpoints decide which features and currencies are visible, with no app release needed.',
        'Over-the-air Dart patches with Shorebird, and scripted release builds for Android and iOS.',
        'Prod-only root and tamper detection on Android, biometric authentication, and an inactivity timer.',
        'KYC through Dojah and Prembly; analytics and attribution with Firebase Analytics, Mixpanel, AppsFlyer and Facebook App Events; Freshchat support.',
      ],
    ),
  ),
  ProjectModel(
    id: 'firestorm',
    name: 'Firestorm',
    description: 'Pay bills, buy airtime and data instantly and securely in one app.',
    iconAsset: 'assets/images/projects/firestorm.png',
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=com.firestorm.app&pcampaignid=web_share',
    appStoreUrl: 'https://apps.apple.com/ng/app/firestorm-easy-fast-payments/id6745209132',
    // Supplied by the project owner; not checked against source.
    techDetails: const ProjectTechDetails(
      role: 'Sole developer',
      architecture: 'Clean Architecture.',
      stateManagement: 'Provider.',
      routing: 'GoRouter.',
      networking: 'Dio.',
      storage: 'flutter_secure_storage for secure on-device storage.',
      techStack: ['Flutter', 'Dart', 'Provider', 'GoRouter', 'Dio', 'flutter_secure_storage'],
      highlights: ['Biometric authentication integration.'],
    ),
  ),
  ProjectModel(
    id: 'ondesk_mobile',
    name: 'OnDesk Mobile',
    description:
        'A bill payment and wallet app for airtime, data, utility bills, TV subscriptions, betting wallet funding, and Naira transfers.',
    iconAsset: 'assets/images/projects/ondesk_mobile.png',
    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.ondesk.mobile',
    appStoreUrl: 'https://apps.apple.com/us/app/ondesk-mobile/id6751759227',
    // Verified against the private repo TheOndesk/Ondesk-Mobile (clean_build branch).
    techDetails: const ProjectTechDetails(
      role: 'Sole developer',
      architecture:
          'Feature-first Clean Architecture. Data holds datasources, models, mappers and repository implementations; domain holds repository contracts and single-purpose use cases; presentation holds pages, providers and widgets. Repositories translate exceptions into domain errors with user-facing messages.',
      stateManagement:
          'Riverpod. Datasource, repository and use-case providers feed a StateNotifierProvider over AsyncValue. Notifiers keep the last good data visible while refreshing, and pages render shimmer loading, error and data states with AsyncValue.when.',
      routing:
          'auto_route with a code-generated router registered in GetIt. A 401 response triggers an automatic logout and redirect back to sign-in.',
      networking:
          'Dio wrapped in a single ApiService from GetIt, covering get, post, put, patch, delete and multipart requests. Errors are normalised into typed exceptions (ApiException, NetworkException, DomainError).',
      storage:
          'flutter_secure_storage for sensitive data; flutter_dotenv for configuration; Firebase Remote Config and a backend feature-flag endpoint for runtime toggles.',
      techStack: [
        'Flutter',
        'Dart',
        'Riverpod',
        'auto_route',
        'Dio',
        'GetIt',
        'Firebase Auth',
        'Crashlytics',
        'Remote Config',
        'Dojah',
        'Google ML Kit',
        'mocktail',
      ],
      highlights: [
        'Fiat and crypto wallets (USDT purchase and swap), deposits, withdrawals, P2P transfers and bill payments for airtime, data, electricity, TV and betting.',
        'KYC covering BVN, NIN and liveness, using Dojah and on-device Google ML Kit face detection.',
        'Sign-in with Google and Apple through Firebase Auth, plus local biometric authentication.',
        'Backend-driven feature flags to enable or disable features at runtime.',
        'Integration tests for the login, registration, deposit, withdrawal and swap flows, built on Riverpod ProviderContainer.',
        'Crashlytics reporting and in-app update prompts.',
      ],
    ),
  ),
  ProjectModel(
    id: 'cardfeast',
    name: 'Cardfeast',
    // TODO: store listing couldn't be fetched to confirm final copy.
    description: 'A platform for trading gift cards.',
    iconAsset: AppAssets.photo, // TODO: source Cardfeast's real app icon.
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=com.cardfeast.app&pcampaignid=web_share',
    appStoreUrl: 'https://apps.apple.com/ng/app/cardfeast-sell-gift-cards/id6742724424',
    // Supplied by the project owner; not checked against source.
    techDetails: const ProjectTechDetails(
      role: 'Sole developer',
      architecture: 'Clean Architecture.',
      stateManagement: 'Provider.',
      routing: 'GoRouter.',
      networking: 'Dio.',
      storage: 'flutter_secure_storage for secure on-device storage.',
      techStack: ['Flutter', 'Dart', 'Provider', 'GoRouter', 'Dio', 'flutter_secure_storage'],
      highlights: ['Biometric authentication integration.'],
    ),
  ),
  ProjectModel(
    id: 'monieboxx',
    name: 'Monieboxx',
    description: 'A bill payment platform for buying data, airtime, and settling bills from one place.',
    iconAsset: 'assets/images/projects/monieboxx.png',
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=com.monieboxx.app&pcampaignid=web_share',
    appStoreUrl: 'https://apps.apple.com/ng/app/monieboxx-bills-made-easy/id6741108564',
    // Supplied by the project owner; not checked against source.
    techDetails: const ProjectTechDetails(
      role: 'Co-developer (supporting developer)',
      architecture: 'Clean Architecture.',
      stateManagement: 'BLoC.',
      routing: 'GoRouter.',
      networking: 'Dio.',
      storage: 'flutter_secure_storage for secure on-device storage.',
      techStack: ['Flutter', 'Dart', 'BLoC', 'GoRouter', 'Dio', 'flutter_secure_storage'],
      highlights: ['Biometric authentication integration.'],
    ),
  ),
  ProjectModel(
    id: 'dellioo',
    name: 'Dellioo',
    // TODO: store listing couldn't be fetched to confirm final copy.
    description: 'A rider-facing delivery app.',
    iconAsset: AppAssets.photo, // TODO: source Dellioo's real app icon.
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=com.dellioo.rider&pcampaignid=web_share',
    appStoreUrl: null,
    // Verified against the private repo dellioo-team/dellioo-mobile-interface-courier (main branch).
    techDetails: const ProjectTechDetails(
      role: 'Supporting developer',
      architecture:
          'Modular, feature-first structure: shared commons, order management, communication and startup modules. Each feature separates data (service implementations, models), domain (service contracts) and presentation (UI and logic). Implementations are registered in GetIt.',
      stateManagement:
          'Riverpod StateNotifierProviders (for example the orders and home controllers) holding immutable Freezed state classes. GetIt provides dependency injection.',
      routing:
          'auto_route with route guards: a logged-in guard that checks the stored session and its expiry, and an onboarding-complete guard.',
      networking:
          'Dio through a shared HTTP client and API helper; Supabase for realtime data. The backend-for-frontend OpenAPI spec is checked in and openapi_generator is configured.',
      storage:
          'flutter_secure_storage (encrypted shared preferences on Android) for the session; flutter_dotenv for configuration.',
      techStack: [
        'Flutter',
        'Dart',
        'Riverpod',
        'Freezed',
        'auto_route',
        'Dio',
        'GetIt',
        'Supabase',
        'Google Maps',
        'Sentry',
        'Firebase Messaging',
      ],
      highlights: [
        'Courier app for live order handling: map and route directions, a delivery timeline, and delivery-code confirmation.',
        'Background location tracking with flutter_background_geolocation, including a headless task, with heartbeat and location-updater controllers.',
        'In-app chat and support, push and local notifications, and audio alerts.',
        'Sentry error reporting and generated l10n localisation.',
        'Separate dev and prod entry points, each with its own Supabase configuration.',
      ],
    ),
  ),
  ProjectModel(
    id: 'billpadi',
    name: 'Billpadi',
    description: 'A one-stop utilities app for airtime, data bundles, cable TV, and electricity bills.',
    iconAsset: 'assets/images/projects/billpadi.png',
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=com.billpadi.android&pcampaignid=web_share',
    appStoreUrl: 'https://apps.apple.com/ng/app/billpadi-pay-bills-with-ease/id6497227460',
    // Supplied by the project owner; not checked against source.
    techDetails: const ProjectTechDetails(
      role: 'Co-developer (supporting developer)',
      architecture: 'Clean Architecture.',
      stateManagement: 'BLoC.',
      routing: 'GoRouter.',
      networking: 'Dio.',
      storage: 'flutter_secure_storage for secure on-device storage.',
      techStack: ['Flutter', 'Dart', 'BLoC', 'GoRouter', 'Dio', 'flutter_secure_storage'],
      highlights: ['Biometric authentication integration.'],
    ),
  ),
];
