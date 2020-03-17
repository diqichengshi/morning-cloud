module.exports = {
  devServer: {
    port: 3000, // 端口
    proxy: {
      '/api': {
        target: 'http://localhost:8081',//后端接口地址
        changeOrigin: true,//是否允许跨越
        pathRewrite: {
          '^/api': '/api',//重写,
        }
      }
    }
  },
  assetsDir: 'assets',
  publicPath: process.env.NODE_ENV == 'production' ? '/' : '/'
}