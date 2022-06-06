const HtmlWebPack = require('html-webpack-plugin');

module.exports = {
    mode: 'development',
    output: {
        clean: true,
    },

    module: {
        rules: [
            {
                test: /\.html$/,
                loader: 'html-loader',
                options: {
                    sources: false,
                },
            },
            {
                use: ["style-loader", "css-loader", "sass-loader"],
                test: /.(css|sass|scss)$/,
            },
            {
                type: "asset",
                test: /\.(png|svg|jpg|jpeg|gif)$/i,
            },
        ],
    },

    optimization: {},

    plugins: [
        new HtmlWebPack({
            title: 'App de IMC',
            template: './src/index.html',
        }),
    ],
};
