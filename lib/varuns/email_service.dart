import 'package:cloud_functions/cloud_functions.dart';

final HttpsCallable genericEmail = CloudFunctions.instance.getHttpsCallable(
  functionName: 'genericEmail',
);
final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
  functionName: 'helpMail',
);

final HttpsCallable callableHelp = CloudFunctions.instance.getHttpsCallable(
  functionName: 'helpMails',
);

senHelpEmail(String items, String orderId, String request, String subject,
    String email) {
  return callable.call({
    'text': items,
    'subject': subject,
    'status': email,
    'request': request,
    'order': orderId
  }).then((res) => print(res.data));
}

sendHelpMailsClient(String items, String orderId, String request,
    String subject, String email) {
  return callableHelp.call({
    'text': items,
    'subject': subject,
    'status': email,
    'request': request,
    'order': orderId
  }).then((res) => print(res.data));
}

sendEmail(
    String items, String orderId, String value, String address, String name) {
  return genericEmail.call({
    'text': items,
    'subject': orderId,
    'address': address,
    'total': value,
    'name': name
  }).then((res) => print(res.data));
}
