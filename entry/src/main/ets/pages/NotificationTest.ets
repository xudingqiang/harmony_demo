import { notificationManager } from '@kit.NotificationKit';

@Entry
@Component
struct NotificationTest{
  publishNotification() {
    let notificationRequest: notificationManager.NotificationRequest = { // 描述通知的请求
      id: 1, // 通知ID
      content: { // 通知内容
        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT, // 普通文本类型通知
        normal: { // 基本类型通知内容
          title: '测试通知',
          text: '测试通知详情'
        }
      }
    }
    notificationManager.publish(notificationRequest).then(() => { // 发布通知
      console.info('publish success');
    }).catch((err: Error) => {
      console.error(`publish failed,message is ${err}`);
    });
  }


  build() {
      Column(){

        Button("发布通知").onClick(()=>{
          this.publishNotification()

        }).margin(20)

        Button("取消通知").onClick(()=>{
          notificationManager.cancelAll()
        }).margin(20)

      }

    }

}