> **在线体验 Demo**：[https://moon-chroma.netlify.app/](https://moon-chroma.netlify.app/)

# moon-chroma

A lightweight color manipulation and WCAG contrast calculation library for MoonBit.

面向 MoonBit 的轻量级色彩处理与 Web 无障碍对比度计算库。

## Features

* **RGB color model** — 提供简单的 RGB 颜色数据模型，并对颜色分量进行范围约束。
* **WCAG 2.1 contrast ratio** — 根据 WCAG 2.1 相对亮度公式计算两个颜色之间的对比度。
* **Accessibility checking** — 可用于判断前景色与背景色是否具有足够的阅读对比度。
* **Zero dependencies** — 使用纯 MoonBit 实现，无第三方依赖。
* **Tested** — 使用 MoonBit 原生测试工具进行功能验证。

## Example

```moonbit
let white = Color::new(255, 255, 255)
let black = Color::new(0, 0, 0)

let ratio = contrast_ratio(white, black)
println(ratio.to_string())
```

For black and white, the WCAG contrast ratio is `21.0`.

## Testing

Run the test suite with:

```bash
moon test
```

Current test result:

```text
Total tests: 3, passed: 3, failed: 0.
```

The tests cover the core color model and WCAG contrast calculation logic.

## Project Structure

```text
moon-chroma/
├── moon-chroma.mbt
├── moon-chroma_test.mbt
├── moon-chroma_wbtest.mbt
├── cmd/
│   └── main/
├── moon.mod
└── README.md
```

## Why?

Color contrast is an important part of accessible interface design.

`moon-chroma` provides a small, dependency-free implementation that can be reused by MoonBit applications and tools that need basic color and accessibility calculations.

## Roadmap

* [x] Basic RGB color model
* [x] WCAG 2.1 contrast ratio calculation
* [x] Unit tests
* [ ] HEX color parsing and formatting
* [ ] HSL color model
* [ ] Additional color space conversions
* [ ] WebAssembly / Web demo
* [ ] Publish a stable package release

## License

Apache-2.0
