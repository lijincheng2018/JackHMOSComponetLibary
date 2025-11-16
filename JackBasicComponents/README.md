# Jack 基础组件库

[![HarmonyOS](https://img.shields.io/badge/HarmonyOS-NEXT-blue.svg)](https://www.harmonyos.com/)
[![ArkTS](https://img.shields.io/badge/ArkTS-Ready-green.svg)](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-get-started-0000001504769321-V3)
[![License](https://img.shields.io/badge/License-Apache%202.0-orange.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-1.0.0-brightgreen.svg)](CHANGELOG.md)

基于 ArkTS 开发的 HarmonyOS（鸿蒙）基础 UI 组件库，提供开箱即用的常用 UI 组件，助力快速开发高质量的鸿蒙应用。

## ✨ 特性

- 🎨 **精美设计** - 现代化的 UI 设计，开箱即用
- 🔧 **高度可定制** - 支持丰富的配置选项和样式自定义
- 📱 **响应式** - 适配不同屏幕尺寸
- 🚀 **性能优化** - 高效的渲染和交互性能
- 💪 **TypeScript** - 完整的类型定义支持
- 📦 **按需引入** - 支持按需导入组件
- 📖 **文档完善** - 详细的文档和示例代码

## 📦 安装

### 使用 OHPM 安装（推荐）

```bash
ohpm install @ohos/jackbasiccomponetlib
```

### 本地安装

1. 将组件库源码复制到你的项目中
2. 在项目的 `oh-package.json5` 中添加依赖：

```json5
{
  "dependencies": {
    "@ohos/jackbasiccomponetlib": "file:./JackBasicComponents"
  }
}
```

## 🚀 快速开始

### 1. 导入组件

```typescript
import {
  JackSlider,
  JackCapsuleButton,
  JackDatePicker,
  JackButtonType,
  JackButtonSize,
  JackDatePickerType
} from '@ohos/jackbasiccomponetlib';
```

### 2. 使用组件

```typescript
@Entry
@Component
struct Index {
  @State sliderValue: number = 50;
  @State selectedDate: Date = new Date();

  build() {
    Column({ space: 20 }) {
      // 滑块
      JackSlider({
        value: $sliderValue,
        min: 0,
        max: 100
      })

      // 按钮
      JackCapsuleButton({
        text: '点击我',
        type: JackButtonType.Primary,
        buttonSize: JackButtonSize.Medium,
        onButtonClick: () => {
          console.log('按钮被点击');
        }
      })

      // 日期选择器
      JackDatePicker({
        selected: this.selectedDate,
        type: JackDatePickerType.Date,
        onChange: (date: Date) => {
          this.selectedDate = date;
        }
      })
    }
    .padding(20)
  }
}
```

## 📦 包含组件

### 1. JackSlider - 滑块组件
自定义滑块组件，支持自定义样式、范围、步长等。

#### 特性
- ✅ 自定义最小值、最大值
- ✅ 自定义步长
- ✅ 自定义颜色（轨道、选中、滑块）
- ✅ 显示/隐藏步长刻度
- ✅ 显示/隐藏当前值提示
- ✅ 值变化回调

#### 使用示例
```typescript
import { JackSlider } from '@ohos/jack-basic-components';

@State sliderValue: number = 50;

JackSlider({
  value: this.sliderValue,
  min: 0,
  max: 100,
  step: 1,
  selectedColor: '#007DFF',
  showSteps: false,
  showTips: true,
  onChange: (value: number) => {
    console.log('当前值:', value);
  }
})
```

---

### 2. JackCapsuleButton - 胶囊按钮组件
美观的胶囊形状按钮，支持多种样式、尺寸和状态。

#### 特性
- ✅ 6种按钮类型（Primary、Secondary、Success、Warning、Danger、Info）
- ✅ 3种尺寸（Small、Medium、Large）
- ✅ 朴素按钮样式（空心）
- ✅ 禁用状态
- ✅ 加载状态
- ✅ 自定义图标
- ✅ 自定义颜色

#### 使用示例
```typescript
import { 
  JackCapsuleButton, 
  JackButtonType, 
  JackButtonSize 
} from '@ohos/jack-basic-components';

// 基础按钮
JackCapsuleButton({
  text: '确定',
  type: JackButtonType.Primary,
  buttonSize: JackButtonSize.Medium,
  onButtonClick: () => {
    console.log('按钮被点击');
  }
})

// 朴素按钮
JackCapsuleButton({
  text: '取消',
  type: JackButtonType.Primary,
  plain: true,
  onButtonClick: () => {
    console.log('取消');
  }
})

// 加载状态按钮
JackCapsuleButton({
  text: '提交',
  type: JackButtonType.Success,
  loading: true
})

// 禁用按钮
JackCapsuleButton({
  text: '已禁用',
  type: JackButtonType.Primary,
  disabled: true
})
```

---

### 3. JackDatePicker - 日期选择器组件
功能完善的日期时间选择器，支持多种选择模式。

#### 特性
- ✅ 3种选择模式（日期、时间、日期时间）
- ✅ 自定义日期范围
- ✅ 显示农历
- ✅ 自定义占位符
- ✅ 日期变化回调
- ✅ 美观的弹窗动画

#### 使用示例
```typescript
import { 
  JackDatePicker, 
  JackDatePickerType 
} from '@ohos/jack-basic-components';

@State selectedDate: Date = new Date();

// 日期选择
JackDatePicker({
  selected: this.selectedDate,
  type: JackDatePickerType.Date,
  placeholder: '请选择日期',
  onChange: (value: Date) => {
    this.selectedDate = value;
    console.log('选择的日期:', value);
  }
})

// 时间选择
JackDatePicker({
  selected: this.selectedDate,
  type: JackDatePickerType.Time,
  placeholder: '请选择时间',
  onChange: (value: Date) => {
    console.log('选择的时间:', value);
  }
})

// 日期时间选择（带农历）
JackDatePicker({
  selected: this.selectedDate,
  type: JackDatePickerType.DateTime,
  lunar: true,
  start: new Date(2020, 0, 1),
  end: new Date(2030, 11, 31),
  onChange: (value: Date) => {
    console.log('选择的日期时间:', value);
  }
})
```

---

## 📝 完整示例

查看 `DemoPage.ets` 文件获取完整的使用示例。

---

## 🎨 自定义主题

所有组件都支持自定义颜色，您可以通过传入对应的颜色参数来匹配您的应用主题。

```typescript
// 自定义滑块颜色
JackSlider({
  value: this.sliderValue,
  trackColor: '#E5E5E5',
  selectedColor: '#FF6B6B',
  blockColor: '#FFFFFF'
})

// 自定义按钮颜色
JackCapsuleButton({
  text: '自定义按钮',
  bgColor: '#FF6B6B',
  txtColor: '#FFFFFF',
  bdColor: '#FF6B6B'
})
```

---

## 📄 API 文档

### JackSlider API

| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| value | number | 0 | 当前值（使用@Link双向绑定） |
| min | number | 0 | 最小值 |
| max | number | 100 | 最大值 |
| step | number | 1 | 步长 |
| trackColor | ResourceColor | '#E5E5E5' | 轨道颜色 |
| selectedColor | ResourceColor | '#007DFF' | 已选择部分颜色 |
| blockColor | ResourceColor | '#FFFFFF' | 滑块颜色 |
| showSteps | boolean | false | 是否显示步长刻度 |
| showTips | boolean | true | 是否显示提示 |
| onChange | (value: number) => void | - | 值变化回调 |

### JackCapsuleButton API

| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| text | string | 'Button' | 按钮文字 |
| type | JackButtonType | Primary | 按钮类型 |
| buttonSize | JackButtonSize | Medium | 按钮尺寸 |
| disabled | boolean | false | 是否禁用 |
| loading | boolean | false | 是否加载中 |
| icon | ResourceStr | - | 图标 |
| bgColor | ResourceColor | - | 背景色 |
| txtColor | ResourceColor | - | 文字颜色 |
| bdColor | ResourceColor | - | 边框颜色 |
| plain | boolean | false | 是否朴素按钮 |
| onButtonClick | () => void | - | 点击回调 |

### JackDatePicker API

| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| selected | Date | new Date() | 当前选中日期 |
| type | JackDatePickerType | Date | 选择器类型 |
| lunar | boolean | false | 是否显示农历 |
| start | Date | 1970-1-1 | 起始日期 |
| end | Date | 2100-12-31 | 结束日期 |
| placeholder | string | '请选择日期' | 占位符 |
| onChange | (value: Date) => void | - | 日期变化回调 |

---

## 🔧 开发计划

- [ ] 增加更多组件（输入框、下拉选择、对话框等）
- [ ] 增加暗黑模式支持
- [ ] 增加国际化支持
- [ ] 增加单元测试
- [ ] 性能优化

---

## 📂 项目结构

```
JackBasicComponents/
├── src/
│   └── main/
│       ├── ets/
│       │   └── components/
│       │       ├── JackSlider.ets              # 滑块组件
│       │       ├── JackCapsuleButton.ets       # 胶囊按钮组件
│       │       ├── JackDatePicker.ets          # 日期选择器组件
│       │       ├── MainPage.ets                # 示例页面
│       │       └── DemoPage.ets                # 完整演示页面
│       ├── resources/                       # 资源文件
│       └── module.json5                     # 模块配置
├── Index.ets                            # 组件导出入口
├── oh-package.json5                     # 包配置文件
├── README.md                            # 项目说明
├── CHANGELOG.md                         # 更新日志
└── build-profile.json5                  # 构建配置
```

---

## 💮 反馈与支持

### 问题反馈

如果你遇到任何问题，请通过以下方式反馈：

- 🐛 **Bug 报告**: 提交 Issue，详细描述问题和复现步骤
- 💡 **功能建议**: 提交 Issue，说明你的需求和场景
- 💬 **使用问题**: 查看文档或提交 Issue 询问

### 联系方式

- **作者**: Li Jincheng
- **Email**: support@classcloud.com.cn
- **GitHub**: https://github.com/your-username

---

## ⭐ 支持项目

如果这个项目对你有帮助，请给项目点个 Star ⭐，这是对我们最大的鼓励！

---


## 🚀 更新日志

查看 [CHANGELOG.md](./CHANGELOG.md) 了解详细的版本更新历史。

---

<p align="center">
  <b>感谢使用 Jack 基础组件库！</b><br/>
  Made with ❤️ by Li Jincheng
</p>
