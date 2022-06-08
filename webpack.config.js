const path = require('path');

module.exports = {
    mode: 'development',
    entry: "./src/index.js",
    output: {
        clean: true,
        path: path.resolve(__dirname, "dist")
    },

    module: {
        rules: [
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
};
