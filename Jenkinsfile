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
    }
}
