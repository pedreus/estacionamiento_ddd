# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

use_frameworks!

workspace 'iOSModulesApp'

target 'Presentation' do
  
  project 'Presentation/Presentation.xcodeproj'

  # Pods for Presentation
  pod 'Swinject'

  target 'PresentationTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'PresentationUITests' do
    # Pods for testing
  end

end

target 'DataAccess' do
  
  project 'DataAccess/DataAccess.xcodeproj'

  # Pods for DataAccess
  pod 'RealmSwift'
  
  target 'DataAccessTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'RealmSwift'
    
  end

end

target 'DeviceHardware' do
  
  project 'DeviceHardware/DeviceHardware.xcodeproj'

  # Pods for DeviceHardware

end

target 'Domain' do
  
  project 'Domain/Domain.xcodeproj'

  # Pods for Domain
  
  target 'DomainTests' do
    inherit! :search_paths
    # Pods for testing
    
  end

end
