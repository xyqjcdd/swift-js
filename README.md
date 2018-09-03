# swift-js(UIWebView)

swift/OC与JS的交互(WKWebView)
---

swift 版：[Swift-JS GitHub](https://github.com/xyqjcdd/WKWebJSSwift.git)

OC版：[OC-JS GitHub](https://github.com/xyqjcdd/WKWebJSOC.git)

OC与JS的交互（UIWebView）
---

OC版：[OC调用JS GitHub](https://github.com/xyqjcdd/OC-JavaScript.git)

swift 版：[swift调用js](https://github.com/xyqjcdd/swift-js.git)

这是用swift写的，用的是JavaScriptCore。


swift3.0之前是这个方法
```
jsContext.setObject(self, forKeyedSubscript: "jsobject");
```
swift3.0之后改成下面的，js就不能调用swift的方法了
```
jsContext.setObject(self, forKeyedSubscript: "jsobject" as (NSCopying & NSObjectProtocol)!);
```
开始我以为是这个方法的问题，纠结了好久。后来发现不是这个的问题，其实改起来也很简单，只要在`protocol`前加上`@objc`就可以了
```
@objc protocol JSObjectMethods: JSExport
{
    func upAction(_ username:String);
    func test();
}
```
如果需要传参数，则需要在参数之前加`_`，就可以获取到参数了。
```
func upAction(_ username:String);
```
上面这些是我的解决办法，如果不对欢迎吐槽，一起学习。
