# JenkinsBot-for-lark

该脚本用来解决飞书自带jenkins助手无法支持pipeline流水线模式的推送。

使用方式：
```
pipeline {
  agent any
  stages {
    stage('Hello World') {
      ....
    }
  }
  post {
    aborted {
      sh 'script.sh "abort" "<webhook url>"'
    }
    failure {
      sh 'script.sh "failed" "<webhook url>"'
    }
    success {
      sh 'script.sh "success" "<webhook url>"'
    }
  }
}
```
