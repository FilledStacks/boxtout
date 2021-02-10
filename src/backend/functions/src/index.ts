import { ExportHelper } from './system/exportHelper';

let exportHelper = new ExportHelper(exports);

exportHelper.buildReactiveFunctions();
exportHelper.buildRestfulApi();

exports = exportHelper.exports;