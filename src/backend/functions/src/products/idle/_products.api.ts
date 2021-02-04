import { BoxtOutApi } from '../../system/boxtoutApi';

let productsApi = new BoxtOutApi('Products');
productsApi.build();
exports.api = productsApi.router;