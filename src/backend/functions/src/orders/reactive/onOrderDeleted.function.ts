import * as functions from 'firebase-functions';

exports.onOrderDeleted = functions.firestore
  .document('orders/{orderId}')
  .onDelete(async (snapshot, context) => {
    console.log(`Order deleted | orderId:${snapshot.id}`);
  });
