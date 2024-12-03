class UserFetchDto {
  final String name;
  final String idNo;
  final String imagePath;

  UserFetchDto({required this.name, required this.idNo, required this.imagePath});

  factory UserFetchDto.fromJson(Map<String, dynamic> json) {
    return UserFetchDto(
      name: json['name'],
      idNo: json['idNo'],
      imagePath: json['imagePath'],
    );
  }
}

class HospitalVisitFetchDto {
  final UserFetchDto user;
  final String currentDate;

  HospitalVisitFetchDto({required this.user, required this.currentDate});

  factory HospitalVisitFetchDto.fromJson(Map<String, dynamic> json) {
    return HospitalVisitFetchDto(
      user: UserFetchDto.fromJson(json['user']),
      currentDate: json['currentDate'],
    );
  }
}

class ClaimFetchDto {
  final String status;
  final HospitalVisitFetchDto visit;

  ClaimFetchDto({required this.status, required this.visit});

  factory ClaimFetchDto.fromJson(Map<String, dynamic> json) {
    return ClaimFetchDto(
      status: json['status'],
      visit: HospitalVisitFetchDto.fromJson(json['visit']),
    );
  }
}


class PaymentFetchDto {
  final UserFetchDto user;
  final double amount;
  final String dateOfPayment;

  PaymentFetchDto({
    required this.user,
    required this.amount,
    required this.dateOfPayment,
  });

  factory PaymentFetchDto.fromJson(Map<String, dynamic> json) {
    return PaymentFetchDto(
      user: UserFetchDto.fromJson(json['user']),
      amount: json['amount'],
      dateOfPayment: json['dateOfPayment'],
    );
  }
}

class UserPaymentPlanFetchDto {
  final UserFetchDto user;
  final double amount;
  final String paymentPlan;

  UserPaymentPlanFetchDto({
    required this.user,
    required this.amount,
    required this.paymentPlan,
  });

  factory UserPaymentPlanFetchDto.fromJson(Map<String, dynamic> json) {
    return UserPaymentPlanFetchDto(
      user: UserFetchDto.fromJson(json['user']),
      amount: json['amount'],
      paymentPlan: json['paymentPlan'],
    );
  }
}

