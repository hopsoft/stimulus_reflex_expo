const { webpackConfig, merge } = require('@rails/webpacker')

const customConfig = {
  resolve: {
    extensions: [
      '.js',
      '.css',
      '.scss',
      '.gif',
      '.jpeg',
      '.jpg',
      '.png',
      '.svg'
    ]
  }
}

module.exports = merge(webpackConfig, customConfig)
//module.exports = webpackConfig
