platform :ios, '11.0'

target 'RespectUV' do
  use_frameworks!

  pod 'naveridlogin-sdk-ios'
  pod 'Carte'
  pod 'Firebase/Analytics'
  pod 'ReactorKit'
  pod 'RxCocoa'
  pod 'RxDataSources'
  pod 'RxSwift'
  pod 'RxViewController'
  pod 'SnapKit'
  pod 'Then'

end

post_install do |installer|
  pods_dir = File.dirname(installer.pods_project.path)
  at_exit { `ruby #{pods_dir}/Carte/Sources/Carte/carte.rb configure` }
end
