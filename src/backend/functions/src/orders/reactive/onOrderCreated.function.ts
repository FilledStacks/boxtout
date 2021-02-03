import * as functions from 'firebase-functions';

exports.onOrderCreated = functions.firestore
  .document("orders/{orderId}")
  .onCreate(async (snapshot) => {
    console.log(`order | orderId:${snapshot.id}`);
  });
