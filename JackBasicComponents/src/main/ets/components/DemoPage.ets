/**
 * DemoPage - 组件库使用示例
 * 展示所有基础组件的使用方法
 */

import { JackSlider } from './JackSlider';
import { 
  JackCapsuleButton, 
  JackButtonType,
  JackButtonSize 
} from './JackCapsuleButton';
import { 
  JackDatePicker,
  JackDatePickerType 
} from './JackDatePicker';

@Entry
@Component
export struct DemoPage {
  @State sliderValue: number = 50;
  @State loading: boolean = false;
  @State selectedDate: Date = new Date();

  build() {
    Scroll() {
      Column({ space: 24 }) {
        // 标题
        Text('Jack 基础组件库')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 10 })

        // 滑块组件示例
        Column({ space: 12 }) {
          Text('1. Slider 滑块组件')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .alignSelf(ItemAlign.Start)

          // 基础滑块
          JackSlider({
            value: $sliderValue,
            min: 0,
            max: 100,
            step: 1,
            onChange: (value: number) => {
              console.log('Slider value changed:', value);
            }
          })

          // 带步长显示的滑块
          JackSlider({
            value: $sliderValue,
            min: 0,
            max: 100,
            step: 10,
            showSteps: true,
            selectedColor: '#67C23A',
            onChange: (value: number) => {
              this.sliderValue = value;
            }
          })
        }
        .width('100%')
        .padding(16)
        .backgroundColor('#FFFFFF')
        .borderRadius(8)

        // 胶囊按钮组件示例
        Column({ space: 12 }) {
          Text('2. CapsuleButton 胶囊按钮')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .alignSelf(ItemAlign.Start)

          // 不同类型的按钮
          Row({ space: 8 }) {
            JackCapsuleButton({
              text: 'Primary',
              type: JackButtonType.Primary,
              buttonSize: JackButtonSize.Small,
              onButtonClick: () => {
                console.log('Primary button clicked');
              }
            })

            JackCapsuleButton({
              text: 'Success',
              type: JackButtonType.Success,
              buttonSize: JackButtonSize.Small,
              onButtonClick: () => {
                console.log('Success button clicked');
              }
            })

            JackCapsuleButton({
              text: 'Warning',
              type: JackButtonType.Warning,
              buttonSize: JackButtonSize.Small,
              onButtonClick: () => {
                console.log('Warning button clicked');
              }
            })
          }
          .width('100%')

          // 不同尺寸的按钮
          Column({ space: 8 }) {
            JackCapsuleButton({
              text: 'Large Button',
              type: JackButtonType.Primary,
              buttonSize: JackButtonSize.Large,
              onButtonClick: () => {
                console.log('Large button clicked');
              }
            })

            JackCapsuleButton({
              text: 'Medium Button',
              type: JackButtonType.Primary,
              buttonSize: JackButtonSize.Medium,
              onButtonClick: () => {
                console.log('Medium button clicked');
              }
            })

            JackCapsuleButton({
              text: 'Small Button',
              type: JackButtonType.Primary,
              buttonSize: JackButtonSize.Small,
              onButtonClick: () => {
                console.log('Small button clicked');
              }
            })
          }
          .width('100%')

          // 朴素按钮和禁用状态
          Row({ space: 8 }) {
            JackCapsuleButton({
              text: 'Plain',
              type: JackButtonType.Primary,
              plain: true,
              onButtonClick: () => {
                console.log('Plain button clicked');
              }
            })

            JackCapsuleButton({
              text: 'Disabled',
              type: JackButtonType.Primary,
              disabled: true
            })

            JackCapsuleButton({
              text: 'Loading',
              type: JackButtonType.Primary,
              loading: this.loading,
              onButtonClick: () => {
                this.loading = true;
                setTimeout(() => {
                  this.loading = false;
                }, 2000);
              }
            })
          }
          .width('100%')
        }
        .width('100%')
        .padding(16)
        .backgroundColor('#FFFFFF')
        .borderRadius(8)

        // 日期选择器组件示例
        Column({ space: 12 }) {
          Text('3. DatePicker 日期选择器')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .alignSelf(ItemAlign.Start)

          // 日期选择
          JackDatePicker({
            selected: this.selectedDate,
            type: JackDatePickerType.Date,
            placeholder: '选择日期',
            onChange: (value: Date) => {
              this.selectedDate = value;
              console.log('Date selected:', value);
            }
          })

          // 时间选择
          JackDatePicker({
            selected: this.selectedDate,
            type: JackDatePickerType.Time,
            placeholder: '选择时间',
            onChange: (value: Date) => {
              console.log('Time selected:', value);
            }
          })

          // 日期时间选择
          JackDatePicker({
            selected: this.selectedDate,
            type: JackDatePickerType.DateTime,
            placeholder: '选择日期时间',
            lunar: true,
            onChange: (value: Date) => {
              console.log('DateTime selected:', value);
            }
          })
        }
        .width('100%')
        .padding(16)
        .backgroundColor('#FFFFFF')
        .borderRadius(8)

        // 底部间距
        Text('')
          .height(20)
      }
      .width('100%')
      .padding(16)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
