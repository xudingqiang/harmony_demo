import  router from '@ohos.router'
import {ItemList} from '../view/ItemList'

@Entry
@Component
struct Index {
  @State message: string = 'this is my first app'


  toPage: () => void = () => {
    router.pushUrl({ url: 'pages/Page_Test' }).then(() => {
      console.info('Succeeded in jumping to the second page.')
    }).catch((err:object) => {
      // console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
    })
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(32)
          .fontWeight(FontWeight.Bold)
        Text("Welcome to harmony")

        ItemList({title:'布局组件测试',submitArrow: this.toPage})

        ItemList({title:'待办列表',submitArrow:()=>{
          router.pushUrl({ url: 'pages/ToDoList' }).then(() => {
          }).catch((err:object) => {
          })
        }})

        // Button(){
        //   Text("布局组件测试")
        //     .fontColor(Color.Blue)
        //     .fontSize(24)
        // }.margin({
        //   top:16
        // }).padding(16).width(300).onClick(()=>{
        //
        // })

        Button(){
          Text("数据库测试")
            .fontColor(Color.Blue)
            .fontSize(24)
        }.margin({
          top:16
        }).padding(16).width(300).onClick(()=>{
          router.pushUrl({ url: 'pages/DbTest' }).then(() => {
          }).catch((err:object) => {
            // console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
          })
        })

        Button(){
          Text("Http测试")
            .fontColor(Color.Blue)
            .fontSize(24)
        }.margin({
          top:16
        }).padding(16).width(300).onClick(()=>{
          router.pushUrl({ url: 'pages/DbTest' }).then(() => {
          }).catch((err:object) => {
            // console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
          })
        })

        Button(){
          Text("图片加载测试")
            .fontColor(Color.Blue)
            .fontSize(24)
        }.margin({
          top:16
        }).padding(16).width(300).onClick(()=>{
          router.pushUrl({ url: 'pages/DbTest' }).then(() => {
          }).catch((err:object) => {
            // console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
          })
        })


        Button(){
          Text("openGL测试")
            .fontColor(Color.Blue)
            .fontSize(24)
        }.margin({
          top:16
        }).padding(16).width(300).onClick(()=>{
          router.pushUrl({ url: 'pages/DbTest' }).then(() => {
          }).catch((err:object) => {
            // console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
          })
        })

      }
      .width('100%')
    }
    .height('100%')
  }
}