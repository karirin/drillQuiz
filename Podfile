# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'drill' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for prg
pod 'Firebase/Auth'
pod 'Firebase/Firestore'
pod 'Firebase/Storage'
pod 'Firebase/Database'
pod 'FSCalendar'
pod 'Google-Mobile-Ads-SDK', '<=11.5.0'
pod 'Firebase/Analytics'
pod 'Firebase/Messaging'
pod 'FirebaseAnalytics'
pod 'Firebase/Crashlytics'
end

post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
               end
          end
   end
end

target 'drillTests' do
  inherit! :search_paths
  # Pods for testing
end

target 'drillUITests' do
  # Pods for testing
end