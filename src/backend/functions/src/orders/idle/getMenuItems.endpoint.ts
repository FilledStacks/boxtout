import { Request, Response } from 'express';
import { GetRequest } from '../../system/constants/requests';

exports.getMenuItems = (req: Request, res: Response) => {
  res.send({
    orders: [
      { id: 1, name: 'Steak with Jalepeno' },
      { id: 2, name: 'Kiwi and Yoghur bowl' },
    ]
  });
}

exports.requestType = GetRequest;