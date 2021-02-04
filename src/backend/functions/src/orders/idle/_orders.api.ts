import { BoxtOutApi } from '../../system/boxtoutApi';

let ordersApi = new BoxtOutApi('Orders');
ordersApi.build();
exports.api = ordersApi.router;