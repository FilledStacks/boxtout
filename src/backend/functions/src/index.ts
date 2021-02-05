import { ExportHelper } from './system/exportHelper';

let exportHelper = new ExportHelper(exports);

exportHelper.buildReactiveFunctions();
exportHelper.buildIdleApi();

exports = exportHelper.exports;