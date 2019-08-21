const path = require('path');
const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const package = require("./package.json");

module.exports = {
    entry: {
        common: path.join(__dirname, package.main)
    },
    devtool: 'inline-source-map',
    plugins: [
        new CleanWebpackPlugin(),
    ],
    output: {
        filename: '[name].bundle.js',
        path: path.resolve(__dirname, 'dist'),
        publicPath: '/',
        libraryTarget: 'umd'
    },
    target: "node",
    mode: "production"
};