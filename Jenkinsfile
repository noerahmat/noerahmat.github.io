pipeline {
  agent any
  stages {
    stage('prepare') {
      steps {
        sh 'echo "prepare"'
      }
    }

    stage('build') {
      parallel {
        stage('pre-build') {
          steps {
            sh 'echo "pre build..."'
          }
        }

        stage('build and test') {
          steps {
            sh 'echo "build and test ...."'
          }
        }

        stage('post-build') {
          steps {
            echo 'post build'
          }
        }

      }
    }

    stage('release') {
      parallel {
        stage('scan images') {
          steps {
            sh 'echo "scan...."'
          }
        }

        stage('release') {
          steps {
            echo 'check'
          }
        }

      }
    }

    stage('deploy') {
      parallel {
        stage('pre-deploy') {
          steps {
            sh 'echo "pre deploy"'
          }
        }

        stage('deploy') {
          steps {
            sh 'echo "deploy"'
          }
        }

        stage('post-deploy') {
          steps {
            sh 'echo "post deploy"'
          }
        }

      }
    }

    stage('finishing') {
      steps {
        sh 'echo "finising..."'
      }
    }

  }
}