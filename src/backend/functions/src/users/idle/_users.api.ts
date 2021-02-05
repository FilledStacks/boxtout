import { BoxtOutApi } from '../../system/boxtoutApi';

let usersApi = new BoxtOutApi('Users');
usersApi.build();
exports.api = usersApi.router;