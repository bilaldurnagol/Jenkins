pipeline {
     agent { label 'mac-pro-slave' }
    environment {
        // Sisteminizdeki Xcode sürümüne göre ayarlayın.
        DEVELOPER_DIR = "/Applications/Xcode.app/Contents/Developer"
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                // Archive işlemi için xcodebuild komutunu çalıştırır.
                sh 'xcodebuild -workspace Jenkins.xcworkspace -scheme JenkinsDemo -sdk iphonesimulator'
               // sh 'xcodebuild -workspace YourWorkspace.xcworkspace -scheme YourScheme archive -archivePath ./build/YourApp.xcarchive'
            }
        }

        stage('Archive') {
            steps {
                // iOS devices
                sh 'xcodebuild archive \
                        -scheme JenkinsSDK \
                        -archivePath "archives/JenkinsSDK-iOS.xcarchive" \
                        -destination "generic/platform=iOS" \
                        -sdk iphoneos \
                        SKIP_INSTALL=NO \
                        BUILD_LIBRARY_FOR_DISTRIBUTION=YES'
                // iOS simulators
                sh 'xcodebuild archive \
                        -scheme JenkinsSDK \
                        -archivePath "archives/JenkinsSDK-iOS-simulator.xcarchive" \
                        -destination "generic/platform=iOS Simulator" \
                        -sdk iphonesimulator \
                        SKIP_INSTALL=NO \
                        BUILD_LIBRARY_FOR_DISTRIBUTION=YES'
                        
            }
        }

          stage('Create XCFramework') {
            steps {
                 sh 'xcodebuild -create-xcframework \
                -framework "archives/JenkinsSDK.xcarchive/Products/Library/Frameworks/JenkinsSDK.framework" \
                -framework "archives/JenkinsSDK-iOS-simulator.xcarchive/Products/Library/Frameworks/JenkinsSDK.framework" \
                -output "JenkinsSDK.xcframework"'
            }
        }
    }
}
