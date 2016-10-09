platform :ios, '9.3'

def shared_pods
    pod 'AFNetworking', '~> 3.1', :inhibit_warnings => true
end

target 'Seismi' do
    shared_pods
    pod 'Mantle', '~> 2.0', :inhibit_warnings => true
    pod 'SeismiKit', :git => 'https://github.com/sangeetavishwanath/SeismiKit.git', :branch => 'master'
end

target 'SeismiTests' do
    shared_pods
    pod 'Specta', '1.0.2', :inhibit_warnings => true
    pod 'Expecta', '1.0.0', :inhibit_warnings => true
    pod 'OCMockito', '2.0.1', :inhibit_warnings => true
end

target 'SeismiUITests' do
    shared_pods
end
