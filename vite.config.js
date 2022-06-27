
const { createFilter } = require("@rollup/pluginutils");
const { readFileSync } = require("fs");


function binary(opts = {})
{
    if (!opts.include) {
        throw Error("include option must be specified");
    }

    const filter = createFilter(opts.include, opts.exclude);
    return {
        name: "binary",
        transform(data, id)
        {

            if (filter(id)) {
                console.log(id);
                const fileData = readFileSync(id);
                return `
                var __toBinary = /* @__PURE__ */ (() =>
                {
                    var table = new Uint8Array(128);
                    for (var i = 0; i < 64; i++)
                        table[i < 26 ? i + 65 : i < 52 ? i + 71 : i < 62 ? i - 4 : i * 4 - 205] = i;
                    return (base64) =>
                    {
                        var n = base64.length, bytes = new Uint8Array((n - (base64[n - 1] == "=") - (base64[n - 2] == "=")) * 3 / 4 | 0);
                        for (var i2 = 0, j = 0; i2 < n;) {
                            var c0 = table[base64.charCodeAt(i2++)], c1 = table[base64.charCodeAt(i2++)];
                            var c2 = table[base64.charCodeAt(i2++)], c3 = table[base64.charCodeAt(i2++)];
                            bytes[j++] = c0 << 2 | c1 >> 4;
                            bytes[j++] = c1 << 4 | c2 >> 2;
                            bytes[j++] = c2 << 6 | c3;
                        }
                        return bytes;
                    };
                })();
                export default __toBinary("${fileData.toString('base64')}");`
            }
        }
    };
}
/**
 * @type {import('vite').UserConfig}
 */
const config = {
    base: 'nes6502ts',
    plugins: [binary({ include: "**/*.nes" })],
    optimizeDeps: {
        esbuildOptions: {
            loader: {
                '.data': 'binary'
            },

        }
    }

}

export default config