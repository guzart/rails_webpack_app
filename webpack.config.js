
const hauler = require('hauler');
const env = String(process.env.RAILS_ENV || process.env.NODE_ENV);

module.exports = hauler.getCompilerConfig(env);
