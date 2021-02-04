import * as express from 'express';
import * as requestTypes from '../constants/requests';


/**
 * This class builds an Api using the conventions defined for boxt out.
 * The name of the api should match the name of the folder that it's in.
 */
export class BoxtOutApi {
  router: express.Router;
  name: string;

  constructor(name: string) {
    this.name = name;
    this.router = express.Router();
  }

  /**
   * Builds the api using all the .endpoint.js files defined at the same level as the api
   */
  build() {
    const glob = require("glob");

    const endpointFiles = glob.sync(`../${this.name.toLowerCase()}/**/*.endpoint.js`, { cwd: __dirname, ignore: './node_modules/**' });
    console.log(`build - endpointFiles:${endpointFiles}`);
    for (let f = 0, fl = endpointFiles.length; f < fl; f++) {
      const file = endpointFiles[f];
      const functionName = file.split('/')[3].slice(0, -12);
      console.log(`${this.name}Api - functionName: ${functionName}`);
      var endpoint = require(file);

      if (endpoint[functionName] === undefined) {
        throw new Error(`Failed to add the endpoint defined in ${file} to the ${this.name} Api. Please make sure that the exported function name is exactly the same as the file name before .endpoint.ts. For example the endpoint defined in "checkout.endpoint.ts" should be exported as "exports.checkout".`);
      }

      if (endpoint.requestType === undefined) {
        throw new Error(`No requestType defined for endpoint in ${file}. Please make sure that the endpoint file exports a requestType using the constants in src/constants/requests.ts. We need this value to automatically add the endpoing to the api.`);
      }

      console.log(`${this.name}Api - add functionName: ${functionName} as ${endpoint.requestType} endpoint.`);
      switch (endpoint.requestType) {
        case requestTypes.GetRequest:
          this.router.get(`/${functionName}`, endpoint[functionName]);
          break;
        case requestTypes.PostRequest:
          this.router.post(`/${functionName}`, endpoint[functionName]);
          break;
        case requestTypes.PutRequest:
          this.router.put(`/${functionName}`, endpoint[functionName]);
          break;
        case requestTypes.DeleteRequest:
          this.router.delete(`/${functionName}`, endpoint[functionName]);
          break;
        default:
          break;
      }

    }
  }
}