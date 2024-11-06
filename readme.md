一、目录结构
src > main > ets：用于存放ArkTS源码。
src > main > ets > entryability：应用/服务的入口。
src > main > ets > pages：应用/服务包含的页面。
src > main > resources：用于存放应用/服务所用到的资源文件，如图形、多媒体、字符串、布局文件等。


二、路由跳转
导包：import router from '@ohos.router';

跳转 router.pushUrl({ url: 'pages/Second' }).then(() => {
console.info('Succeeded in jumping to the second page.')
}).catch((err) => {
console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
}) 

返回  router.back()
