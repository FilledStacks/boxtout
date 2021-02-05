import { Request, Response } from 'express';
import { GetRequest } from '../../system/constants/requests';


// Each endpoint will be defined in its own file for long term maintenance.
// The name of the endpoint should match the name of the file. This is to ensure automatica addition to the api
// Each endpoint has to export the request type that it's expecting.

exports.getOrders = (req: Request, res: Response) => {
  res.send({
    orders: [
      { id: 1, name: 'Steak with Jalepeno' },
      { id: 2, name: 'Kiwi and Yoghur bowl' },
    ]
  });
}

exports.requestType = GetRequest;