# Jack 基础组件库 - 发布规范文档

## 发布标识（Code）

### Code 信息
- **Code**: `agcit_classcloud_jackbasiccomponents`
- **版本号**: `1.0.0`
- **配置位置**: `src/main/resources/base/element/string.json`

### Code 命名规则说明
- **前缀**: `agcit_` (生态市场组件标识前缀)
- **组织标识**: `classcloud` (自定义组织标识)
- **组件名称**: `jackbasiccomponents` (Jack基础组件库)

### Code 特点
- ✅ 符合生态市场命名规范
- ✅ 在生态市场全局唯一
- ✅ 发布后不可修改
- ✅ 已写入资源配置文件

---

## 发布信息配置

### 基本信息

| 项目 | 内容 |
|------|------|
| **组件名称** | Jack 基础组件库 |
| **组件Code** | agcit_classcloud_jackbasiccomponents |
| **包名** | @ohos/jackbasiccomponetlib |
| **当前版本** | 1.0.0 |
| **作者** | Li Jincheng |
| **开源情况** | 开源 |
| **开源协议** | MIT License |

### 应用品类（可选）
- UI 组件库
- 开发工具

### 组件分类
- **分类**: UI（用户界面）
- **子分类**: 基础组件
- **适用场景**: HarmonyOS 应用开发

---

## OHPM 托管信息

### OHPM 包信息
- **OHPM 包名**: `@ohos/jackbasiccomponetlib`
- **OHPM 版本号**: `1.0.0`
- **主入口文件**: `Index.ets`
- **依赖项**: 无外部依赖

### 安装方式
```bash
ohpm install @ohos/jackbasiccomponetlib
```

---

## 代码仓库信息

### GitHub 仓库（建议填写）
- **代码仓库地址**: `https://github.com/your-username/JackComponetLibary.git`
- **组件相对路径**: `JackBasicComponents`
- **分支名**: `main` 或 `master`

> **注意**: 发布前请将 `your-username` 替换为实际的 GitHub 用户名

### 主页地址（可选）
- 项目主页: [GitHub Pages 或其他]
- 在线文档: [文档地址]
- 演示地址: [Demo 地址]

---

## 版本说明

### 版本号规范
采用语义化版本号（Semantic Versioning）：`主版本号.次版本号.修订号`

- **主版本号（1）**: 不兼容的 API 修改
- **次版本号（0）**: 向下兼容的功能性新增
- **修订号（0）**: 向下兼容的问题修正

### 当前版本说明（v1.0.0）

**发布日期**: 2025-11-16

**新增功能**:
- ✨ JackSlider - 滑块组件
  - 支持自定义范围、步长
  - 支持自定义颜色
  - 支持双向数据绑定
  
- ✨ JackCapsuleButton - 胶囊按钮组件
  - 6种预设按钮类型
  - 3种按钮尺寸
  - 支持加载状态和禁用状态
  
- ✨ JackDatePicker - 日期选择器组件
  - 支持日期、时间、日期时间三种模式
  - 支持农历显示
  - 支持自定义日期范围

**技术特性**:
- 完整的 TypeScript 类型定义
- 无外部依赖
- 响应式设计
- 详细的文档和示例

---

## 开源情况

### 开源协议
- **协议类型**: MIT License
- **协议文件**: `LICENSE`
- **版权所有**: Copyright (c) 2025 Li Jincheng

### 许可说明
- ✅ 允许商业使用
- ✅ 允许修改
- ✅ 允许分发
- ✅ 允许私人使用
- ⚠️ 需保留版权声明
- ⚠️ 需保留许可证副本
- ⚠️ 不提供责任担保

### 开源文件清单
- `LICENSE` - MIT 许可证完整文本
- `README.md` - 项目说明文档
- `README-2.md` - 标准发布文档
- `CHANGELOG.md` - 版本更新日志
- 源代码 - 所有 ArkTS 源文件

---

## 作者信息

### 主要作者
- **姓名**: Li Jincheng
- **邮箱**: support@classcloud.com.cn
- **组织**: ClassCloud

### 联系方式
- **技术支持邮箱**: support@classcloud.com.cn
- **GitHub**: https://github.com/your-username
- **工作时间**: 工作日 9:00-18:00

---

## 发布前检查清单

### 代码质量检查
- [x] 通过 ArkTSCheck 类型检查
- [x] 所有组件功能正常
- [x] 无 console 错误和警告
- [ ] 代码格式统一规范
- [ ] 添加必要的注释

### 文档完整性检查
- [x] README.md 完整且准确
- [x] README-2.md 标准文档完成
- [x] CHANGELOG.md 版本记录完整
- [x] LICENSE 文件存在
- [x] API 文档详细清晰
- [x] 使用示例完整可运行

### 配置文件检查
- [x] oh-package.json5 信息完整
- [x] string.json 添加 Code 标识
- [x] module.json5 配置正确
- [x] build-profile.json5 配置正确

### 组件签名（必须）
- [ ] 使用发布证书签名 HAR 包
- [ ] 签名账号与上架账号一致
- [ ] 证书类型为"发布证书"
- [ ] 证书状态为"生效"

> **重要**: 组件包必须进行签名才能上架生态市场

### 测试验证
- [ ] 在真机上测试所有组件
- [ ] 验证不同屏幕尺寸适配
- [ ] 验证深色/浅色主题兼容
- [ ] 性能测试通过

---

## 发布流程

### 1. 准备阶段
```bash
# 1. 确保所有代码已提交
git status

# 2. 打包组件
# 在 DevEco Studio 中构建 HAR 包

# 3. 签名组件包（必须）
# 使用发布证书对 HAR 进行签名
```

### 2. OHPM 发布（可选）
```bash
# 1. 登录 OHPM
ohpm login

# 2. 发布到 OHPM
ohpm publish

# 3. 验证发布
ohpm view @ohos/jackbasiccomponetlib
```

### 3. 生态市场上架
1. 登录 HarmonyOS 生态市场
2. 进入"组件上架"页面
3. 填写组件信息：
   - Code: `agcit_classcloud_jackbasiccomponents`
   - 版本号: `1.0.0`
   - 包名: `@ohos/jackbasiccomponetlib`
   - 上传签名后的 HAR 包
   - 填写版本说明
4. 选择开源协议：MIT License
5. 提交审核

### 4. 代码仓库发布
```bash
# 1. 创建版本标签
git tag -a v1.0.0 -m "Release version 1.0.0"

# 2. 推送标签
git push origin v1.0.0

# 3. 在 GitHub 创建 Release
# - 填写版本说明
# - 上传 HAR 包（可选）
```

---

## 更新发布流程

### 版本更新步骤

1. **更新代码**
   - 修复 Bug 或添加新功能
   - 更新测试用例

2. **更新版本号**
   - `oh-package.json5` 中的 version
   - `string.json` 中的 Code 版本号
   - `CHANGELOG.md` 添加更新记录

3. **更新文档**
   - 更新 README.md
   - 更新 API 文档
   - 添加迁移指南（如有破坏性变更）

4. **测试验证**
   - 完整功能测试
   - 兼容性测试

5. **发布新版本**
   - 重新签名组件包
   - 发布到 OHPM
   - 更新生态市场

---

## 常见问题

### Q1: Code 可以修改吗？
**A**: 不可以。Code 一旦发布到生态市场就不能修改，请在首次发布前确认 Code 正确。

### Q2: 必须上传到 OHPM 吗？
**A**: 不是必须的。可以选择填写 OHPM、代码仓库地址或主页地址中的任意一个。

### Q3: 如何对 HAR 进行签名？
**A**: 
1. 在 DevEco Studio 中配置发布证书
2. Build > Make Module 'YourModule'
3. 在构建产物中找到签名后的 HAR 文件

### Q4: 版本号规则是什么？
**A**: 建议使用三段式版本号：主版本号.次版本号.修订号（如 1.0.0）

### Q5: 开源协议可以修改吗？
**A**: 可以在发布新版本时修改，但建议在首次发布时就选择合适的协议。

---

## 技术支持

如有发布相关问题，请联系：
- **邮箱**: support@classcloud.com.cn
- **技术支持**: 工作日 9:00-18:00

---

## 附录

### 相关文档链接
- [HarmonyOS 生态市场](https://developer.harmonyos.com/)
- [OHPM 官方文档](https://ohpm.openharmony.cn/)
- [ArkTS 开发指南](https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-get-started-0000001504769321-V3)
- [组件签名指南](https://developer.harmonyos.com/cn/docs/documentation/doc-guides/ohos-debugging-and-running-0000001263040487)

### 版本历史
| 版本 | 发布日期 | 主要变更 |
|------|----------|----------|
| 1.0.0 | 2025-11-16 | 首次发布，包含三个基础组件 |

---

<p align="center">
  <b>准备发布到 HarmonyOS 生态市场</b><br/>
  Code: agcit_classcloud_jackbasiccomponents<br/>
  Version: 1.0.0
</p>
