import 'dart:convert';
import '../../../widgets/common/custom_drop_down/custom_drop_down.dart';

AddMoneyInfoModel addMoneyInfoModelFromJson(String str) =>
    AddMoneyInfoModel.fromJson(json.decode(str));

String addMoneyInfoModelToJson(AddMoneyInfoModel data) =>
    json.encode(data.toJson());

class AddMoneyInfoModel {
  Message message;
  Data data;

  AddMoneyInfoModel({
    required this.message,
    required this.data,
  });

  factory AddMoneyInfoModel.fromJson(Map<String, dynamic> json) =>
      AddMoneyInfoModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  String baseCurr;
  String baseCurrRate;
  String defaultImage;
  String imagePath;
  String baseUrl;
  UserWallet userWallet;
  List<Gateway> gateways;
  List<Transactionss> transactionss;

  Data({
    required this.baseCurr,
    required this.baseCurrRate,
    required this.defaultImage,
    required this.imagePath,
    required this.baseUrl,
    required this.userWallet,
    required this.gateways,
    required this.transactionss,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        baseCurr: json["base_curr"],
        baseCurrRate: json["base_curr_rate"],
        defaultImage: json["default_image"],
        imagePath: json["image_path"],
        baseUrl: json["base_url"],
        userWallet: UserWallet.fromJson(json["userWallet"]),
        gateways: List<Gateway>.from(
            json["gateways"].map((x) => Gateway.fromJson(x))),
        transactionss: List<Transactionss>.from(
            json["transactionss"].map((x) => Transactionss.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "base_curr": baseCurr,
        "base_curr_rate": baseCurrRate,
        "default_image": defaultImage,
        "image_path": imagePath,
        "base_url": baseUrl,
        "userWallet": userWallet.toJson(),
        "gateways": List<dynamic>.from(gateways.map((x) => x.toJson())),
        "transactionss":
            List<dynamic>.from(transactionss.map((x) => x.toJson())),
      };
}

class Gateway {
  int id;
  dynamic image;
  String slug;
  int code;
  String type;
  String alias;
  List<String> supportedCurrencies;
  int status;
  List<Currency> currencies;

  Gateway({
    required this.id,
    this.image,
    required this.slug,
    required this.code,
    required this.type,
    required this.alias,
    required this.supportedCurrencies,
    required this.status,
    required this.currencies,
  });

  factory Gateway.fromJson(Map<String, dynamic> json) => Gateway(
        id: json["id"],
        image: json["image"] ?? '',
        slug: json["slug"],
        code: json["code"],
        type: json["type"],
        alias: json["alias"],
        supportedCurrencies:
            List<String>.from(json["supported_currencies"].map((x) => x)),
        status: json["status"],
        currencies: List<Currency>.from(
            json["currencies"].map((x) => Currency.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "slug": slug,
        "code": code,
        "type": type,
        "alias": alias,
        "supported_currencies":
            List<dynamic>.from(supportedCurrencies.map((x) => x)),
        "status": status,
        "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
      };
}

class Currency implements DropdownModel {
  int id;
  int paymentGatewayId;
  String type;
  String name;
  String alias;
  String currencyCode;
  String currencySymbol;
  dynamic image;
  dynamic minLimit;
  dynamic maxLimit;
  dynamic percentCharge;
  dynamic fixedCharge;
  dynamic rate;

  Currency({
    required this.id,
    required this.paymentGatewayId,
    required this.type,
    required this.name,
    required this.alias,
    required this.currencyCode,
    required this.currencySymbol,
    this.image,
    this.minLimit,
    this.maxLimit,
    this.percentCharge,
    this.fixedCharge,
    this.rate,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        paymentGatewayId: json["payment_gateway_id"],
        type: json["type"],
        name: json["name"],
        alias: json["alias"],
        currencyCode: json["currency_code"],
        currencySymbol: json["currency_symbol"],
        image: json["image"] ?? '',
        minLimit: json["min_limit"]?.toDouble() ?? 0.0,
        maxLimit: json["max_limit"]?.toDouble() ?? 0.0,
        percentCharge: json["percent_charge"]?.toDouble() ?? 0.0,
        fixedCharge: json["fixed_charge"]?.toDouble() ?? 0.0,
        rate: json["rate"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "payment_gateway_id": paymentGatewayId,
        "type": type,
        "name": name,
        "alias": alias,
        "currency_code": currencyCode,
        "currency_symbol": currencySymbol,
        "image": image,
        "min_limit": minLimit,
        "max_limit": maxLimit,
        "percent_charge": percentCharge,
        "fixed_charge": fixedCharge,
        "rate": rate,
      };

  @override
  String get img => image;

  @override
  String get title => name;
}

class UserWallet {
  String baseUrl;
  String defaultImage;
  String imagePath;
  dynamic flag;
  String name;
  String balance;
  String currency;

  UserWallet({
    required this.baseUrl,
    required this.defaultImage,
    required this.imagePath,
    this.flag,
    required this.name,
    required this.balance,
    required this.currency,
  });

  factory UserWallet.fromJson(Map<String, dynamic> json) => UserWallet(
        baseUrl: json["base_url"],
        defaultImage: json["default_image"],
        imagePath: json["image_path"],
        flag: json["flag"] ?? '',
        name: json["name"],
        balance: json["balance"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "default_image": defaultImage,
        "image_path": imagePath,
        "flag": flag,
        "name": name,
        "balance": balance,
        "currency": currency,
      };
}

class Transactionss {
  int id;
  String trx;
  String gatewayName;
  String transactionType;
  String requestAmount;
  String payable;
  String exchangeRate;
  String totalCharge;
  String currentBalance;
  String status;
  String rejectionReason;
  DateTime createdAt;

  Transactionss({
    required this.id,
    required this.trx,
    required this.gatewayName,
    required this.transactionType,
    required this.requestAmount,
    required this.payable,
    required this.exchangeRate,
    required this.totalCharge,
    required this.currentBalance,
    required this.status,
    required this.rejectionReason,
    required this.createdAt,
  });

  factory Transactionss.fromJson(Map<String, dynamic> json) => Transactionss(
        id: json["id"],
        trx: json["trx"],
        gatewayName: json["gateway_name"],
        transactionType: json["transaction_type"],
        requestAmount: json["request_amount"],
        payable: json["payable"],
        exchangeRate: json["exchange_rate"],
        totalCharge: json["total_charge"],
        currentBalance: json["current_balance"],
        status: json["status"],
        rejectionReason: json["rejection_reason"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "trx": trx,
        "gateway_name": gatewayName,
        "transaction_type": transactionType,
        "request_amount": requestAmount,
        "payable": payable,
        "exchange_rate": exchangeRate,
        "total_charge": totalCharge,
        "current_balance": currentBalance,
        "status": status,
        "rejection_reason": rejectionReason,
        "created_at": createdAt.toIso8601String(),
      };
}

class Message {
  List<String> success;

  Message({
    required this.success,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        success: List<String>.from(json["success"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": List<dynamic>.from(success.map((x) => x)),
      };
}
