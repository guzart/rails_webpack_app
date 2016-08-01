
const hauler = require('hauler');
const env = String(process.env.RAILS_ENV || process.env.NODE_ENV);

const config = hauler.getCompilerConfig(env, __dirname);
module.exports = config;
