# moon-chroma

A lightweight color manipulation and WCAG contrast calculation library for MoonBit.

面向 MoonBit 的轻量级色彩处理与 Web 无障碍对比度计算库。

## Demo / 在线演示

**https://moon-chroma.netlify.app/**

This is an interactive web prototype for visually testing and previewing WCAG contrast calculation results.

The core color manipulation and WCAG contrast calculation library is implemented in MoonBit.

## Features / 功能

* **RGB color model** — Provides a simple `Color` structure with automatic clamping of RGB channels to the `0–255` range.
* **Relative luminance** — Calculates sRGB relative luminance using the WCAG-recommended transfer function.
* **WCAG contrast ratio** — Calculates the contrast ratio between two colors, from `1:1` to `21:1`.
* **WCAG rating** — Classifies contrast results as `AAA`, `AA`, or `Fail`.
* **Zero third-party dependencies** — Implemented in MoonBit using the standard MoonBit core library.
* **Unit tested** — Core color and accessibility calculations are covered by MoonBit tests.

## Usage / 使用方法

Create two colors and calculate their contrast ratio:

```moonbit
let white = @moon_chroma.Color::new(255, 255, 255)
let black = @moon_chroma.Color::new(0, 0, 0)

let ratio = white.contrast_ratio(black)
println(ratio.to_string())

let rating = white.wcag_rating(black)
println(rating)
```

For black and white, the WCAG contrast ratio is `21:1` and the rating is `AAA`.

## Color Clamping / 颜色范围限制

RGB channels are automatically clamped to the valid `0–255` range:

```moonbit
let color = @moon_chroma.Color::new(300, -20, 128)
```

The resulting color is equivalent to:

```text
RGB(255, 0, 128)
```

## WCAG Calculation / WCAG 计算

`moon-chroma` uses the sRGB relative luminance calculation recommended by WCAG:

```text
if c <= 0.04045:
    c / 12.92
else:
    ((c + 0.055) / 1.055) ^ 2.4
```

The relative luminance of the RGB channels is then calculated using the standard coefficients:

```text
0.2126 R + 0.7152 G + 0.0722 B
```

The contrast ratio is calculated from the relative luminance of the lighter and darker colors.

## Testing / 测试

Run the test suite with:

```bash
moon test
```

Current test result:

```text
Total tests: 6, passed: 6, failed: 0.
```

The test suite covers:

* Black and white contrast ratio
* Identical-color contrast ratio
* RGB channel clamping
* WCAG AAA rating
* WCAG AA rating
* WCAG Fail rating

## Project Structure / 项目结构

```text
moon-chroma/
├── .github/
│   └── workflows/
├── cmd/
│   └── main/
├── moon-chroma.mbt
├── moon-chroma_test.mbt
├── moon-chroma_wbtest.mbt
├── moon.mod
├── moon.pkg
├── AGENTS.md
├── LICENSE
└── README.md
```

## Roadmap / 路线图

* [x] RGB color model
* [x] RGB channel clamping
* [x] Relative luminance calculation
* [x] WCAG contrast ratio calculation
* [x] WCAG accessibility rating
* [x] Unit tests
* [x] Interactive web prototype
* [ ] HEX color parsing and formatting
* [ ] HSL color model
* [ ] Additional color space conversions
* [ ] WebAssembly integration
* [ ] Publish a stable package release

## License / 许可证

Apache-2.0
