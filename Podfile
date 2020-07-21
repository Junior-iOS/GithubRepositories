platform :ios, '13.2'

def testing_libs
  # Pods for testing
  pod 'Nimble', '7.3.4'
  pod 'Cuckoo', '0.13.0'
end

target 'GithubRepositories' do
  use_frameworks!

  pod 'PromiseKit', '6.10.0'
  pod 'SDWebImage', '5.4.0'

  target 'GithubRepositoriesTests' do
    inherit! :search_paths
    testing_libs
  end

end

