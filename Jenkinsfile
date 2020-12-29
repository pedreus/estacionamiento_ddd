pipeline {
  //Donde se va a ejecutar el Pipeline
  agent {
    label 'Slave_Mac'
  }

  //Opciones específicas de Pipeline dentro del Pipeline
  options {
    buildDiscarder(logRotator(numToKeepStr: '3'))
	disableConcurrentBuilds()
  }


  //Aquí comienzan los “items” del Pipeline
  stages{
    /*stage('Checkout') {
      steps{
        echo "------------>Checkout<------------"
        checkout([
          $class: 'GitSCM', 
          branches: [[name: 'main']], 
          doGenerateSubmoduleConfigurations: false, 
          extensions: [], 
          submoduleCfg: [], 
          userRemoteConfigs: [[
            credentialsId: 'GitHub_pedro.erazo', 
            url:'https://github.com/pedreus/estacionamiento_ddd.git'
          ]]
        ])
      }
    }*/

    stage('Build') {
      steps {
        echo "------------>Build<------------"
	sh 'xcodebuild -scheme "Domain" clean build CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED="NO"'
        //sh 'xcodebuild -scheme "DataAccess" clean build CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED="NO"'
        //sh 'xcodebuild -scheme "Presentation" clean build CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED="NO"'
      }
    }  
    
    stage('Unit Tests') {
      steps{
        echo "------------>Unit Tests<------------"
        //sh 'xcodebuild -scheme "ICTest" -enableCodeCoverage YES -configuration Debug -destination "name=iPhone 11" build-for-testing | tee build/xcodebuild-test.log | xcpretty'
        sh 'xcodebuild -scheme "Domain" -configuration "Debug" build test -destination "platform=iOS Simulator,name=iPhone 11,OS=14.2" -enableCodeCoverage YES | /usr/local/bin/xcpretty -r junit'
        //sh 'xcodebuild -scheme "DataAccess" -configuration "Debug" build test -destination "platform=iOS Simulator,name=iPhone 11,OS=14.2" -enableCodeCoverage YES | /usr/local/bin/xcpretty -r junit'
        //sh 'xcodebuild -scheme "Presentation" -configuration "Debug" build test -destination "platform=iOS Simulator,name=iPhone 11,OS=14.2" -enableCodeCoverage YES | /usr/local/bin/xcpretty -r junit'
      }
    }

    stage('Static Code Analysis') {
      steps{
        echo '------------>Análisis de código estático<------------'
        withSonarQubeEnv('Sonar') {
          sh "${tool name: 'SonarScanner', type:'hudson.plugins.sonar.SonarRunnerInstallation'}/bin/sonar-scanner -Dproject.settings=sonar-project.properties"
        }
      }
    }

    
  }

  post {
    always {
      echo 'This will always run'
    }
    success {
      echo 'This will run only if successful'
    }
    failure {
      echo 'This will run only if failed'
      mail (to: 'pedro.erazo@ceiba.com.co',subject: "Failed Pipeline:${currentBuild.fullDisplayName}",body: "Something is wrong with ${env.BUILD_URL}")

    }
    unstable {
      echo 'This will run only if the run was marked as unstable'
    }
    changed {
      echo 'This will run only if the state of the Pipeline has changed'
      echo 'For example, if the Pipeline was previously failing but is now successful'
    }
  }
}
