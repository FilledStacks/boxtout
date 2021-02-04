import * as express from 'express';

const api = express();
// You may add api specific middlewares here
// TODO: move all controllers in the src/api/controllers folder
api.get('/', (req, res) => {
  res.send({
    message: 'Hello from the Users',
  });
});

exports.api = api;