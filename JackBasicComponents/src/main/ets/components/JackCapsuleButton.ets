/**
 * JackCapsuleButton - 胶囊按钮组件
 * 支持多种样式、尺寸和状态
 */

export enum JackButtonType {
  Primary = 'primary',
  Secondary = 'secondary',
  Success = 'success',
  Warning = 'warning',
  Danger = 'danger',
  Info = 'info'
}

export enum JackButtonSize {
  Small = 'small',
  Medium = 'medium',
  Large = 'large'
}

interface ButtonStyle {
  bgColor: ResourceColor;
  txtColor: ResourceColor;
  bdColor: ResourceColor;
  height: number;
  fontSize: number;
  paddingH: number;
}

export interface JackCapsuleButtonOptions {
  text?: string; // 按钮文字
  type?: JackButtonType; // 按钮类型
  buttonSize?: JackButtonSize; // 按钮尺寸
  disabled?: boolean; // 是否禁用
  loading?: boolean; // 是否加载中
  icon?: ResourceStr; // 图标
  bgColor?: ResourceColor; // 背景色
  txtColor?: ResourceColor; // 文字颜色
  bdColor?: ResourceColor; // 边框颜色
  plain?: boolean; // 是否朴素按钮（空心）
  onButtonClick?: () => void; // 点击回调
}

@Component
export struct JackCapsuleButton {
  private text: string = 'Button';
  private type: JackButtonType = JackButtonType.Primary;
  private buttonSize: JackButtonSize = JackButtonSize.Medium;
  @Prop disabled: boolean = false;
  @Prop loading: boolean = false;
  private icon?: ResourceStr;
  private bgColor?: ResourceColor;
  private txtColor?: ResourceColor;
  private bdColor?: ResourceColor;
  private plain: boolean = false;
  private onButtonClick?: () => void;

  // 获取按钮样式配置
  private getButtonStyle(): ButtonStyle {
    // 根据类型获取颜色
    let bgColor: ResourceColor = '#007DFF';
    let txtColor: ResourceColor = '#FFFFFF';
    let borderColor: ResourceColor = '#007DFF';

    switch (this.type) {
      case JackButtonType.Primary:
        bgColor = '#007DFF';
        borderColor = '#007DFF';
        break;
      case JackButtonType.Secondary:
        bgColor = '#909399';
        borderColor = '#909399';
        break;
      case JackButtonType.Success:
        bgColor = '#67C23A';
        borderColor = '#67C23A';
        break;
      case JackButtonType.Warning:
        bgColor = '#E6A23C';
        borderColor = '#E6A23C';
        break;
      case JackButtonType.Danger:
        bgColor = '#F56C6C';
        borderColor = '#F56C6C';
        break;
      case JackButtonType.Info:
        bgColor = '#909399';
        borderColor = '#909399';
        break;
    }

    // 自定义颜色覆盖
    if (this.bgColor) bgColor = this.bgColor;
    if (this.bdColor) borderColor = this.bdColor;

    // 朴素按钮样式
    if (this.plain) {
      txtColor = bgColor;
      bgColor = '#FFFFFF';
    }

    if (this.txtColor) txtColor = this.txtColor;

    // 禁用状态
    if (this.disabled) {
      bgColor = '#F5F7FA';
      txtColor = '#C0C4CC';
      borderColor = '#E4E7ED';
    }

    // 根据尺寸获取大小
    let height = 40;
    let fontSize = 14;
    let paddingH = 20;

    switch (this.buttonSize) {
      case JackButtonSize.Small:
        height = 32;
        fontSize = 12;
        paddingH = 15;
        break;
      case JackButtonSize.Medium:
        height = 40;
        fontSize = 14;
        paddingH = 20;
        break;
      case JackButtonSize.Large:
        height = 48;
        fontSize = 16;
        paddingH = 25;
        break;
    }

    return { bgColor, txtColor, bdColor: borderColor, height, fontSize, paddingH };
  }

  build() {
    Button() {
      Row({ space: 6 }) {
        // 加载中图标
        if (this.loading) {
          LoadingProgress()
            .width(16)
            .height(16)
            .color(this.getButtonStyle().txtColor)
        }
        // 自定义图标
        else if (this.icon) {
          Image(this.icon)
            .width(16)
            .height(16)
            .fillColor(this.getButtonStyle().txtColor)
        }

        // 按钮文字
        Text(this.text)
          .fontSize(this.getButtonStyle().fontSize)
          .fontColor(this.getButtonStyle().txtColor)
      }
      .justifyContent(FlexAlign.Center)
    }
    .type(ButtonType.Capsule)
    .height(this.getButtonStyle().height)
    .backgroundColor(this.getButtonStyle().bgColor)
    .border({
      width: this.plain ? 1 : 0,
      color: this.getButtonStyle().bdColor
    })
    .padding({
      left: this.getButtonStyle().paddingH,
      right: this.getButtonStyle().paddingH
    })
    .enabled(!this.disabled && !this.loading)
    .opacity(this.disabled ? 0.6 : 1)
    .onClick(() => {
      if (!this.disabled && !this.loading && this.onButtonClick) {
        this.onButtonClick();
      }
    })
  }
}

/**
 * JackCapsuleButton 便捷构建器
 */
@Builder
export function JackCapsuleButtonBuilder(options: JackCapsuleButtonOptions) {
  JackCapsuleButton({
    text: options.text,
    type: options.type,
    buttonSize: options.buttonSize,
    disabled: options.disabled,
    loading: options.loading,
    icon: options.icon,
    bgColor: options.bgColor,
    txtColor: options.txtColor,
    bdColor: options.bdColor,
    plain: options.plain,
    onButtonClick: options.onButtonClick
  })
}
