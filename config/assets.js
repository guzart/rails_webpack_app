const filter = require('ramda/src/filter');
const contains = require('ramda/src/contains');
const uniq = require('ramda/src/uniq');

const RailsWebpack = {
  dllPlugin: {
    defaults: {
      exclude: [],
      include: ['babel-polyfill'],
      path: resolve('../tmp/assets_dlls'),
    },
  },

  entry(pkg) {
    const dependencyNames = Object.keys(pkg.dependencies);
    const exclude = pkg.dllPlugin.exclude || RailsWebpack.dllPlugin.defaults.exclude;
    const include = pkg.dllPlugin.include || RailsWebpack.dllPlugin.defaults.include;
    const includeDependencies = uniq(dependencyNames.concat(include));
    const isExcluded = contains(exclude);

    return {
      deps: filter(isExcluded, includeDependencies)
    };
  },
};

module.exports = RailsWebpack;
