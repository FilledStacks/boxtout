import { Request, Response } from 'express';
import { Endpoint, RequestType } from 'firebase-backend';

export default new Endpoint(
  'getMenuItems',
  RequestType.GET,
  (request: Request, response: Response) => {
    response.send({
      orders: [
        { id: 1, name: 'Steak with Jalepeno' },
        { id: 2, name: 'Kiwi Milkshake' },
      ],
    });
  }
);
