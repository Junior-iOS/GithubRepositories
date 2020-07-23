platform :ios, '13.2'

target 'GithubRepositories' do
  use_frameworks!

  pod 'PromiseKit', '6.10.0'
  pod 'SDWebImage', '5.4.0'

  target 'GithubRepositoriesTests' do
    inherit! :search_paths
    pod 'Nimble', '7.3.4'
    pod 'Cuckoo',
    :git => 'https://github.com/SwiftKit/Cuckoo.git',
    :branch => 'master'
  end

end

