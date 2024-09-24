Pod::Spec.new do |s|
    s.name             = 'WeatherForecast'
    s.version          = '1.0.0'
    s.summary          = 'This iOS app provides real-time weather updates and forecasts using data from a reliable weather API OpenWeatherMap. Built using Swift, the app offers a clean, intuitive user interface powered by UIKit, ensuring smooth interactions and responsiveness.'
    
    s.description      = <<-DESC
      The Weather Forecast App is configured with XcodeGen and includes support for unit testing, interface testing, and snapshot testing. Below are the installation instructions and a description of the main technologies and features implemented.
    DESC
    
    s.homepage         = 'https://github.com/jovitorneves/WeatherForecastApp'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'João Vitor' => 'j.victtor.neves@hotmail.com' }
    s.source           = { :git => 'https://github.com/jovitorneves/WeatherForecastApp.git', :tag => s.version.to_s }
    
    s.platform     = :ios, '15.0'
    s.ios.deployment_target = '15.0'
    s.swift_version = '5.0'

    s.default_subspec = 'Release'
    
    s.subspec 'Release' do |release|
        release.vendored_frameworks = 'WeatherForecast.xcframework'
        release.pod_target_xcconfig = { 
            'ENABLED_BITCODE' => 'NO',
            'SKIP_INSTALL' => 'NO'
        }
    end
    
    s.subspec 'Debug' do |debug|
        debug.source_files  = 'WeatherForecast/Classes/**/*.{swift}'
        debug.resources = 'WeatherForecast/Assets/**/*',
                          'WeatherForecast/Classes/**/*.{xib,json,png,strings}'
        debug.test_spec 'Tests' do |test_spec|
            test_spec. source_files = 'WeatherForecast/Tests/**/*.(swift,json}'
            test spec. resources = 'WeatherForecast/Tests/**/*-json'
        end
    end
    
    # s.dependency 'Alamofire', '~> 5.0'
    
  end
  