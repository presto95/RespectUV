platform :ios, '11.0'

target 'RespectUV' do
  use_frameworks!

  pod 'ReactorKit'
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'SnapKit'
  pod 'Then'
  pod 'Firebase/Analytics'
  pod 'Carte'
  pod 'naveridlogin-sdk-ios'

end

post_install do |installer|
  pods_dir = File.dirname(installer.pods_project.path)
  at_exit { `ruby #{pods_dir}/Carte/Sources/Carte/carte.rb configure` }
end
