import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  
  Future<List<UserFetchDto>> getAllUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/api/users'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['data'];
      return jsonData.map((user) => UserFetchDto.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<UserFetchDto> getUserById(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/api/users/$userId'));
    if (response.statusCode == 200) {
      return UserFetchDto.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<void> createUser(Map<String, dynamic> userData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/users'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(userData),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create user');
    }
  }

  Future<void> updateUser(int userId, Map<String, dynamic> userData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/users/$userId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(userData),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update user');
    }
  }

  Future<void> deleteUser(int userId) async {
    final response = await http.delete(Uri.parse('$baseUrl/api/users/$userId'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
  }


  Future<List<HospitalVisitFetchDto>> getAllHospitalVisits() async {
    final response = await http.get(Uri.parse('$baseUrl/api/visits'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['data'];
      return jsonData.map((visit) => HospitalVisitFetchDto.fromJson(visit)).toList();
    } else {
      throw Exception('Failed to load hospital visits');
    }
  }

  Future<HospitalVisitFetchDto> getHospitalVisitById(int visitId) async {
    final response = await http.get(Uri.parse('$baseUrl/api/visits/$visitId'));
    if (response.statusCode == 200) {
      return HospitalVisitFetchDto.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to load hospital visit');
    }
  }

  Future<void> createHospitalVisit(Map<String, dynamic> visitData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/visits'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(visitData),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create hospital visit');
    }
  }

  Future<void> updateHospitalVisit(int visitId, Map<String, dynamic> visitData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/visits/$visitId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(visitData),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update hospital visit');
    }
  }

  Future<void> deleteHospitalVisit(int visitId) async {
    final response = await http.delete(Uri.parse('$baseUrl/api/visits/$visitId'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete hospital visit');
    }
  }

  
  Future<List<ClaimFetchDto>> getAllClaims() async {
    final response = await http.get(Uri.parse('$baseUrl/api/claims'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['data'];
      return jsonData.map((claim) => ClaimFetchDto.fromJson(claim)).toList();
    } else {
      throw Exception('Failed to load claims');
    }
  }

  Future<ClaimFetchDto> getClaimById(int claimId) async {
    final response = await http.get(Uri.parse('$baseUrl/api/claims/$claimId'));
    if (response.statusCode == 200) {
      return ClaimFetchDto.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to load claim');
    }
  }

  Future<void> createClaim(Map<String, dynamic> claimData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/claims'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(claimData),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create claim');
    }
  }

  Future<void> updateClaim(int claimId, Map<String, dynamic> claimData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/claims/$claimId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(claimData),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update claim');
    }
  }

  Future<void> deleteClaim(int claimId) async {
    final response = await http.delete(Uri.parse('$baseUrl/api/claims/$claimId'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete claim');
    }
  }


  Future<List<PaymentFetchDto>> getAllPayments() async {
    final response = await http.get(Uri.parse('$baseUrl/api/payments'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['data'];
      return jsonData.map((payment) => PaymentFetchDto.fromJson(payment)).toList();
    } else {
      throw Exception('Failed to load payments');
    }
  }

  Future<PaymentFetchDto> getPaymentById(int paymentId) async {
    final response = await http.get(Uri.parse('$baseUrl/api/payments/$paymentId'));
    if (response.statusCode == 200) {
      return PaymentFetchDto.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to load payment');
    }
  }

  Future<void> createPayment(Map<String, dynamic> paymentData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/payments'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(paymentData),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create payment');
    }
  }

  Future<void> updatePayment(int paymentId, Map<String, dynamic> paymentData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/payments/$paymentId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(paymentData),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update payment');
    }
  }

  Future<void> deletePayment(int paymentId) async {
    final response = await http.delete(Uri.parse('$baseUrl/api/payments/$paymentId'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete payment');
    }
  }

  // User Payment Plans
  Future<List<UserPaymentPlanFetchDto>> getAllUserPaymentPlans() async {
    final response = await http.get(Uri.parse('$baseUrl/api/userPaymentPlan'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['data'];
      return jsonData.map((plan) => UserPaymentPlanFetchDto.fromJson(plan)).toList();
    } else {
      throw Exception('Failed to load user payment plans');
    }
  }

  Future<UserPaymentPlanFetchDto> getUserPaymentPlanById(int planId) async {
    final response = await http.get(Uri.parse('$baseUrl/api/userPaymentPlan/$planId'));
    if (response.statusCode == 200) {
      return UserPaymentPlanFetchDto.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to load user payment plan');
    }
  }

  Future<void> createUserPaymentPlan(Map<String, dynamic> planData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/userPaymentPlan'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(planData),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create user payment plan');
    }
  }

  Future<void> updateUserPaymentPlan(int planId, Map<String, dynamic> planData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/userPaymentPlan/$planId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(planData),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update user');
    }

  }

}
