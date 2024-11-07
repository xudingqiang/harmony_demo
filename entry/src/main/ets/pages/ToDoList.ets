import  CommonConstants from '../common/CommonConstants'
import ToDoItem from '../view/ToDoItem'
import  DataModel from  '../viewmodel/DataModel'

@Entry
@Component
struct ToDoList{
  private todoTasks :Array<string> =[];

  aboutToAppear(): void {
    this.todoTasks = DataModel.getData()
  }

  build() {
      
    Column({ space: CommonConstants.COLUMN_SPACE }){
      ForEach(this.todoTasks,(item:string)=>{
        ToDoItem({content:item})
      })
    }

  }
}