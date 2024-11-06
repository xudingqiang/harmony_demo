@Entry
@Component
struct Page_Test {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Text('间距20').fontSize(16).fontColor(Color.Gray).width('95%').padding(20)
      Column(){
        Row().width('90%').height(50).backgroundColor(0xF5DEB3)
        Row().width('90%').height(50).backgroundColor(0xF5DEE3)
        Row().width('90%').height(50).backgroundColor(0xF5EEA3)
        Row() { Text('wifi开关').fontSize(14)
          Toggle({type : ToggleType.Switch ,isOn:true})}
      }.width('100%').height(200).justifyContent(FlexAlign.SpaceBetween)


      Row(){
        Column().width('20%').height(30).backgroundColor(Color.Blue)
        Column().width('20%').height(30).backgroundColor(Color.Red)
        Column().width('20%').height(30).backgroundColor(Color.Yellow)
      }.alignItems(VerticalAlign.Bottom).width('100%').height(80)

    }
    .height('100%')
  }
}