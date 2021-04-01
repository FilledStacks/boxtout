import { Request, Response } from 'express';
import { Endpoint, RequestType } from 'firebase-backend';

export default new Endpoint(
  'addAddress',
  RequestType.POST,
  (request: Request, response: Response) => {
    response.status(200).send();
  }
);
