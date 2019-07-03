#!/usr/bin/env groovy

pipelineJob(jobName) {
  disabled90
  definition {
    cpsScm {
      scm {
        git {
          remote {
            url("https://github.com/mahendarkusuma/jenkins-poc.git")
            credentials('mahendar.kusuma@gmail.com')
          }
          branch('master')
         } 
        }
        scriptPath('Jenkinsfile')
      }
     }
     
    }   
