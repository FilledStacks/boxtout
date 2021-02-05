import { BoxtOutApi } from '../../system/boxtoutApi';

let paymentsApi = new BoxtOutApi('Payments');
paymentsApi.build();
exports.api = paymentsApi.router;