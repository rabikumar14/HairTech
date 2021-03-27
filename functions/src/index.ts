
import * as functions from "firebase-functions";
import utils = require("./utils");
import getEphemeralKeyHandler = require("./handlers/getEphemeralKeyHandler");
import setupUserHandler = require("./handlers/setupUserHandler");
import cleanupUserHandler = require("./handlers/cleanupUserHandler");
import createSetupIntentHandler = require("./handlers/createSetupIntentHandler");

import createManualPaymentIntentHandler = require("./handlers/createManualPaymentIntentHandler");
const region = "asia-east2";
const memory = "128MB";


exports.updateUser = functions.https.onCall(async (data: any, context: functions.https.CallableContext) => {

  const customer = data.customer;
  await utils.stripe.customers.update(customer, {
    name: data.name,
  });

  return { success: true }
});


exports.testFunction = functions.https.onCall((data: any, context: functions.https.CallableContext) => { return 'hello, world' })


exports.getPaymentIntentData = functions.https.onCall(async (data: any, context: functions.https.CallableContext) => {

  // @ts-ignore
  const customerId = await getStripeCustomerId(getRequestingUserId(context));
  const paymentIntent = data.paymentIntent;

  const intent = await utils.stripe.paymentIntents.retrieve(
    paymentIntent
  );


  return { status: intent.status, clientSecret: intent.client_secret, paymentIntent: intent.charges.data[0].id, charge: intent.charges.data }
});

exports.createAutomaticPaymentIntentHandler = functions.https.onCall(async (data: any, context: functions.https.CallableContext) => {

  const customerId = await utils.getStripeCustomerId(utils.getRequestingUserId(context));
  const amount = data.amount;
 

  const intent = await utils.stripe.paymentIntents.create({
    customer: customerId,
    amount: amount,
    currency: "SGD",

  });
  return { status: intent.status, clientSecret: intent.client_secret, paymentIntent: intent.id, charge: intent.charges.data };
});


exports.refundFullOrder = functions.https.onCall(async (data: any, context: functions.https.CallableContext) => {

  
  const refund = await utils.stripe.refunds.create({
      charge: data.charge,
      payment_intent: data.paymentIntent,
  });

  return refund.status
});



exports.setupUser = functions.runWith({ memory: memory }).region(region).auth.user().onCreate(setupUserHandler.setupUserHandler);

exports.cleanupUser = functions.runWith({ memory: memory }).region(region).auth.user().onDelete(cleanupUserHandler.cleanupUserHandler);

exports.createSetupIntent = utils.onCall(createSetupIntentHandler.createSetupIntentHandler);

exports.getEphemeralKey = utils.onCall(getEphemeralKeyHandler.getEphemeralKeyHandler);

//exports.createAutomaticPaymentIntent = utils.onCall(createAutomaticPaymentIntentHandler.createAutomaticPaymentIntentHandler);

exports.createManualPaymentIntent = utils.onCall(createManualPaymentIntentHandler.createManualPaymentIntentHandler);
