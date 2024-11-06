@Entry
@Component
struct DbTest {
  @State message: string = 'Hello World'

  build() {
    Column(){
      Text("结果").height(80).width("90%").margin(16).backgroundColor("#f2f2f2")

      Button("查询").height(40).width("90%").margin(16).backgroundColor("#1E90FF").onClick(()=>{

      })
      Button("新增").height(40).width("90%").margin(16).backgroundColor("#1E90FF").onClick(()=>{

      })
      Button("修改").height(40).width("90%").margin(16).backgroundColor("#1E90FF").onClick(()=>{

      })
      Button("删除").height(40).width("90%").margin(16).backgroundColor("#1E90FF").onClick(()=>{

      })
    }

  }
}