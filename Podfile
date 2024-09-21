# Uncomment the next line to define a global platform for your project

platform :ios, '15.0'
use_frameworks!

def commons 
  pod 'Alamofire', '~> 5.9'
end

target 'WeatherForecast' do
  commons
end

target 'WeatherForecast-Sample' do
  commons
end

target 'WeatherForecastTests' do
  commons
end

target 'WeatherForecastUITests' do
  commons
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
      config.build_settings['SKIP_INSTALL'] = 'YES'
      config.build_settings['ENABLE_BITCODE'] = 'NO'
    end
  end
end