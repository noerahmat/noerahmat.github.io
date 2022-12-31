properties(
[pipelineTriggers([pollSCM('* * * * *')])]
)


def FAILED_STAGE

pipeline {
    // agent { label "master" }
    agent any
    
    //environment 
  environment {
    def REPO_NAME = "#REPO_NAME"
    def BRANCH = "#BRANCH"
    def SLACK_CHANEL = "#SLACK_CHANEL"
    def USER = "newrahmat"
    def ORG = "loyaltoid"
    def ALWAYS ="1974D2"
    def FAILURE="ee000d"
    def SUCCESS="1fff00"
    //def HOOKS="https://hooks.slack.com/services/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"
    //def HOOKS="https://hooks.slack.com/services/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"
    def GIT_HASH = sh(returnStdout: true, script: 'git log -1 --pretty=format:"%h"').trim()
    def GIT_BRANCH_NAME = sh(returnStdout: true, script: 'git rev-parse --abbrev-ref HEAD').trim()
    def AUTHOR_NAME = sh(returnStdout: true, script: 'git log -1 --pretty=format:"%an"').trim()
    def AUTHOR_EMAIL = sh(returnStdout: true, script: 'git log -1 --pretty=format:"%ae"').trim()
    def AUTHOR_DATE_RELATIVE = sh(returnStdout: true, script: 'git log -1 --pretty=format:"%ar"').trim()
    def GIT_SUBJECT = sh(returnStdout: true, script: 'git log -1 --pretty=format:"%s"').trim()
}
    
    
    stages {
        stage("PREPARE") {
            steps {
                script {
                    FAILED_STAGE=env.STAGE_NAME
                    echo "PREPARE"
                }
                
//==================================================================================
    // //PULL REPO
    git branch: """${BRANCH}""", 
    credentialsId: 'LOYALTO-DEVOPS', 
    url: """https://${USER}@bitbucket.org/${ORG}/${REPO_NAME}.git"""
//==================================================================================                
                          

    sh label: 'notif starting', script: 
     """
slack \
-h ${HOOKS} \
-c ${SLACK_CHANEL} \
-u "${REPO_NAME} is STARTING" \
-i rocket \
-C ${ALWAYS} \
-T "CICD ${BRANCH}" \
-m "${env.JOB_NAME} , Job No #${env.BUILD_NUMBER} ==> ${env.BUILD_URL} \
    \ncommit (${GIT_HASH}) by ${AUTHOR_NAME}, ${AUTHOR_DATE_RELATIVE} (${GIT_SUBJECT})"
"""                                       

            }
        }
        
        
        stage("PRE-CI") {
            steps {
                script {
                    FAILED_STAGE=env.STAGE_NAME
                    echo "PRE-CI"
                    // error "failed for some reason."
                }
//================================== 
sh label: 'STEP PRE-CI', script: 
"""
pre-ci
"""                   
//================================== 
                
            }
        }
        
         stage("BUILD & TEST") {
             steps {
                 script {
                     FAILED_STAGE=env.STAGE_NAME
                     echo "BUILD & TEST"
                 }
 //================================== 
 sh label: 'STEP BUILD & TEST', script: 
 """
build
 """                   
 //==================================                 
             }
         }
        
        stage("RELEASE") {
            steps {
                script {
                    FAILED_STAGE=env.STAGE_NAME
                    echo "RELEASE"
                }
//================================== 
sh label: 'STEP RELEASE', script: 
"""
release
"""                   
//==================================                 
            }
        }

        stage("POST-CI") {
            steps {
                script {
                    FAILED_STAGE=env.STAGE_NAME
                    echo "POST-CI"
                }
//================================== 
sh label: 'STEP POST-CI', script: 
"""
post-ci
"""                   
//==================================                 
            }
        }

        stage("PRE-CD") {
            steps {
                script {
                    FAILED_STAGE=env.STAGE_NAME
                    echo "PRE-CD"
                }
//================================== 
sh label: 'STEP PRE-CD', script: 
"""
pre-cd
"""                   
//==================================                 
            }
        }


        stage("DEPLOY") {
            steps {
                script {
                    FAILED_STAGE=env.STAGE_NAME
                    echo "DEPLOY"
                }
//================================== 
sh label: 'STEP DEPLOY', script: 
"""
deploy
"""                   
//==================================                 
            }
        }


        stage("POST-CD") {
            steps {
                script {
                    FAILED_STAGE=env.STAGE_NAME
                    echo "POST-CD"
                }
//================================== 
sh label: 'STEP POST-CD', script: 
"""
post-cd
"""                   
//==================================                 
            }
        }



         stage("FINISING") {
             steps {
                 script {
                     FAILED_STAGE=env.STAGE_NAME
                     echo "FINISING"
 //================================== 
 publishHTML (target : [allowMissing: false,
 alwaysLinkToLastBuild: true,
 keepAll: true,
 reportDir: 'cicd',
 reportFiles: 'index.html',
 reportName: 'My Reports',
 reportTitles: 'The Report'])
 //==================================                                      
                 }
 //================================== 
 sh label: 'STEP FINISING', script: 
 """
 echo "PASS"
 """                   
 //==================================                 
             }
         }
        
//END stages        
    }
    
//POST============================================================ 
    post {
        failure {
            // echo "Failed stage name: ${FAILED_STAGE}"
// notif failure
    sh label: 'notif failure', script: 
     """
slack \
-h ${HOOKS} \
-c ${SLACK_CHANEL} \
-u "${REPO_NAME} is FAILURE" \
-i fire \
-C ${FAILURE} \
-T "CICD ${BRANCH}" \
-m "STEP ==> ${FAILED_STAGE}  \
\n ${env.JOB_NAME} , Job No #${env.BUILD_NUMBER} is FAILURE ==> ${env.BUILD_URL}"
"""                                    
// 
        }
        
        success {
            
     sh label: 'notif success', script: 
     """
slack \
-h ${HOOKS} \
-c ${SLACK_CHANEL} \
-u "${REPO_NAME} is SUCCESS" \
-i partying_face \
-C ${SUCCESS} \
-T "CICD ${BRANCH}" \
-m "${env.JOB_NAME} , Job No #${env.BUILD_NUMBER} is SUCCESS"
"""           
            
        }        
        
    }

//END pipeline            
}