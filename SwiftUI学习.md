### SwiftUI学习

1. By default, SwiftUI view files declare two structures. The first structure conforms to the View protocol and describes the view’s content and layout. The second structure declares a preview for that view, conforms to the PreviewProvider protocol.
2. To customize a SwiftUI view, you call methods called modifiers. Modifiers wrap a view to change its display or other properties. Each modifier returns a new view, so it’s common to chain multiple modifiers, stacked vertically.
3. @State声明状态变量，$region绑定状态变量；
4. MKCoordinateSpan地图区域的跨度，latitudeDelta纬度区域，longitudeDelta经度区域；
5. 自定义view在body变量中布局；多个组件用vstack或hstack包裹；view的多个属性可以用链式语法实现；
6. Xcode’s canvas automatically recognizes and displays any type in the current editor that conforms to the PreviewProvider protocol. A preview provider returns one or more views, with options to configure the size and device.
7. keypath类型赋值，\Landmark.id，\类型.key；
8. 报错Value of protocol type 'View' cannot conform to 'View'; only struct/enum/class types can conform to protocols，删除闭包返回值类型即可；
9. 创建List时，数据里面的id可以通过keypath获取，或者设置Model遵循Identifiable协议；
10. NavigationView导航试图，和NavigationLink一起设置导航；NavigationLink(destination:label:)目标页面和当前试图；
