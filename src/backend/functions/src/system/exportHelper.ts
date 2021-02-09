import * as express from 'express';
import * as bodyParser from "body-parser";
import * as functions from 'firebase-functions';

/**
 * This class helps with setting up the exports for the cloud functions deployment.
 *
 * It takes in exports and then adds the required groups and their functions to it for deployment
 * to the cloud functions server.
 */
export class ExportHelper {
  exports: any;

  constructor(exports: any) {
    this.exports = exports;
  }

  /**
   * Looks for all files with .function.js and exports them on the group they belong to
   */
  buildReactiveFunctions() {
    console.log('ExportHelper - Build reactive cloud functions ... ');
    const glob = require("glob");
    // Get all the files that has .function in the file name
    const functionFiles = glob.sync('../**/*.function.js', { cwd: __dirname, ignore: './node_modules/**' });

    for (let i = 0, fl = functionFiles.length; i < fl; i++) {
      const file = functionFiles[i];
      const groupName = file.split('/')[1];
      const functionName = file.split('/')[3].slice(0, -12); // Strip off '.function.js'

      if (!process.env.FUNCTION_NAME || process.env.FUNCTION_NAME === functionName) {
        if (!this.exports[groupName]) {
          // This creates exports['orders']
          this.exports[groupName] = {};
        }

        console.log(`ExportHelper - Add reactive function ${functionName} to group ${groupName}`);

        this.exports[groupName] = {
          ...this.exports[groupName],
          ...require(file)
        }
      }
    }
    console.log('ExportHelper - Reactive functions added to exports');
  }


  /**
   * Looks at all .api.js files and adds them to the group they belong in
   */
  buildRestfulApi() {
    console.log('ExportHelper - Build api cloud functions ... ');

    const glob = require("glob");
    const apiFiles = glob.sync('../**/*.api.js', { cwd: __dirname, ignore: './node_modules/**' });

    for (let f = 0, fl = apiFiles.length; f < fl; f++) {
      const file = apiFiles[f];
      const groupName = file.split('/')[1];

      const api = require(file);
      const app = express();

      app.use('/', api.api);
      app.use(bodyParser.json());
      app.use(bodyParser.urlencoded({ extended: false }));

      console.log(`ExportHelper - Add api for ${groupName}`);

      this.exports[groupName] = {
        ...this.exports[groupName],
        "api": functions.https.onRequest(app),
      }
    }

    console.log(`ExportHelper - Api function added to exports ... `);
  }
}