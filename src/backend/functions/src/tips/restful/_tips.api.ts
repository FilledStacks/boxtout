import { BoxtOutApi } from '../../system/boxtoutApi';

let tipsApi = new BoxtOutApi('Tips');
tipsApi.build();
exports.api = tipsApi.router;