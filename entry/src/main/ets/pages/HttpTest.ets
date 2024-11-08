import { http } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct HttpTest {
  @State private  content :string = "";

  getData(){
    console.log("getData.......");
    this.content = "GET"
    let httpRequest = http.createHttp();
    httpRequest.on('headersReceive', (header) => {
      console.info('header: ' + JSON.stringify(header));
    });

    httpRequest.request(
      // 填写HTTP请求的URL地址，可以带参数也可以不带参数。URL地址需要开发者自定义。请求的参数可以在extraData中指定
      "https://gitee.com/xudingqiang/test-json/releases/download/get/gpstest.json",
      {
        method: http.RequestMethod.GET, // 可选，默认为http.RequestMethod.GET
        // 开发者根据自身业务需要添加header字段
        header: {
          'Content-Type': 'application/json'
        },
        // 当使用POST请求时此字段用于传递请求体内容，具体格式与服务端协商确定
        expectDataType: http.HttpDataType.STRING, // 可选，指定返回数据的类型
        usingCache: true, // 可选，默认为true
        priority: 1, // 可选，默认为1
        connectTimeout: 60000, // 可选，默认为60000ms
        readTimeout: 60000, // 可选，默认为60000ms
        usingProtocol: http.HttpProtocol.HTTP1_1, // 可选，协议类型默认值由系统自动指定
        usingProxy: false, // 可选，默认不使用网络代理，自API 10开始支持该属性
      }, (err: BusinessError, data: http.HttpResponse) => {
      if (!err) {
        // data.result为HTTP响应内容，可根据业务需要进行解析
        console.info('Result:' + JSON.stringify(data.result));
        this.content = JSON.stringify(data.result);
        console.info('code:' + JSON.stringify(data.responseCode));
        // data.header为HTTP响应头，可根据业务需要进行解析
        console.info('header:' + JSON.stringify(data.header));
        console.info('cookies:' + JSON.stringify(data.cookies)); // 8+
        // 当该请求使用完毕时，调用destroy方法主动销毁
        httpRequest.destroy();
      } else {
        console.error('error:' + JSON.stringify(err));
        // 取消订阅HTTP响应头事件
        httpRequest.off('headersReceive');
        // 当该请求使用完毕时，调用destroy方法主动销毁
        httpRequest.destroy();
      }
    }
    );
  }


  postData(){
    console.log("postData.......");
    this.content = "POST"
  }

  build() {
      Column(){
        Row(){
          Text("GET请求").padding(16).fontColor('#fff')
        }.onClick(()=>{
            this.getData()
        }).width('90%').height(60).margin(16).backgroundColor('#00ffff')


        Row(){
          Text("POST请求").padding(16).fontColor('#fff')
        }.onClick(()=>{
          this.postData()
        }).margin(16).width('90%').height(60).backgroundColor('#00ffff')


        Row(){
          Text(this.content).padding(16).fontColor('#fff')
        }.margin(16).width('90%').height(120).backgroundColor('#00ffff')

      }.margin(32)

  }
}