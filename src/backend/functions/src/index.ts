import { FunctionParser } from 'firebase-backend';
import admin = require("firebase-admin");
import { FakeDataPopulator } from './system/fakeDataPopulator';

// Initialise the admin functionality for the firebase backend
admin.initializeApp();

const firestoreDatabase = admin.firestore();

if (process.env.FUNCTIONS_EMULATOR) {
  console.log('We are running emulators locally.');

  const populator = new FakeDataPopulator(firestoreDatabase);
  populator.generateFakeData();
}

exports = new FunctionParser(__dirname, exports).exports;
