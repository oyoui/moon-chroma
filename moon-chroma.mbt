// 1. 定义色彩结构体
pub struct Color {
  r : Int
  g : Int
  b : Int
}

// 2. 构造函数
pub fn Color::new(r : Int, g : Int, b : Int) -> Color {
  let clamp = fn(v : Int) -> Int {
    if v < 0 { 0 } else if v > 255 { 255 } else { v }
  }
  { r: clamp(r), g: clamp(g), b: clamp(b) }
}

// 3. 计算相对亮度（严格遵循 WCAG 2.2 / IEC 61966-2-1 标准）
pub fn Color::luminance(self : Color) -> Double {
  let normalize = fn(channel : Int) -> Double {
    let c = channel.to_double() / 255.0
    if c <= 0.04045 {
      c / 12.92
    } else {
      let base = (c + 0.055) / 1.055
      @math.pow(base, 2.4)
    }
  }
  let r_lum = normalize(self.r)
  let g_lum = normalize(self.g)
  let b_lum = normalize(self.b)
  0.2126 * r_lum + 0.7152 * g_lum + 0.0722 * b_lum
}

// 4. 计算对比度
pub fn Color::contrast_ratio(self : Color, other : Color) -> Double {
  let l1 = self.luminance()
  let l2 = other.luminance()
  let lighter = if l1 > l2 { l1 } else { l2 }
  let darker = if l1 > l2 { l2 } else { l1 }
  (lighter + 0.05) / (darker + 0.05)
}

// 5. 根据对比度判定 WCAG 评级（AAA / AA / Fail）
pub fn Color::wcag_rating(self : Color, other : Color) -> String {
  let ratio = self.contrast_ratio(other)
  if ratio >= 7.0 {
    "AAA" // 顶级无障碍标准
  } else if ratio >= 4.5 {
    "AA"  // 普遍推荐达标标准
  } else {
    "Fail" // 对比度过低，文本看不清
  }
}