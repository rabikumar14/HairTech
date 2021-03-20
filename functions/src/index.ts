// @ts-ignore
import * as functions from "firebase-functions";

import * as sgMail from "@sendgrid/mail"
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });

// @ts-ignore
const utils_1 = require("./utils");
const getEphemeralKeyHandler_1 = require("./handlers/getEphemeralKeyHandler");
const setupUserHandler_1 = require("./handlers/setupUserHandler");
const cleanupUserHandler_1 = require("./handlers/cleanupUserHandler");
const createSetupIntentHandler_1 = require("./handlers/createSetupIntentHandler");
const createAutomaticPaymentIntentHandler_1 = require("./handlers/createAutomaticPaymentIntentHandler");
const createManualPaymentIntentHandler_1 = require("./handlers/createManualPaymentIntentHandler");
const region = "asia-east2";
const memory = "128MB";
const API_KEY = functions.config().sendgrid.key;
//const API_KEY = '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';
const TEMPLATE_ID = 'd-6074a61514874982a3d3b999c8924aa9';
sgMail.setApiKey(API_KEY)

/**
 * When a new user is created, create and attach a stripe customer
 */

exports.updateUser = functions.https.onCall(async (data: any, context: functions.https.CallableContext) => {
    // @ts-ignore
    const customer = data.customer;
    await utils_1.stripe.customers.update(customer, {
        name: data.name
    });
});


exports.setupUser = functions.runWith({ memory: memory }).region(region).auth.user().onCreate(setupUserHandler_1.setupUserHandler);
/**
 * When a user is deleted, delete any attaches stripe customers
 */
exports.cleanupUser = functions.runWith({ memory: memory }).region(region).auth.user().onDelete(cleanupUserHandler_1.cleanupUserHandler);
/**
 * Add payment method
 */
exports.createSetupIntent = utils_1.onCall(createSetupIntentHandler_1.createSetupIntentHandler);
/**
 * Create ephemeral key
 */
exports.getEphemeralKey = utils_1.onCall(getEphemeralKeyHandler_1.getEphemeralKeyHandler);
/**
 * Create a Payment Intent with automatic confirmation.
 * This supports the *standard flow* as described by Stripe.
 * https://stripe.com/docs/payments/accept-a-payment#android-create-payment-intent
 */
exports.createAutomaticPaymentIntent = utils_1.onCall(createAutomaticPaymentIntentHandler_1.createAutomaticPaymentIntentHandler);
/**
 * Create a Payment Intent with manual confirmation.
 * This supports the synchronous flow as described by stripe.
 * https://stripe.com/docs/payments/accept-a-payment-synchronously#android-create-payment-intent
 */
exports.createManualPaymentIntent = utils_1.onCall(createManualPaymentIntentHandler_1.createManualPaymentIntentHandler);
//# sourceMappingURL=index.js.map
// @ts-ignore
export const sellertoseller = functions.https.onCall(async (data, context) => {


    // @ts-ignore
    if (!context.auth && !context.auth.token.email) {
        throw new functions.https.HttpsError('failed-precondition', 'Must be logged with an email address');
    }

    // @ts-ignore

    const msg = {
        // @ts-ignore
        to: context.auth.token.email,
        from:   'varunbhalerao5902@gmail.com',
        templateId: TEMPLATE_ID,
        dynamic_template_data: {
            subject: data.subject,
            name: data.text,
        },
    };

    await sgMail.send(msg);

    // Handle errors here

    // Response must be JSON serializable
    return { success: true };

});
// @ts-ignore
// Sends email via HTTP. Can be called from frontend code.
export const genericEmail = functions.https.onCall(async (data, context) => {


    // @ts-ignore
    if (!context.auth && !context.auth.token.email) {
        throw new functions.https.HttpsError('failed-precondition', 'Must be logged with an email address');
    }

    // @ts-ignore

    const msg = {
        // @ts-ignore
        to: context.auth.token.email,
        from:   'varunbhalerao5902@gmail.com',
        templateId: TEMPLATE_ID,
        dynamic_template_data: {
            subject: data.subject,
            name: data.text,
        },
    };

    await sgMail.send(msg);

    // Handle errors here

    // Response must be JSON serializable
    return { success: true };

});



