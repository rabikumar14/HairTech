class IntentResponse {
  String status;
  String clientSecret;
  String paymentIntent;
  List charge;

  IntentResponse(
      this.status, this.clientSecret, this.paymentIntent, this.charge);
}
