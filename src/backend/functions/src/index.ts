import * as functions from 'firebase-functions';
// import * as admin from 'firebase-admin';
import * as express from 'express';
import * as bodyParser from "body-parser";

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

const functionFiles = glob.sync('./**/*.function.js', { cwd: __dirname, ignore: './node_modules/**' });

for (let f = 0, fl = functionFiles.length; f < fl; f++) {
  const file = functionFiles[f];
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

const apiFiles = glob.sync('./**/*.api.js', { cwd: __dirname, ignore: './node_modules/**' });

for (let f = 0, fl = apiFiles.length; f < fl; f++) {
  const file = apiFiles[f];
  const groupName = file.split('/')[1];
  console.log(`groupName:${groupName}`);
  console.log(`File: ${file}`);

  const api = require(file);
  const app = express();

  app.use('/', api.api);
  app.use(bodyParser.json());
  app.use(bodyParser.urlencoded({ extended: false }));

  exports[groupName] = {
    ...exports[groupName],
    "api": functions.https.onRequest(app),
  }
}
