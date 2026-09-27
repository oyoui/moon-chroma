test "black and white contrast ratio" {
  let white = @moon-chroma.Color::new(255, 255, 255)
  let black = @moon-chroma.Color::new(0, 0, 0)
  let ratio = white.contrast_ratio(black)
  assert_true(ratio > 18.0)
}

test "identical colors have 1.0 contrast" {
  let c1 = @moon-chroma.Color::new(100, 150, 200)
  let c2 = @moon-chroma.Color::new(100, 150, 200)
  let ratio = c1.contrast_ratio(c2)
  assert_true(ratio >= 0.99 && ratio <= 1.01)
}

test "color clamping works" {
  let overflow = @moon-chroma.Color::new(300, -20, 128)
  assert_eq(overflow.r, 255)
  assert_eq(overflow.g, 0)
  assert_eq(overflow.b, 128)
}

test "wcag rating AAA for high contrast" {
  let white = @moon-chroma.Color::new(255, 255, 255)
  let black = @moon-chroma.Color::new(0, 0, 0)
  assert_eq(white.wcag_rating(black), "AAA")
}

test "wcag rating AA for medium contrast" {
  let white = @moon-chroma.Color::new(255, 255, 255)
  let blue = @moon-chroma.Color::new(0, 102, 204)
  assert_eq(white.wcag_rating(blue), "AA")
}

test "wcag rating Fail for low contrast" {
  let white = @moon-chroma.Color::new(255, 255, 255)
  let light_yellow = @moon-chroma.Color::new(255, 255, 200)
  assert_eq(white.wcag_rating(light_yellow), "Fail")
}