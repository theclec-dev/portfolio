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
  ),
  ProjectModel(
    id: 'p4p_merchant',
    name: 'P4P Merchant',
    description:
        'The merchant companion to Pay4Power, letting agents sell electricity tokens on behalf of customers across all Nigerian discos.',
    iconAsset: 'assets/images/projects/p4p_merchant.png',
    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.pay4powerm.p4p',
    appStoreUrl: 'https://apps.apple.com/ng/app/pay4power-merchant/id1636521513',
  ),
  ProjectModel(
    id: 'puex',
    name: 'Puex',
    description:
        'A finance platform for digital asset trading alongside everyday bill payments, airtime, data, and cable subscriptions.',
    iconAsset: 'assets/images/projects/puex.png',
    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.puex.app',
    appStoreUrl: 'https://apps.apple.com/us/app/puex-app/id6758914677',
  ),
  ProjectModel(
    id: 'firestorm',
    name: 'Firestorm',
    description: 'Pay bills, buy airtime and data instantly and securely in one app.',
    iconAsset: 'assets/images/projects/firestorm.png',
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=com.firestorm.app&pcampaignid=web_share',
    appStoreUrl: 'https://apps.apple.com/ng/app/firestorm-easy-fast-payments/id6745209132',
  ),
  ProjectModel(
    id: 'ondesk_mobile',
    name: 'OnDesk Mobile',
    description:
        'A bill payment and wallet app for airtime, data, utility bills, TV subscriptions, betting wallet funding, and Naira transfers.',
    iconAsset: 'assets/images/projects/ondesk_mobile.png',
    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.ondesk.mobile',
    appStoreUrl: 'https://apps.apple.com/us/app/ondesk-mobile/id6751759227',
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
  ),
  ProjectModel(
    id: 'monieboxx',
    name: 'Monieboxx',
    description: 'A bill payment platform for buying data, airtime, and settling bills from one place.',
    iconAsset: 'assets/images/projects/monieboxx.png',
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=com.monieboxx.app&pcampaignid=web_share',
    appStoreUrl: 'https://apps.apple.com/ng/app/monieboxx-bills-made-easy/id6741108564',
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
  ),
  ProjectModel(
    id: 'billpadi',
    name: 'Billpadi',
    description: 'A one-stop utilities app for airtime, data bundles, cable TV, and electricity bills.',
    iconAsset: 'assets/images/projects/billpadi.png',
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=com.billpadi.android&pcampaignid=web_share',
    appStoreUrl: 'https://apps.apple.com/ng/app/billpadi-pay-bills-with-ease/id6497227460',
  ),
];
