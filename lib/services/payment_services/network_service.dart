import 'dart:convert';
import 'dart:developer';

import 'package:Beautech/services/payment_services/stripe_sdk/src/ui/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NetworkService {
  final CloudFunctions _cf;

  NetworkService(this._cf);

  NetworkService.defaultInstance()
      : _cf = CloudFunctions(region: 'europe-west2');

  /// Utility function to call a Firebase Function
  Future<T> _call<T>(String name, Map params) async {
    log('NetworkService._call, $name, $params');
    final callable = _cf.getHttpsCallable(
      functionName: name,
    );
    try {
      final result = await callable.call(params);
      print(result);
      print(result.data);
      return result.data;
    } on CloudFunctionsException catch (e) {
      log(e.message);
      log(e.toString());
      return null;
    }
  }

  /// Get a stripe ephemeral key
  Future<String> getEphemeralKey(String apiVersion) async {
    final result =
        await _call('getEphemeralKey', {'stripeVersion': apiVersion});
    final key = result['key'];
    final jsonKey = json.encode(key);
    return jsonKey;
  }

  Future updateUser(User user) async {
    var document =
        await FirebaseFirestore.instance.collection('user').doc(user.uid).get();
    await _call('updateUser',
        {'name': user.displayName, 'customer': document.data()['stripeId']});

  
  }

  Future<IntentResponse> refundPayment(String charge) async {
    final params = {
      'charge': charge,
    };

    final response = await _call('refundOrder', params);

    return IntentResponse(response['status'], response['clientSecret'],
        response['paymentIntent'], response['charge']);
  }

  Future<IntentResponse> refund(String pi, String ch) async {
    final params = {
      'charge': ch,
      'payment_intent': pi,
    };
    final response = await _call('refundFullOrder', params);
    return IntentResponse(response['status'], response['clientSecret'],
        response['paymentIntent'], response['charge']);
  }

  // ignore: deprecated_member_use
  Future<IntentResponse> createAutomaticPaymentIntent(int amount) async {
    final params = {
      "amount": amount,
    };
    final response = await _call('createAutomaticPaymentIntent', params);
    // ignore: deprecated_member_use
    return IntentResponse(response['status'], response['clientSecret'],
        response['paymentIntent'], response['charge']);
  }

  Future<IntentResponse> getPaymentData(String pi) async {
    final params = {
      "paymentIntent": pi,
    };
    final response = await _call('getPaymentIntentData', params);
    // ignore: deprecated_member_use
    return IntentResponse(response['status'], response['clientSecret'],
        response['paymentIntent'], response['charge']);
  }

  // Future<IntentResponse> createSetupIntent() async {
  //   final response = await _call('createSetupIntent', {});
  //   return IntentResponse(response['status'], response['clientSecret']);
  // }

  // Future<IntentResponse> createSetupIntentWithPaymentMethod(paymentMethod, String returnUrl) async {
  //   final params = {'paymentMethod': paymentMethod, 'returnUrl': returnUrl};
  //   final response = await _call('createSetupIntent', params);
  //   return IntentResponse(response['status'], response['clientSecret']);
  // }

  // Future<IntentResponse> createAutomaticPaymentIntent(int amount) async {
  //   final params = {
  //     'amount': amount,
  //   };
  //   final response = await _call('createAutomaticPaymentIntent', params);
  //   return IntentResponse(response['status'], response['clientSecret']);
  // }

  // Future<Map> createManualPaymentIntent(int amount, String paymentMethod, String returnUrl) {
  //   final params = {'amount': amount, 'paymentMethod': paymentMethod, 'returnUrl': returnUrl};
  //   return _call('createManualPaymentIntent', params);
  // }
}
