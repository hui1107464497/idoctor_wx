source 'https://github.com/CocoaPods/Specs.git'
platform :ios, "8.0"
use_frameworks!

target 'Doctor8_swift' do


pod 'SVProgressHUD', '~> 1.1.3'
pod "AFNetworking"
pod 'MJExtension'                           #model与Json转换
pod 'MJRefresh'                             #下拉刷新
pod 'IQKeyboardManager'                     #键盘
pod 'WebViewJavascriptBridge'
pod 'SDCycleScrollView'
pod 'HCSStarRatingView'                     #评分星星
pod 'LBXScan', '~> 1.1.1'                   #ZXing二维码封装
#pod 'SDWebImage'                           #已添加，不需要重复填写
#pod 'Bugtags'
#pod 'RongCloudIMKitWithVoip', '2.7.0'
pod 'UMengAnalytics-NO-IDFA'                #无IDFA版SDK

#pod 'Reveal-iOS-SDK', '1.6.2',  :configurations => ['Debug']

if defined? installer_representation.project
    post_install do |installer_representation|
        installer_representation.project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['ARCHS'] = 'armv7 arm64'
                config.build_settings['VALID_ARCHS'] = 'armv7 arm64'
                config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
            end
        end
    end
end

if defined? installer_representation.pods_project
    post_install do |installer_representation|
        installer_representation.pods_project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['ARCHS'] = 'armv7 arm64'
                config.build_settings['VALID_ARCHS'] = 'armv7 arm64'
                config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
            end
        end
    end
end

end
