import { webview } from '@kit.ArkWeb';
import { router } from '@kit.ArkUI';
import CommonConstants from  '../common/CommonConstants'

class LinkClass {
  messageFromHtml(value: string) {
    AlertDialog.show({
      message: CommonConstants.WEB_ALERT_DIALOG_TEXT_VALUE + value,
      confirm: {
        value: $r('app.string.web_alert_dialog_button_value'),
        action: () => {
        }
      },
      cancel: () => {
      }
    });
  };

  showToast(value: string){
    console.info(value,"bella................");
  };
}

@Entry
@Component
struct  WebViewTest{
  controller: webview.WebviewController = new webview.WebviewController()

  @State linkObj: LinkClass = new LinkClass();


  build() {
    Column(){
      //Web({ src: "https://zhuanlan.zhihu.com/", controller: this.controller })
      Web({ src: $rawfile("local/index.html"), controller: this.controller })
        .javaScriptAccess(true)
        .zoomAccess(false)
        .width(CommonConstants.WEB_CONSTANT_WIDTH)
        .aspectRatio(1)
        .onConfirm((event) => {
          // 用户定义的弹窗
          AlertDialog.show({
            message: CommonConstants.WEB_ALERT_DIALOG_TEXT_VALUE + event?.message,
            confirm: {
              value: $r('app.string.web_alert_dialog_button_value'),
              action: () => {
                event?.result.handleConfirm();
              }
            },
            cancel: () => {
              event?.result.handleCancel();
            }
          });
          return true;
        }) // 抽奖按钮
        .javaScriptProxy({
          object: this.linkObj,
          name: 'linkObj', // 注入到window的方法集合名称
          methodList: ['showToast','messageFromHtml'], // 注入到h5中的方法
          controller: this.controller
        });

      Button($r('app.string.btnValue'))
        .fontSize(CommonConstants.WEB_CONSTANT_BUTTON_FONT_SIZE)
        .fontColor($r('app.color.start_window_background'))
        .margin({ top: CommonConstants.WEB_CONSTANT_BUTTON_MARGIN_TOP })
        .width(CommonConstants.WEB_CONSTANT_BUTTON_WIDTH)
        .height(CommonConstants.WEB_CONSTANT_BUTTON_HEIGHT)
        .backgroundColor($r('app.color.blue'))
        .borderRadius(CommonConstants.WEB_CONSTANT_BUTTON_BORDER_RADIUS)
        .onClick(() => {
          // 调用js函数的入口
          this.controller.runJavaScript('startDraw()');
        })
    }
    .width(CommonConstants.WEB_CONSTANT_FULL_WIDTH)
    .height(CommonConstants.WEB_CONSTANT_FULL_HEIGHT)
    }
}