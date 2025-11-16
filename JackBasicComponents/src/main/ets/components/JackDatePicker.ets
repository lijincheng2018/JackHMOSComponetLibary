/**
 * JackDatePicker - 日期选择器组件
 * 支持日期、时间、日期时间多种模式
 */

export enum JackDatePickerType {
  Date = 'date',         // 日期选择
  Time = 'time',         // 时间选择
  DateTime = 'datetime'  // 日期时间选择
}

export interface JackDatePickerOptions {
  selected?: Date;              // 当前选中日期
  type?: JackDatePickerType;    // 选择器类型
  lunar?: boolean;              // 是否显示农历
  start?: Date;                 // 起始日期
  end?: Date;                   // 结束日期
  placeholder?: string;         // 占位符
  onChange?: (value: Date) => void; // 日期变化回调
}

@Component
export struct JackDatePicker {
  private selected?: Date;
  @State selectedDate: Date = new Date();
  @State showPicker: boolean = false;
  private type: JackDatePickerType = JackDatePickerType.Date;
  private lunar: boolean = false;
  private start: Date = new Date(1970, 1, 1);
  private end: Date = new Date(2100, 12, 31);
  private placeholder: string = '请选择日期';
  private onChange?: (value: Date) => void;

  aboutToAppear() {
    if (this.selected) {
      this.selectedDate = this.selected;
    }
  }

  // 格式化日期显示
  private formatDate(date: Date): string {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    const hours = String(date.getHours()).padStart(2, '0');
    const minutes = String(date.getMinutes()).padStart(2, '0');

    switch (this.type) {
      case JackDatePickerType.Date:
        return `${year}-${month}-${day}`;
      case JackDatePickerType.Time:
        return `${hours}:${minutes}`;
      case JackDatePickerType.DateTime:
        return `${year}-${month}-${day} ${hours}:${minutes}`;
      default:
        return `${year}-${month}-${day}`;
    }
  }

  build() {
    Column() {
      // 日期选择触发按钮
      Button() {
        Row() {
          Text(this.selectedDate ? this.formatDate(this.selectedDate) : this.placeholder)
            .fontSize(14)
            .fontColor(this.selectedDate ? '#333333' : '#999999')
          
          Blank()
          
          Text('📅')
            .fontSize(16)
            .fontColor('#999999')
        }
        .width('100%')
        .padding({ left: 12, right: 12 })
      }
      .type(ButtonType.Normal)
      .height(40)
      .borderRadius(4)
      .backgroundColor('#FFFFFF')
      .border({
        width: 1,
        color: '#DCDFE6'
      })
      .onClick(() => {
        this.showPicker = true;
      })

      // 日期选择器弹窗
      if (this.showPicker) {
        Column() {
          // 标题栏
          Row() {
            Button('取消')
              .fontSize(14)
              .fontColor('#606266')
              .backgroundColor(Color.Transparent)
              .onClick(() => {
                this.showPicker = false;
              })

            Blank()

            Text('选择日期')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor('#303133')

            Blank()

            Button('确定')
              .fontSize(14)
              .fontColor('#007DFF')
              .backgroundColor(Color.Transparent)
              .onClick(() => {
                this.showPicker = false;
                if (this.onChange) {
                  this.onChange(this.selectedDate);
                }
              })
          }
          .width('100%')
          .height(50)
          .padding({ left: 16, right: 16 })
          .backgroundColor('#FFFFFF')

          Divider()

          // 日期选择器
          if (this.type === JackDatePickerType.Date || this.type === JackDatePickerType.DateTime) {
            DatePicker({
              start: this.start,
              end: this.end,
              selected: this.selectedDate
            })
              .lunar(this.lunar)
              .onChange((value: DatePickerResult) => {
                this.selectedDate = new Date(
                  value.year ?? this.selectedDate.getFullYear(),
                  value.month ?? this.selectedDate.getMonth(),
                  value.day ?? this.selectedDate.getDate(),
                  this.selectedDate.getHours(),
                  this.selectedDate.getMinutes()
                );
              })
              .padding(16)
          }

          // 时间选择器
          if (this.type === JackDatePickerType.Time || this.type === JackDatePickerType.DateTime) {
            TimePicker({
              selected: this.selectedDate
            })
              .useMilitaryTime(true)
              .onChange((value: TimePickerResult) => {
                this.selectedDate = new Date(
                  this.selectedDate.getFullYear(),
                  this.selectedDate.getMonth(),
                  this.selectedDate.getDate(),
                  value.hour ?? this.selectedDate.getHours(),
                  value.minute ?? this.selectedDate.getMinutes()
                );
              })
              .padding(16)
          }
        }
        .width('100%')
        .backgroundColor('#F2F3F5')
        .borderRadius({ topLeft: 16, topRight: 16 })
        .shadow({
          radius: 20,
          color: 'rgba(0, 0, 0, 0.1)',
          offsetY: -2
        })
        .transition({
          type: TransitionType.Insert,
          opacity: 0,
          translate: { y: 100 }
        })
        .transition({
          type: TransitionType.Delete,
          opacity: 0,
          translate: { y: 100 }
        })
      }
    }
    .width('100%')
  }
}

/**
 * JackDatePicker 便捷构建器
 */
@Builder
export function JackDatePickerBuilder(options: JackDatePickerOptions) {
  JackDatePicker({
    selected: options.selected,
    type: options.type,
    lunar: options.lunar,
    start: options.start,
    end: options.end,
    placeholder: options.placeholder,
    onChange: options.onChange
  })
}
