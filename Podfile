# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'ZYExampleObjective-C' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!
  # Pods for ZYExampleObjective-C

#  工具
#  https://github.com/netyouli/WHC_DataModelFactory json转模型开发辅助工具
#  https://github.com/tinymind/LSUnusedResources 无用资源检测
#  https://github.com/wuba/WBBlades/blob/master/README_CN.md 基于Mach-O文件解析的工具集，包括无用代码检测（支持OC和Swift）、包大小分析、无符号表日志符号化。
#  https://github.com/EchoZuo/ECPrivacyCheckTools 系统隐私权限检测工具
#  https://blog.csdn.net/u014616159/article/details/81016061 修改项目名

#  混淆
#  https://github.com/juguangtool/iOSConfusion 混淆过审免费
#  https://github.com/520coding/confuse 混淆过审免费
#  https://github.com/chenxiancai/STCObfuscator 混淆免费
#  https://github.com/2621532542/iOS_NQConfuseTool 混淆免费
#  https://github.com/netyouli/WHC_ConfuseSoftware 过审混淆工具收费

# Debug检测
  pod 'MLeaksFinder', :configurations => ['Debug'] # 内存泄漏
  pod 'FLEX', :configurations => ['Debug']
  pod 'dyci', :git => 'https://github.com/DyCI/dyci-main.git'
  
  
# frameworks
  pod 'AFNetworking'      # 网络库
  pod 'YTKNetwork'        # 二次封装AFNetworking
  pod 'YYKit'             # 图片加载YYImage 缓存YYCache 分类YYCategories 富文本YYText
  pod 'SDWebImage'        # 图片加载
  pod 'NullSafe'          # 数据安全
  pod 'MBProgressHUD'     # loading  SVProgressHUD / Toast
  pod 'MJRefresh'         # 刷新
  pod 'IQKeyboardManager' # 键盘
  pod 'Masonry'           # 布局
  pod 'FMDB'              # 数据库
  pod 'KVOController'     # KVO安全 sudo chmod -R 750 Pods
  pod 'LSSafeProtector'   # 防崩溃
  pod 'SDCycleScrollView' # 轮播图
  pod 'JXCategoryView'    # 子控制器
  pod 'HMSegmentedControl'# segment
  pod 'DZNEmptyDataSet'   # 空白页
  pod 'DKNightVersion'    # 白天黑夜模式
  pod 'ZFPlayer'          # 播放器控制层
  pod 'CTMediator'        # 路由
  pod "BeeHive"           # 路由
  pod 'FSCalendar'        # DateTools
  pod 'MWPhotoBrowser'    # TZImagePickerController
  pod 'Aspects'           # Hook
  pod 'LSTPopView'        # 弹窗 SCLAlertView
  pod 'TPKeyboardAvoiding'# 文字输入时，能根据键盘是否弹出来调整自身显示内容的位置
  pod 'ZWLimitCounter'    # textView分类，限制字符数，并显示label计数
  pod 'ZWPlaceHolder'     # textView分类，增加placeHolder
  pod 'ZWPullMenuView'    # 下拉选择视图
  pod 'JKCountDownButton' # 倒计时按钮
  pod 'TTTAttributedLabel'#
  pod 'ReactiveCocoa'     #
  pod 'IGListKit'         # 异步绘制
  pod 'BlocksKit'         # block
  pod 'SAMKeychain'       #
  pod 'WRNavigationBar'   # navigationbar设置
  pod 'AXWebViewController'             # RxWebViewController
  pod 'FDFullscreenPopGesture'          # 侧滑返回
  pod 'AFDownloadRequestOperation'      # 队列中下载多个文件
  pod 'HYBMasonryAutoCellHeight'        #
  pod 'UITableView+FDTemplateLayoutCell'# TableView高度缓存 SWTableViewCell
  # 分类 JKCategories YYCategories LSTCategory
  #  pod 'CYLTabBarController'
  pod 'CYLTabBarController/Lottie', '1.24.2' # [CN]依赖Lottie库 [EN] Depend on lottie
#  pod 'ZWHTMLImage'       # WEB网页、HTML的native图片预览功能 目前存在SDWebImage和UIWebview版本问题
  

  # KJNetworkPlugin 插件版网络请求架构 

  #  learn
#  HSUpdateApp XHVersion Version 更新
#  https://github.com/MQCCoder/XYIAPKit 内购
#  https://github.com/wangziwu/TimLiu-iOS iOS开发常用三方库、插件、知名博客等等
#  https://github.com/wangziwu/Swift swift基础知识大全,🚀Swift学习从简单到复杂
#  https://github.com/wujunyang/MVVMReactiveCocoaDemo ReactiveCocoa的知识点及MVVM模式运用
#  https://github.com/SmileZXLee/ZXHookDetection hook及越狱的基本防护与检测(动态库注入检测、hook检测与防护、越狱检测、签名校验、IDA反编译分析加密协议Demo)；【数据传输安全】浅谈http、https与数据加密
# https://www.jianshu.com/p/3f9ed86a45cb  启动优化：二进制重排
# https://juejin.cn/post/6844904121896534024 深入探索 iOS 启动速度优化（二进制重排）
# https://github.com/wsl2ls/WSLTransferAnimation iOS 自定义转场动画集锦
# http://liumh.com/2018/10/11/beehive-analysis/ 阿里组件化框架BeeHive解析
# https://tech.youzan.com/you-zan-ioszu-jian-hua-jia-gou-she-ji-shi-jian/ 有赞移动 iOS 组件化（模块化）架构设计实践


  # MVVMReactiveCocoa
  # UIView-Shadow-Maker
  # 'XMShareModule' # 三大平台分享

end

post_install do |installer|
  
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
        end
    end
end

