/**
 * JackSlider - 自定义滑块组件
 * 支持自定义样式、范围、步长等
 */

export interface JackSliderOptions {
  value?: number; // 当前值
  min?: number; // 最小值
  max?: number; // 最大值
  step?: number; // 步长
  trackColor?: ResourceColor; // 轨道颜色
  selectedColor?: ResourceColor; // 已选择部分颜色
  blockColor?: ResourceColor; // 滑块颜色
  showSteps?: boolean; // 是否显示步长刻度
  showTips?: boolean; // 是否显示提示
  onChange?: (value: number) => void; // 值变化回调
}

@Component
export struct JackSlider {
  @Link value: number;
  private min: number = 0;
  private max: number = 100;
  private step: number = 1;
  private trackColor: ResourceColor = '#E5E5E5';
  private selectedColor: ResourceColor = '#007DFF';
  private blockColor: ResourceColor = '#FFFFFF';
  private showSteps: boolean = false;
  private showTips: boolean = true;
  private onChange?: (value: number) => void;

  build() {
    Column() {
      // 显示当前值
      if (this.showTips) {
        Text(`${this.value}`)
          .fontSize(14)
          .fontColor('#333333')
          .margin({ bottom: 8 })
      }

      // 滑块组件
      Slider({
        value: this.value,
        min: this.min,
        max: this.max,
        step: this.step,
        style: SliderStyle.OutSet
      })
        .blockColor(this.blockColor)
        .trackColor(this.trackColor)
        .selectedColor(this.selectedColor)
        .showSteps(this.showSteps)
        .showTips(this.showTips)
        .trackThickness(4)
        .onChange((value: number, mode: SliderChangeMode) => {
          this.value = value;
          if (this.onChange) {
            this.onChange(value);
          }
        })

      // 显示范围
      Row() {
        Text(`${this.min}`)
          .fontSize(12)
          .fontColor('#999999')
        
        Blank()
        
        Text(`${this.max}`)
          .fontSize(12)
          .fontColor('#999999')
      }
      .width('100%')
      .margin({ top: 4 })
    }
    .width('100%')
  }
}

/**
 * JackSlider 便捷构建器
 */
@Builder
export function JackSliderBuilder(options: JackSliderOptions) {
  JackSlider({
    value: options.value || 0,
    min: options.min,
    max: options.max,
    step: options.step,
    trackColor: options.trackColor,
    selectedColor: options.selectedColor,
    blockColor: options.blockColor,
    showSteps: options.showSteps,
    showTips: options.showTips,
    onChange: options.onChange
  })
}
