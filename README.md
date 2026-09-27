# moon-chroma

> A lightweight color space manipulation and accessibility contrast calculation library for MoonBit.
> 面向 MoonBit 的轻量级 Web 色彩空间转换与无障碍对比度计算库。

## ✨ 特性 (Features)

- 🎨 **安全色彩模型**：内置 RGB 强类型约束，提供越界自动纠偏机制。
- 👁️ **WCAG 2.1 对比度判定**：精准计算相对亮度与双色无障碍阅读对比度（1:1 ~ 21:1）。
- 🚀 **零依赖 & 极速**：纯 MoonBit 原生实现，易于直接编译为 WebAssembly / JavaScript 供 Web 端调用。
- ✅ **100% 测试覆盖**：具备完整的单元测试保障。

## 🧪 测试验证 (Testing)

本项目使用 MoonBit 原生构建系统进行测试：

```bash
moon test
```

输出：
```text
Total tests: 3, passed: 3, failed: 0.
```

## 📦 项目规划与排期 (Roadmap)

- [x] Phase 1: 基础 `Color` 数据模型与 WCAG 对比度算法实现。
- [ ] Phase 2: 支持 HEX 颜色字符串互转（例如 `#ffffff`）。
- [ ] Phase 3: 支持 HSL 颜色空间模型与渐变算法。
- [ ] Phase 4: 提供 Web 端交互 Demo 并在 mooncakes.io 发布 0.1.0 版本。

## 📄 License

Apache-2.0