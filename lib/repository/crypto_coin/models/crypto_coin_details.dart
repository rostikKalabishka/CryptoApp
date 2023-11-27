import 'package:json_annotation/json_annotation.dart';
part 'crypto_coin_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CryptoCoinDetails {
  final String id;
  final String symbol;
  final String name;
  final String webSlug;
  final int blockTimeInMinutes;
  final String hashingAlgorithm;
  final List<String> categories;
  final bool previewListing;

  final Localization localization;
  final Description description;
  final Links links;
  final Image image;
  final String countryOrigin;
  final String genesisDate;
  final double sentimentVotesUpPercentage;
  final double sentimentVotesDownPercentage;
  final int watchlistPortfolioUsers;
  final int marketCapRank;
  final int coingeckoRank;
  final double coingeckoScore;
  final double developerScore;
  final double communityScore;
  final double liquidityScore;
  final double publicInterestScore;
  final MarketData marketData;

  final List<dynamic> statusUpdates;
  final String lastUpdated;

  CryptoCoinDetails({
    required this.id,
    required this.symbol,
    required this.name,
    required this.webSlug,
    required this.blockTimeInMinutes,
    required this.hashingAlgorithm,
    required this.categories,
    required this.previewListing,
    required this.localization,
    required this.description,
    required this.links,
    required this.image,
    required this.countryOrigin,
    required this.genesisDate,
    required this.sentimentVotesUpPercentage,
    required this.sentimentVotesDownPercentage,
    required this.watchlistPortfolioUsers,
    required this.marketCapRank,
    required this.coingeckoRank,
    required this.coingeckoScore,
    required this.developerScore,
    required this.communityScore,
    required this.liquidityScore,
    required this.publicInterestScore,
    required this.marketData,
    required this.statusUpdates,
    required this.lastUpdated,
  });
  factory CryptoCoinDetails.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinDetailsToJson(this);
}

@JsonSerializable()
class Localization {
  final String en;
  final String de;
  final String es;
  final String fr;
  final String it;
  final String pl;
  final String ro;
  final String hu;
  final String nl;
  final String pt;
  final String sv;
  final String vi;
  final String tr;
  final String ru;
  final String ja;
  final String zh;
  final String zhTw;
  final String ko;
  final String ar;
  final String th;
  final String id;
  final String cs;
  final String da;
  final String el;
  final String hi;
  final String no;
  final String sk;
  final String uk;
  final String he;
  final String fi;
  final String bg;
  final String hr;
  final String lt;
  final String sl;
  Localization({
    required this.en,
    required this.de,
    required this.es,
    required this.fr,
    required this.it,
    required this.pl,
    required this.ro,
    required this.hu,
    required this.nl,
    required this.pt,
    required this.sv,
    required this.vi,
    required this.tr,
    required this.ru,
    required this.ja,
    required this.zh,
    required this.zhTw,
    required this.ko,
    required this.ar,
    required this.th,
    required this.id,
    required this.cs,
    required this.da,
    required this.el,
    required this.hi,
    required this.no,
    required this.sk,
    required this.uk,
    required this.he,
    required this.fi,
    required this.bg,
    required this.hr,
    required this.lt,
    required this.sl,
  });
  factory Localization.fromJson(Map<String, dynamic> json) =>
      _$LocalizationFromJson(json);

  Map<String, dynamic> toJson() => _$LocalizationToJson(this);
}

@JsonSerializable()
class Description {
  final String en;
  final String de;
  final String es;
  final String fr;
  final String it;
  final String pl;
  final String ro;
  final String hu;
  final String nl;
  final String pt;
  final String sv;
  final String vi;
  final String tr;
  final String ru;
  final String ja;
  final String zh;
  final String zhTw;
  final String ko;
  final String ar;
  final String th;
  final String id;
  final String cs;
  final String da;
  final String el;
  final String hi;
  final String no;
  final String sk;
  final String uk;
  final String he;
  final String fi;
  final String bg;
  final String hr;
  final String lt;
  final String sl;
  Description({
    required this.en,
    required this.de,
    required this.es,
    required this.fr,
    required this.it,
    required this.pl,
    required this.ro,
    required this.hu,
    required this.nl,
    required this.pt,
    required this.sv,
    required this.vi,
    required this.tr,
    required this.ru,
    required this.ja,
    required this.zh,
    required this.zhTw,
    required this.ko,
    required this.ar,
    required this.th,
    required this.id,
    required this.cs,
    required this.da,
    required this.el,
    required this.hi,
    required this.no,
    required this.sk,
    required this.uk,
    required this.he,
    required this.fi,
    required this.bg,
    required this.hr,
    required this.lt,
    required this.sl,
  });
  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Links {
  final List<String> homepage;
  final List<String> blockchainSite;
  final List<String> officialForumUrl;
  final List<String> chatUrl;
  final List<String> announcementUrl;
  final String twitterScreenName;
  final String facebookUsername;

  final String telegramChannelIdentifier;
  final String subredditUrl;
  final ReposUrl reposUrl;
  Links({
    required this.homepage,
    required this.blockchainSite,
    required this.officialForumUrl,
    required this.chatUrl,
    required this.announcementUrl,
    required this.twitterScreenName,
    required this.facebookUsername,
    required this.telegramChannelIdentifier,
    required this.subredditUrl,
    required this.reposUrl,
  });
  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
class ReposUrl {
  final List<String> github;
  final List<dynamic> bitbucket;
  ReposUrl({
    required this.github,
    required this.bitbucket,
  });
  factory ReposUrl.fromJson(Map<String, dynamic> json) =>
      _$ReposUrlFromJson(json);

  Map<String, dynamic> toJson() => _$ReposUrlToJson(this);
}

@JsonSerializable()
class Image {
  final String thumb;
  final String small;
  final String large;
  Image({
    required this.thumb,
    required this.small,
    required this.large,
  });
  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MarketData {
  final CurrentPrice currentPrice;

  final Ath ath;
  final AthChangePercentage athChangePercentage;
  final AthDate athDate;
  final Atl atl;
  final AtlChangePercentage atlChangePercentage;
  final AtlDate atlDate;
  final MarketCap marketCap;
  final int marketCapRank;
  final FullyDilutedValuation fullyDilutedValuation;
  final double marketCapFdvRatio;
  final TotalVolume totalVolume;
  @JsonKey(name: 'high_24h')
  final High24h high24h;
  @JsonKey(name: 'low_24h')
  final Low24h low24h;
  @JsonKey(name: 'price_change_24h')
  final double priceChange24h;
  @JsonKey(name: 'price_change_percentage_24h')
  final double priceChangePercentage24h;
  @JsonKey(name: 'price_change_percentage_7d')
  final double priceChangePercentage7d;
  @JsonKey(name: 'price_change_percentage_14d')
  final double priceChangePercentage14d;
  @JsonKey(name: 'price_change_percentage_30d')
  final double priceChangePercentage30d;
  @JsonKey(name: 'price_change_percentage_60d')
  final double priceChangePercentage60d;
  @JsonKey(name: 'price_change_percentage_200d')
  final double priceChangePercentage200d;
  @JsonKey(name: 'price_change_percentage_1y')
  final double priceChangePercentage1y;
  @JsonKey(name: 'market_cap_change_24h')
  final double marketCapChange24h;
  @JsonKey(name: 'market_cap_change_percentage_24h')
  final double marketCapChangePercentage24h;
  @JsonKey(name: 'price_change_24h_in_currency')
  final PriceChange24hInCurrency priceChange24hInCurrency;
  @JsonKey(name: 'price_change_percentage_1h_in_currency')
  final PriceChangePercentage1hInCurrency priceChangePercentage1hInCurrency;
  @JsonKey(name: 'price_change_percentage_24h_in_currency')
  final PriceChangePercentage24hInCurrency priceChangePercentage24hInCurrency;
  @JsonKey(name: 'price_change_percentage_7d_in_currency')
  final PriceChangePercentage7dInCurrency priceChangePercentage7dInCurrency;
  @JsonKey(name: 'price_change_percentage_14d_in_currency')
  final PriceChangePercentage14dInCurrency priceChangePercentage14dInCurrency;
  @JsonKey(name: 'price_change_percentage_30d_in_currency')
  final PriceChangePercentage30dInCurrency priceChangePercentage30dInCurrency;
  @JsonKey(name: 'price_change_percentage_60d_in_currency')
  final PriceChangePercentage60dInCurrency priceChangePercentage60dInCurrency;

  final int totalSupply;
  final int maxSupply;
  final int circulatingSupply;
  final String lastUpdated;
  MarketData({
    required this.currentPrice,
    required this.ath,
    required this.athChangePercentage,
    required this.athDate,
    required this.atl,
    required this.atlChangePercentage,
    required this.atlDate,
    required this.marketCap,
    required this.marketCapRank,
    required this.fullyDilutedValuation,
    required this.marketCapFdvRatio,
    required this.totalVolume,
    required this.high24h,
    required this.low24h,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
    required this.priceChangePercentage7d,
    required this.priceChangePercentage14d,
    required this.priceChangePercentage30d,
    required this.priceChangePercentage60d,
    required this.priceChangePercentage200d,
    required this.priceChangePercentage1y,
    required this.marketCapChange24h,
    required this.marketCapChangePercentage24h,
    required this.priceChange24hInCurrency,
    required this.priceChangePercentage1hInCurrency,
    required this.priceChangePercentage24hInCurrency,
    required this.priceChangePercentage7dInCurrency,
    required this.priceChangePercentage14dInCurrency,
    required this.priceChangePercentage30dInCurrency,
    required this.priceChangePercentage60dInCurrency,
    required this.totalSupply,
    required this.maxSupply,
    required this.circulatingSupply,
    required this.lastUpdated,
  });
  factory MarketData.fromJson(Map<String, dynamic> json) =>
      _$MarketDataFromJson(json);

  Map<String, dynamic> toJson() => _$MarketDataToJson(this);
}

@JsonSerializable()
class CurrentPrice {
  final int aed;
  final int ars;
  final int aud;
  final double bch;
  final int bdt;
  final double bhd;
  final int bmd;
  final double bnb;
  final int brl;
  final int btc;
  final int cad;
  final int chf;
  final int clp;
  final int cny;
  final int czk;
  final int dkk;
  final int dot;
  final int eos;
  final double eth;
  final int eur;
  final int gbp;
  final int hkd;
  final int huf;
  final int idr;
  final int ils;
  final int inr;
  final int jpy;
  final int krw;
  final double kwd;
  final int lkr;
  final double ltc;
  final int mmk;
  final int mxn;
  final int myr;
  final int ngn;
  final int nok;
  final int nzd;
  final int php;
  final int pkr;
  final int pln;
  final int rub;
  final int sar;
  final int sek;
  final int sgd;
  final int thb;
  final int tTry;
  final int twd;
  final int uah;
  final int usd;
  final double vef;
  final int vnd;
  final double xag;
  final double xau;
  final int xdr;
  final int xlm;
  final int xrp;
  final double yfi;
  final int zar;
  final int bits;
  final int link;
  final int sats;
  CurrentPrice({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });
  factory CurrentPrice.fromJson(Map<String, dynamic> json) =>
      _$CurrentPriceFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentPriceToJson(this);
}

@JsonSerializable()
class Ath {
  final int aed;
  final int ars;
  final int aud;
  final double bch;
  final int bdt;
  final int bhd;
  final int bmd;
  final int bnb;
  final int brl;
  final double btc;
  final int cad;
  final int chf;
  final int clp;
  final int cny;
  final int czk;
  final int dkk;
  final int dot;
  final int eos;
  final double eth;
  final int eur;
  final int gbp;
  final int hkd;
  final int huf;
  final int idr;
  final int ils;
  final int inr;
  final int jpy;
  final int krw;
  final int kwd;
  final int lkr;
  final double ltc;
  final int mmk;
  final int mxn;
  final int myr;
  final int ngn;
  final int nok;
  final int nzd;
  final int php;
  final int pkr;
  final int pln;
  final int rub;
  final int sar;
  final int sek;
  final int sgd;
  final int thb;
  final int tTry;
  final int twd;
  final int uah;
  final int usd;
  final int vef;
  final int vnd;
  final double xag;
  final double xau;
  final int xdr;
  final int xlm;
  final int xrp;
  final double yfi;
  final int zar;
  final int bits;
  final int link;
  final int sats;
  Ath({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });
  factory Ath.fromJson(Map<String, dynamic> json) => _$AthFromJson(json);

  Map<String, dynamic> toJson() => _$AthToJson(this);
}

@JsonSerializable()
class AthChangePercentage {
  final double aed;
  final double ars;
  final double aud;
  final double bch;
  final double bdt;
  final double bhd;
  final double bmd;
  final double bnb;
  final double brl;
  final double btc;
  final double cad;
  final double chf;
  final double clp;
  final double cny;
  final double czk;
  final double dkk;
  final double dot;
  final double eos;
  final double eth;
  final double eur;
  final double gbp;
  final double hkd;
  final double huf;
  final double idr;
  final double ils;
  final double inr;
  final double jpy;
  final double krw;
  final double kwd;
  final double lkr;
  final double ltc;
  final double mmk;
  final double mxn;
  final double myr;
  final double ngn;
  final double nok;
  final double nzd;
  final double php;
  final double pkr;
  final double pln;
  final double rub;
  final double sar;
  final double sek;
  final double sgd;
  final double thb;
  final double tTry;
  final double twd;
  final double uah;
  final double usd;
  final double vef;
  final double vnd;
  final double xag;
  final double xau;
  final double xdr;
  final double xlm;
  final double xrp;
  final double yfi;
  final double zar;
  final double bits;
  final double link;
  final double sats;
  AthChangePercentage({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });
  factory AthChangePercentage.fromJson(Map<String, dynamic> json) =>
      _$AthChangePercentageFromJson(json);

  Map<String, dynamic> toJson() => _$AthChangePercentageToJson(this);
}

@JsonSerializable()
class AthDate {
  final String aed;
  final String ars;
  final String aud;
  final String bch;
  final String bdt;
  final String bhd;
  final String bmd;
  final String bnb;
  final String brl;
  final String btc;
  final String cad;
  final String chf;
  final String clp;
  final String cny;
  final String czk;
  final String dkk;
  final String dot;
  final String eos;
  final String eth;
  final String eur;
  final String gbp;
  final String hkd;
  final String huf;
  final String idr;
  final String ils;
  final String inr;
  final String jpy;
  final String krw;
  final String kwd;
  final String lkr;
  final String ltc;
  final String mmk;
  final String mxn;
  final String myr;
  final String ngn;
  final String nok;
  final String nzd;
  final String php;
  final String pkr;
  final String pln;
  final String rub;
  final String sar;
  final String sek;
  final String sgd;
  final String thb;
  final String tTry;
  final String twd;
  final String uah;
  final String usd;
  final String vef;
  final String vnd;
  final String xag;
  final String xau;
  final String xdr;
  final String xlm;
  final String xrp;
  final String yfi;
  final String zar;
  final String bits;
  final String link;
  final String sats;
  AthDate({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });
  factory AthDate.fromJson(Map<String, dynamic> json) =>
      _$AthDateFromJson(json);

  Map<String, dynamic> toJson() => _$AthDateToJson(this);
}

@JsonSerializable()
class Atl {
  final double aed;
  final double ars;
  final double aud;
  final double bch;
  final double bdt;
  final double bhd;
  final double bmd;
  final double bnb;
  final double brl;
  final double btc;
  final double cad;
  final double chf;
  final int clp;
  final double cny;
  final double czk;
  final double dkk;
  final double dot;
  final double eos;
  final double eth;
  final double eur;
  final double gbp;
  final double hkd;
  final int huf;
  final int idr;
  final double ils;
  final double inr;
  final double jpy;
  final int krw;
  final double kwd;
  final int lkr;
  final double ltc;
  final int mmk;
  final double mxn;
  final double myr;
  final double ngn;
  final double nok;
  final double nzd;
  final double php;
  final double pkr;
  final double pln;
  final double rub;
  final double sar;
  final double sek;
  final double sgd;
  final double thb;
  final double tTry;
  final double twd;
  final double uah;
  final double usd;
  final double vef;
  final int vnd;
  final double xag;
  final double xau;
  final double xdr;
  final int xlm;
  final int xrp;
  final double yfi;
  final double zar;
  final int bits;
  final double link;
  final int sats;
  Atl({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });
  factory Atl.fromJson(Map<String, dynamic> json) => _$AtlFromJson(json);

  Map<String, dynamic> toJson() => _$AtlToJson(this);
}

@JsonSerializable()
class AtlChangePercentage {
  final double aed;
  final double ars;
  final double aud;
  final double bch;
  final double bdt;
  final double bhd;
  final double bmd;
  final double bnb;
  final double brl;
  final double btc;
  final double cad;
  final double chf;
  final double clp;
  final double cny;
  final double czk;
  final double dkk;
  final double dot;
  final double eos;
  final double eth;
  final double eur;
  final double gbp;
  final double hkd;
  final double huf;
  final double idr;
  final double ils;
  final double inr;
  final double jpy;
  final double krw;
  final double kwd;
  final double lkr;
  final double ltc;
  final double mmk;
  final double mxn;
  final double myr;
  final double ngn;
  final double nok;
  final double nzd;
  final double php;
  final double pkr;
  final double pln;
  final double rub;
  final double sar;
  final double sek;
  final double sgd;
  final double thb;
  final double tTry;
  final double twd;
  final double uah;
  final double usd;
  final double vef;
  final double vnd;
  final double xag;
  final double xau;
  final double xdr;
  final double xlm;
  final double xrp;
  final double yfi;
  final double zar;
  final double bits;
  final double link;
  final double sats;
  AtlChangePercentage({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });
  factory AtlChangePercentage.fromJson(Map<String, dynamic> json) =>
      _$AtlChangePercentageFromJson(json);

  Map<String, dynamic> toJson() => _$AtlChangePercentageToJson(this);
}

@JsonSerializable()
class AtlDate {
  final String aed;
  final String ars;
  final String aud;
  final String bch;
  final String bdt;
  final String bhd;
  final String bmd;
  final String bnb;
  final String brl;
  final String btc;
  final String cad;
  final String chf;
  final String clp;
  final String cny;
  final String czk;
  final String dkk;
  final String dot;
  final String eos;
  final String eth;
  final String eur;
  final String gbp;
  final String hkd;
  final String huf;
  final String idr;
  final String ils;
  final String inr;
  final String jpy;
  final String krw;
  final String kwd;
  final String lkr;
  final String ltc;
  final String mmk;
  final String mxn;
  final String myr;
  final String ngn;
  final String nok;
  final String nzd;
  final String php;
  final String pkr;
  final String pln;
  final String rub;
  final String sar;
  final String sek;
  final String sgd;
  final String thb;
  final String tTry;
  final String twd;
  final String uah;
  final String usd;
  final String vef;
  final String vnd;
  final String xag;
  final String xau;
  final String xdr;
  final String xlm;
  final String xrp;
  final String yfi;
  final String zar;
  final String bits;
  final String link;
  final String sats;
  AtlDate({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });
  factory AtlDate.fromJson(Map<String, dynamic> json) =>
      _$AtlDateFromJson(json);

  Map<String, dynamic> toJson() => _$AtlDateToJson(this);
}

@JsonSerializable()
class MarketCap {
  final int aed;
  final int ars;
  final int aud;
  final int bch;
  final int bdt;
  final int bhd;
  final int bmd;
  final int bnb;
  final int brl;
  final int btc;
  final int cad;
  final int chf;
  final int clp;
  final int cny;
  final int czk;
  final int dkk;
  final int dot;
  final int eos;
  final int eth;
  final int eur;
  final int gbp;
  final int hkd;
  final int huf;
  final int idr;
  final int ils;
  final int inr;
  final int jpy;
  final int krw;
  final int kwd;
  final int lkr;
  final int ltc;
  final int mmk;
  final int mxn;
  final int myr;
  final int ngn;
  final int nok;
  final int nzd;
  final int php;
  final int pkr;
  final int pln;
  final int rub;
  final int sar;
  final int sek;
  final int sgd;
  final int thb;
  final int tTry;
  final int twd;
  final int uah;
  final int usd;
  final int vef;
  final int vnd;
  final int xag;
  final int xau;
  final int xdr;
  final int xlm;
  final int xrp;
  final int yfi;
  final int zar;
  final int bits;
  final int link;
  final int sats;
  MarketCap({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });
  factory MarketCap.fromJson(Map<String, dynamic> json) =>
      _$MarketCapFromJson(json);

  Map<String, dynamic> toJson() => _$MarketCapToJson(this);
}

@JsonSerializable()
class FullyDilutedValuation {
  final int aed;
  final int ars;
  final int aud;
  final int bch;
  final int bdt;
  final int bhd;
  final int bmd;
  final int bnb;
  final int brl;
  final int btc;
  final int cad;
  final int chf;
  final int clp;
  final int cny;
  final int czk;
  final int dkk;
  final int dot;
  final int eos;
  final int eth;
  final int eur;
  final int gbp;
  final int hkd;
  final int huf;
  final int idr;
  final int ils;
  final int inr;
  final int jpy;
  final int krw;
  final int kwd;
  final int lkr;
  final int ltc;
  final int mmk;
  final int mxn;
  final int myr;
  final int ngn;
  final int nok;
  final int nzd;
  final int php;
  final int pkr;
  final int pln;
  final int rub;
  final int sar;
  final int sek;
  final int sgd;
  final int thb;
  final int tTry;
  final int twd;
  final int uah;
  final int usd;
  final int vef;
  final int vnd;
  final int xag;
  final int xau;
  final int xdr;
  final int xlm;
  final int xrp;
  final int yfi;
  final int zar;
  final int bits;
  final int link;
  final int sats;
  FullyDilutedValuation({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });
  factory FullyDilutedValuation.fromJson(Map<String, dynamic> json) =>
      _$FullyDilutedValuationFromJson(json);

  Map<String, dynamic> toJson() => _$FullyDilutedValuationToJson(this);
}

@JsonSerializable()
class TotalVolume {
  final int aed;
  final int ars;
  final int aud;
  final int bch;
  final int bdt;
  final int bhd;
  final int bmd;
  final int bnb;
  final int brl;
  final int btc;
  final int cad;
  final int chf;
  final int clp;
  final int cny;
  final int czk;
  final int dkk;
  final int dot;
  final int eos;
  final int eth;
  final int eur;
  final int gbp;
  final int hkd;
  final int huf;
  final int idr;
  final int ils;
  final int inr;
  final int jpy;
  final int krw;
  final int kwd;
  final int lkr;
  final int ltc;
  final int mmk;
  final int mxn;
  final int myr;
  final int ngn;
  final int nok;
  final int nzd;
  final int php;
  final int pkr;
  final int pln;
  final int rub;
  final int sar;
  final int sek;
  final int sgd;
  final int thb;
  final int tTry;
  final int twd;
  final int uah;
  final int usd;
  final int vef;
  final int vnd;
  final int xag;
  final int xau;
  final int xdr;
  final int xlm;
  final int xrp;
  final int yfi;
  final int zar;
  final int bits;
  final int link;
  final int sats;
  TotalVolume({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });

  factory TotalVolume.fromJson(Map<String, dynamic> json) =>
      _$TotalVolumeFromJson(json);

  Map<String, dynamic> toJson() => _$TotalVolumeToJson(this);
}

@JsonSerializable()
class High24h {
  final int aed;
  final int ars;
  final int aud;
  final double bch;
  final int bdt;
  final double bhd;
  final int bmd;
  final double bnb;
  final int brl;
  final int btc;
  final int cad;
  final int chf;
  final int clp;
  final int cny;
  final int czk;
  final int dkk;
  final int dot;
  final int eos;
  final double eth;
  final int eur;
  final int gbp;
  final int hkd;
  final int huf;
  final int idr;
  final int ils;
  final int inr;
  final int jpy;
  final int krw;
  final double kwd;
  final int lkr;
  final double ltc;
  final int mmk;
  final int mxn;
  final int myr;
  final int ngn;
  final int nok;
  final int nzd;
  final int php;
  final int pkr;
  final int pln;
  final int rub;
  final int sar;
  final int sek;
  final int sgd;
  final int thb;
  final int tTry;
  final int twd;
  final int uah;
  final int usd;
  final double vef;
  final int vnd;
  final double xag;
  final double xau;
  final int xdr;
  final int xlm;
  final int xrp;
  final double yfi;
  final int zar;
  final int bits;
  final int link;
  final int sats;
  High24h({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });
  factory High24h.fromJson(Map<String, dynamic> json) =>
      _$High24hFromJson(json);

  Map<String, dynamic> toJson() => _$High24hToJson(this);
}

@JsonSerializable()
class Low24h {
  final int aed;
  final int ars;
  final int aud;
  final double bch;
  final int bdt;
  final double bhd;
  final int bmd;
  final double bnb;
  final int brl;
  final int btc;
  final int cad;
  final int chf;
  final int clp;
  final int cny;
  final int czk;
  final int dkk;
  final int dot;
  final int eos;
  final double eth;
  final int eur;
  final int gbp;
  final int hkd;
  final int huf;
  final int idr;
  final int ils;
  final int inr;
  final int jpy;
  final int krw;
  final double kwd;
  final int lkr;
  final double ltc;
  final int mmk;
  final int mxn;
  final int myr;
  final int ngn;
  final int nok;
  final int nzd;
  final int php;
  final int pkr;
  final int pln;
  final int rub;
  final int sar;
  final int sek;
  final int sgd;
  final int thb;
  final int tTry;
  final int twd;
  final int uah;
  final int usd;
  final double vef;
  final int vnd;
  final double xag;
  final double xau;
  final int xdr;
  final int xlm;
  final int xrp;
  final double yfi;
  final int zar;
  final int bits;
  final int link;
  final int sats;
  Low24h({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });
  factory Low24h.fromJson(Map<String, dynamic> json) => _$Low24hFromJson(json);

  Map<String, dynamic> toJson() => _$Low24hToJson(this);
}

@JsonSerializable()
class PriceChange24hInCurrency {
  final double aed;
  final double ars;
  final double aud;
  final double bch;
  final double bdt;
  final double bhd;
  final double bmd;
  final double bnb;
  final double brl;
  final int btc;
  final double cad;
  final double chf;
  final double clp;
  final double cny;
  final double czk;
  final double dkk;
  final double dot;
  final double eos;
  final double eth;
  final double eur;
  final double gbp;
  final double hkd;
  final double huf;
  final double idr;
  final double ils;
  final double inr;
  final double jpy;
  final double krw;
  final double kwd;
  final double lkr;
  final double ltc;
  final double mmk;
  final double mxn;
  final double myr;
  final double ngn;
  final double nok;
  final double nzd;
  final double php;
  final double pkr;
  final double pln;
  final double rub;
  final double sar;
  final double sek;
  final double sgd;
  final double thb;
  final double tTry;
  final double twd;
  final double uah;
  final double usd;
  final double vef;
  final double vnd;
  final double xag;
  final double xau;
  final double xdr;
  final int xlm;
  final int xrp;
  final double yfi;
  final double zar;
  final double bits;
  final double link;
  final double sats;
  PriceChange24hInCurrency({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });
  factory PriceChange24hInCurrency.fromJson(Map<String, dynamic> json) =>
      _$PriceChange24hInCurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$PriceChange24hInCurrencyToJson(this);
}

@JsonSerializable()
class PriceChangePercentage1hInCurrency {
  final double aed;
  final double ars;
  final double aud;
  final double bch;
  final double bdt;
  final double bhd;
  final double bmd;
  final double bnb;
  final double brl;
  final int btc;
  final double cad;
  final double chf;
  final double clp;
  final double cny;
  final double czk;
  final double dkk;
  final double dot;
  final double eos;
  final double eth;
  final double eur;
  final double gbp;
  final double hkd;
  final double huf;
  final double idr;
  final double ils;
  final double inr;
  final double jpy;
  final double krw;
  final double kwd;
  final double lkr;
  final double ltc;
  final double mmk;
  final double mxn;
  final double myr;
  final double ngn;
  final double nok;
  final double nzd;
  final double php;
  final double pkr;
  final double pln;
  final double rub;
  final double sar;
  final double sek;
  final double sgd;
  final double thb;
  final double tTry;
  final double twd;
  final double uah;
  final double usd;
  final double vef;
  final double vnd;
  final double xag;
  final double xau;
  final double xdr;
  final double xlm;
  final double xrp;
  final double yfi;
  final double zar;
  final double bits;
  final double link;
  final double sats;
  PriceChangePercentage1hInCurrency({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });

  factory PriceChangePercentage1hInCurrency.fromJson(
          Map<String, dynamic> json) =>
      _$PriceChangePercentage1hInCurrencyFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PriceChangePercentage1hInCurrencyToJson(this);
}

@JsonSerializable()
class PriceChangePercentage24hInCurrency {
  final double aed;
  final double ars;
  final double aud;
  final double bch;
  final double bdt;
  final double bhd;
  final double bmd;
  final double bnb;
  final double brl;
  final int btc;
  final double cad;
  final double chf;
  final double clp;
  final double cny;
  final double czk;
  final double dkk;
  final double dot;
  final double eos;
  final double eth;
  final double eur;
  final double gbp;
  final double hkd;
  final double huf;
  final double idr;
  final double ils;
  final double inr;
  final double jpy;
  final double krw;
  final double kwd;
  final double lkr;
  final double ltc;
  final double mmk;
  final double mxn;
  final double myr;
  final double ngn;
  final double nok;
  final double nzd;
  final double php;
  final double pkr;
  final double pln;
  final double rub;
  final double sar;
  final double sek;
  final double sgd;
  final double thb;
  final double tTry;
  final double twd;
  final double uah;
  final double usd;
  final double vef;
  final double vnd;
  final double xag;
  final double xau;
  final double xdr;
  final double xlm;
  final double xrp;
  final double yfi;
  final double zar;
  final double bits;
  final double link;
  final double sats;
  PriceChangePercentage24hInCurrency({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });
  factory PriceChangePercentage24hInCurrency.fromJson(
          Map<String, dynamic> json) =>
      _$PriceChangePercentage24hInCurrencyFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PriceChangePercentage24hInCurrencyToJson(this);
}

@JsonSerializable()
class PriceChangePercentage7dInCurrency {
  final double aed;
  final double ars;
  final double aud;
  final double bch;
  final double bdt;
  final double bhd;
  final double bmd;
  final double bnb;
  final double brl;
  final int btc;
  final double cad;
  final double chf;
  final double clp;
  final double cny;
  final double czk;
  final double dkk;
  final double dot;
  final double eos;
  final double eth;
  final double eur;
  final double gbp;
  final double hkd;
  final double huf;
  final double idr;
  final double ils;
  final double inr;
  final double jpy;
  final double krw;
  final double kwd;
  final double lkr;
  final double ltc;
  final double mmk;
  final double mxn;
  final double myr;
  final double ngn;
  final double nok;
  final double nzd;
  final double php;
  final double pkr;
  final double pln;
  final double rub;
  final double sar;
  final double sek;
  final double sgd;
  final double thb;
  final double tTry;
  final double twd;
  final double uah;
  final double usd;
  final double vef;
  final double vnd;
  final double xag;
  final double xau;
  final double xdr;
  final double xlm;
  final double xrp;
  final double yfi;
  final double zar;
  final double bits;
  final double link;
  final double sats;
  PriceChangePercentage7dInCurrency({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });
  factory PriceChangePercentage7dInCurrency.fromJson(
          Map<String, dynamic> json) =>
      _$PriceChangePercentage7dInCurrencyFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PriceChangePercentage7dInCurrencyToJson(this);
}

@JsonSerializable()
class PriceChangePercentage14dInCurrency {
  final double aed;
  final double ars;
  final double aud;
  final double bch;
  final double bdt;
  final double bhd;
  final double bmd;
  final double bnb;
  final double brl;
  final int btc;
  final double cad;
  final double chf;
  final double clp;
  final double cny;
  final double czk;
  final double dkk;
  final double dot;
  final double eos;
  final double eth;
  final double eur;
  final double gbp;
  final double hkd;
  final double huf;
  final double idr;
  final double ils;
  final double inr;
  final double jpy;
  final double krw;
  final double kwd;
  final double lkr;
  final double ltc;
  final double mmk;
  final double mxn;
  final double myr;
  final double ngn;
  final double nok;
  final double nzd;
  final double php;
  final double pkr;
  final double pln;
  final double rub;
  final double sar;
  final double sek;
  final double sgd;
  final double thb;
  final double tTry;
  final double twd;
  final double uah;
  final double usd;
  final double vef;
  final double vnd;
  final double xag;
  final double xau;
  final double xdr;
  final double xlm;
  final double xrp;
  final double yfi;
  final double zar;
  final double bits;
  final double link;
  final double sats;
  PriceChangePercentage14dInCurrency({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });

  factory PriceChangePercentage14dInCurrency.fromJson(
          Map<String, dynamic> json) =>
      _$PriceChangePercentage14dInCurrencyFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PriceChangePercentage14dInCurrencyToJson(this);
}

@JsonSerializable()
class PriceChangePercentage30dInCurrency {
  final double aed;
  final double ars;
  final double aud;
  final double bch;
  final double bdt;
  final double bhd;
  final double bmd;
  final double bnb;
  final double brl;
  final int btc;
  final double cad;
  final double chf;
  final double clp;
  final double cny;
  final double czk;
  final double dkk;
  final double dot;
  final double eos;
  final double eth;
  final double eur;
  final double gbp;
  final double hkd;
  final double huf;
  final double idr;
  final double ils;
  final double inr;
  final double jpy;
  final double krw;
  final double kwd;
  final double lkr;
  final double ltc;
  final double mmk;
  final double mxn;
  final double myr;
  final double ngn;
  final double nok;
  final double nzd;
  final double php;
  final double pkr;
  final double pln;
  final double rub;
  final double sar;
  final double sek;
  final double sgd;
  final double thb;
  final double tTry;
  final double twd;
  final double uah;
  final double usd;
  final double vef;
  final double vnd;
  final double xag;
  final double xau;
  final double xdr;
  final double xlm;
  final double xrp;
  final double yfi;
  final double zar;
  final double bits;
  final double link;
  final double sats;
  PriceChangePercentage30dInCurrency({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });
  factory PriceChangePercentage30dInCurrency.fromJson(
          Map<String, dynamic> json) =>
      _$PriceChangePercentage30dInCurrencyFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PriceChangePercentage30dInCurrencyToJson(this);
}

@JsonSerializable()
class PriceChangePercentage60dInCurrency {
  final double aed;
  final double ars;
  final double aud;
  final double bch;
  final double bdt;
  final double bhd;
  final double bmd;
  final double bnb;
  final double brl;
  final int btc;
  final double cad;
  final double chf;
  final double clp;
  final double cny;
  final double czk;
  final double dkk;
  final double dot;
  final double eos;
  final double eth;
  final double eur;
  final double gbp;
  final double hkd;
  final double huf;
  final double idr;
  final double ils;
  final double inr;
  final double jpy;
  final double krw;
  final double kwd;
  final double lkr;
  final double ltc;
  final double mmk;
  final double mxn;
  final double myr;
  final double ngn;
  final double nok;
  final double nzd;
  final double php;
  final double pkr;
  final double pln;
  final double rub;
  final double sar;
  final double sek;
  final double sgd;
  final double thb;
  final double tTry;
  final double twd;
  final double uah;
  final double usd;
  final double vef;
  final double vnd;
  final double xag;
  final double xau;
  final double xdr;
  final double xlm;
  final double xrp;
  final double yfi;
  final double zar;
  final double bits;
  final double link;
  final double sats;
  PriceChangePercentage60dInCurrency({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });

  factory PriceChangePercentage60dInCurrency.fromJson(
          Map<String, dynamic> json) =>
      _$PriceChangePercentage60dInCurrencyFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PriceChangePercentage60dInCurrencyToJson(this);
}
