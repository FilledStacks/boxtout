// import * as functions from 'firebase-functions';
// import * as admin from 'firebase-admin';
// import * as express from 'express';
// import * as bodyParser from "body-parser";

// //initialize firebase inorder to access its services
// admin.initializeApp(functions.config().firebase);

// //initialize express server
// const app = express();
// const main = express();

// //add the path to receive request and set json as bodyParser to process the body 
// main.use('/', app);
// main.use(bodyParser.json());
// main.use(bodyParser.urlencoded({ extended: false }));

// app.get('/hello', async (req, res) => {
//   try {
//     res.status(200).json('World!');
//   } catch (error) {
//     res.status(500).send(error);
//   }
// });

//define google cloud function name
// exports = module.exports = functions.https.onRequest(main);

// Start writing Firebase Functions
// https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });

/** EXPORT ALL FUNCTIONS
 *
 *   Loads all `.f.js` files
 *   Exports a cloud function matching the file name
 *   Author: David King
 *   Edited: Tarik Huber
 *   Based on this thread:
 *     https://github.com/firebase/functions-samples/issues/170
 */
const glob = require("glob");
const camelCase = require("camelcase");
const files = glob.sync('./**/*.function.js', { cwd: __dirname, ignore: './node_modules/**' });
for (let f = 0, fl = files.length; f < fl; f++) {
  const file = files[f];
  const groupName = file.split('/')[1];
  console.log(`groupName:${groupName}`);
  console.log(`File: ${file}`);
  const functionName = file.split('/')[3].slice(0, -12); // Strip off '.function.js'
  console.log(`functionName:${functionName}`);

  const fileInfo = require(file);
  console.log(`fileInfo:${JSON.stringify(fileInfo)}`);

  if (!process.env.FUNCTION_NAME || process.env.FUNCTION_NAME === functionName) {
    if (!exports[groupName]) {
      // This creates exports['orders']
      exports[groupName] = {};
    }

    exports[groupName] = {
      ...exports[groupName],
      ...require(file)
    }
  }
}