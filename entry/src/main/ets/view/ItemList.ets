import { router } from '@kit.ArkUI'

@Component
struct ItemList{
  //@State title: string = '';
  private title: string = '';
  submitArrow?: () => void


  build() {
    Row(){
      Button(){
        Text(this.title)
          .fontColor(Color.Blue)
          .fontSize(24)
      }.margin({
        top:16
      }).padding(16).width(300).onClick(()=>{
        if (this.submitArrow) {
          this.submitArrow()
        }
      })

    }
  }
}

export { ItemList };
