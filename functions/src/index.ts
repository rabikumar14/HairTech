
import * as functions from "firebase-functions";
import utils = require("./utils");
import getEphemeralKeyHandler = require("./handlers/getEphemeralKeyHandler");
import setupUserHandler = require("./handlers/setupUserHandler");
import cleanupUserHandler = require("./handlers/cleanupUserHandler");
import createSetupIntentHandler = require("./handlers/createSetupIntentHandler");
import createAutomaticPaymentIntentHandler = require("./handlers/createAutomaticPaymentIntentHandler");
import createManualPaymentIntentHandler = require("./handlers/createManualPaymentIntentHandler");
const region = "asia-east2";
const memory = "128MB";


exports.updateUser = functions.region(region).https.onCall(async (data: any) => {

  const customer = data.customer;
  await utils.stripe.customers.update(customer, {
    name: data.name,
  });
});

exports.setupUser = functions.runWith({memory: memory}).region(region).auth.user().onCreate(setupUserHandler.setupUserHandler);

exports.cleanupUser = functions.runWith({memory: memory}).region(region).auth.user().onDelete(cleanupUserHandler.cleanupUserHandler);

exports.createSetupIntent = utils.onCall(createSetupIntentHandler.createSetupIntentHandler);

exports.getEphemeralKey = utils.onCall(getEphemeralKeyHandler.getEphemeralKeyHandler);

exports.createAutomaticPaymentIntent = utils.onCall(createAutomaticPaymentIntentHandler.createAutomaticPaymentIntentHandler);

exports.createManualPaymentIntent = utils.onCall(createManualPaymentIntentHandler.createManualPaymentIntentHandler);
