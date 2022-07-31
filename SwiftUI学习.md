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
11. State is a value, or a set of values, that can change over time, and that affects a view’s behavior, content, or layout. You use a property with the @State attribute to add state to a view. 使用state来保存之后可能改变的值，进而更新页面；使用@State添加；
12. Because you use state properties to hold information that’s specific to a view and its subviews, you always create state as private. @State变量用private修饰；
13. To combine static and dynamic views in a list, or to combine two or more different groups of dynamic views, use the ForEach type instead of passing your collection of data to List. 列表里有动态和静态视图，或者组合多个不同的分组的动态视图，使用ForEach而不是List的构造方法；
14. You use the $ prefix to access a binding to a state variable, or one of its properties. 试图中使用$前缀绑定state变量，双向绑定；
15. SwiftUI subscribes to your observable object, and updates any views that need refreshing when the data changes. 监听所有ObservableObject对象，当对象变化时更新试图；
16. An observable object needs to publish any changes to its data, so that its subscribers can pick up the change. ObservableObject对象改变时需要publish变化，以使监听者知道；使用@Published关键字；
17. The modelData property gets its value automatically, as long as the environmentObject(_:) modifier has been applied to a parent. 使用@EnvironmentObject关键字修饰的变量，会自动更新；
18. Use the @StateObject attribute to initialize a model object for a given property only once during the life time of the app. This is true when you use the attribute in an app instance, as shown here, as well as when you use it in a view. @StateObject属性，在app生命周期中只初始化一次model对象；页面使用environmentObject传递的model对象，使用@EnvironmentObject获取model对象；
19. Because you use a binding, changes made inside this view propagate back to the data source. @binding修饰的变量，试图变化时会修改数据；
20. As you navigate from the list to the detail and tap the button, those changes persist when you return to the list. Because both views access the same model object in the environment, the two views maintain consistency. 因为model对象时全局的，所以更改会保存，在不同页面保持一致；
21. 状态在任何现代应用程序中都是不可避免的，但在 SwiftUI 中，重要的是所有的视图都是它们状态的简单函数，我们不需要直接改变视图，而是操纵状态，让状态决定结果。
    @State 在视图内部使用的数据
    @ObservableObject model类遵守该协议，使用@Published声明需要共享的对象，使用该对象的所有视图会在状态变化时自动更新
    @ObservedObject 修饰的必须是遵守ObservableObject协议的Model类的对象；只是作为View的数据依赖，不被View持有，View更新时ObservedObject对象可能会被销毁；外部存储的数据
    @StateObject 类似ObservedObject对象，区别是StateObject由SwiftUI负责针对一个指定的View，创建和管理一个实例对象，不管多少次View更新，都能够使用本地对象数据而不销毁
23. 其他修饰符
    @EnvironmentObject 环境变量，整个应用程序中的所有视图共享的数据，以在任何需要的地方共享模型数据，同时还可以确保我们在数据更改时自动保持视图更新；可以视为@ObservedObject在许多视图上使用的更智能，更简单的方法；使用View.environmentObject()方法传递EnvironmentObject变量给所有子视图；在子视图中使用@EnvironmentObject可以自动获取到之前设置的环境变量；
    @Binding A property wrapper type that can read and write a value owned by a source of truth；@Binding的作用是在保存状态的属性和更改数据的视图之间创建双向连接，将当前属性连接到存储在别处的单一数据源（single source of truth），而不是直接存储数据。将存储在别处的值语意的属性转换为引用语义，在使用时需要在变量名加$符号。

22. @StateObject的声明周期与当前所在View生命周期保持一致，即当View被销毁后，StateObject的数据销毁，当View被刷新时，StateObject的数据会保持；而ObservedObject不被View持有，生命周期不一定与View一致，即数据可能被保持或者销毁；
23. GeometryReader，A container view that defines its content as a function of its own size and coordinate space. 可以获取到父视图建议的布局大小；GeometryReader dynamically reports size and position information about the parent view and the device, and updates whenever the size changes; for example, when the user rotates their iPhone.
24. path.move开始绘制起点，addLine添加直线点，addQuadCurve添加贝塞尔曲线点，addLines添加一组直线点，
25. Swift 中可以使用 KeyPath 来获取属性值，语法为\Type.property；
26. AnyTransition.asymmetric, Provides a composite transition that uses a different transition for insertion versus removal.  asymmetric 方法传入了两个动画，一个用于插入操作时，一个用于删除操作时。每个动画都可以进行组合；
27. 在 SwiftUI 中，你可以将任意的改变过程封装进一个 withAnimation 块中，SwiftUI 会对这种改变采用 fade in/out 的方式进行动画。
28. `static func move(edge: Edge) -> AnyTransition` Returns a transition that moves the view away, towards the specified edge of the view.
29. ModelData中加载数据，程序运行中需要改变的数据，需要使用@Published标记，改变时会通知其他@StateObject监听者改变状态；不需要改变的不用@Published标记；
30. 遵守Equatbale协议的View可以使用 animation(_:) 直接执行动画；没有遵守Equatbale协议的View可以使用 animation(_:value:) 指定value变化时执行动画；
31. A view’s color, opacity, rotation, size, and other properties are all animatable.
32. `.animation(nil)`关闭动画；
33. withAnimation包裹的属性相关的view都会执行默认fade in/out动画；可以添加参数，指定动画时长和类型；
34. .transition指定显示隐藏动画，默认Fade in/out；扩展AnyTransition类，添加自定义静态变量，实现自定义转场动画；
35. Dictionary(grouping:by:) 根据数组创建字典，by后面的闭包返回key，key值相同的元素组成新的数组作为value；
36. 使用TabView创建Tab，view.tabItem属性设置view关联的tabitem属性；
37. @Environment 就是 View 所在环境的各种环境变量信息的集合。你可以通过键路径 (key path) 对其读写。当创建应用时，会自动创建Environment。其主要作用是传递系统的一些设置。如ColorScheme、NSManagedObjectContext。通过实现EnvironmentKey协议，和扩展EnvironmentValues可以自定义环境变量，手动去注入到根视图上，并初始化注入对象为其设置一个值。
38. @PropertyWarpper修饰的结构体/枚举/类，定义wrappedValue属性，重写set和get方法，获取或设置特定的wrappedValue属性；
    Binding对象是一个Binding类型的变量，当只需要使用值的时候，需要访问其.warppedValue属性来访问里面包裹的值。
39. To represent UIKit views and view controllers in SwiftUI, you create types that conform to the UIViewRepresentable and UIViewControllerRepresentable protocols. 在SwiftUI中使用UIKit里的View或者ViewController，使View遵守UIViewRepresentable协议即可；makeUIViewController创建UIViewController，updateUIViewController解释Updates the state of the specified view controller with new information from SwiftUI；
40. A SwiftUI view that represents a UIKit view controller can define a Coordinator type that SwiftUI manages and provides as part of the representable view’s context. SwiftUI中的View可以定义一个Coordinator类型来控制UIKit的ViewController；
41. SwiftUI manages your UIViewControllerRepresentable type’s coordinator, and provides it as part of the context when calling the methods you created above. SwiftUI管理UIViewController对应的Coordinator；
42. SwiftUI calls this makeCoordinator() method before makeUIViewController(context:), so that you have access to the coordinator object when configuring your view controller. You can use this coordinator to implement common Cocoa patterns, such as delegates, data sources, and responding to user events via target-action. 
43. The coordinator is a good place to store these controllers, because the system initializes them only once, and before you need them to update the view controller. 在Coordinator类中保存和UIKit交互的数据，只初始化一次；
44.  UIViewRepresentable and UIViewControllerRepresentable types have the same life cycle, with methods that correspond to their underlying UIKit types. UIViewRepresentable类似UIViewControllerRepresentable，make方法创建UIView返回给SwiftUI，当SwiftUI变化时，在update方法中接受到最新的SwiftUI的变量，用来更新UIView；
45. pageViewController.viewControllers返回当前显示的ViewController，不是所有的；setViewControllers设置当前显示的ViewController；
