properties([
    parameters([
        [$class: 'ChoiceParameter', 
            choiceType: 'PT_SINGLE_SELECT', 
            description: 'Select the Source System from the Dropdown List', 
            filterLength: 1, 
            filterable: true, 
            name: 'SOURCE_SYSTEM', 
            randomName: 'choice-parameter-5631314439613972', 
            script: [
                $class: 'GroovyScript', 
                fallbackScript: [
                    classpath: [], 
                    sandbox: false, 
                    script: 
                        'return[\'Could not get Source System\']'
                ], 
                script: [
                    classpath: [], 
                    sandbox: false, 
                    script: 
                      '''import jenkins.*
                         import jenkins.model.*
                         import hudson.*
                         import hudson.model.*
                         def mapList = []
                         File csvFile = new File("${Jenkins.instance.getJob('param0-job').workspace}\\\\source_test_map.txt")
                         csvFile.eachLine { line ->
                             def parts = line.split(":")
                             def tmpMap = [:]
                             tmpMap.putAt("Source_Name", parts[0])
                             tmpMap.putAt("testing_list", parts[1])
                             mapList.add(tmpMap)    
                         }
                         return mapList.Source_Name'''
                ]
            ]
        ], 
        [$class: 'ChoiceParameter', 
            choiceType: 'PT_SINGLE_SELECT', 
            description: 'Select the Pipeline from the Dropdown List', 
            filterLength: 1, 
            filterable: true, 
            name: 'PIPELINE', 
            randomName: 'choice-parameter-5631314439613968', 
            script: [
            $class: 'GroovyScript', 
            fallbackScript: [
                classpath: [], 
                sandbox: false, 
                script: 
                    'return[\'Could not get Pipeline\']'
            ], 
            script: [
                classpath: [], 
                sandbox: false, 
                script: 
                    'return["LANDING_TO_RAW","LANDING_TO_RAW_TO_CURATED"]'
                ]
           ]
        ],
        [$class: 'CascadeChoiceParameter', 
            choiceType: 'PT_SINGLE_SELECT', 
            description: 'Select the Performance Testing Type from the Dropdown List', 
            filterLength: 1, 
            filterable: true, 
            name: 'PERFORMANCE_TESTING_TYPE', 
            randomName: 'choice-parameter-5631314439613970',
            referencedParameters: 'SOURCE_SYSTEM', 
            script: [
                $class: 'GroovyScript', 
                fallbackScript: [
                    classpath: [], 
                    sandbox: false, 
                    script: 
                        'return[\'Could not get Performance Testing Type\']'
                ], 
                script: [
                    classpath: [], 
                    sandbox: false, 
                    script: 
                      '''import jenkins.*
                         import jenkins.model.*
                         import hudson.*
                         import hudson.model.*
                         def mapList = []
                         def tmpMap = [:]
                         File csvFile = new File("${Jenkins.instance.getJob('param0-job').workspace}\\\\source_test_map.txt")
                         csvFile.eachLine { line ->
                         def parts = line.split(":")   
                         tmpMap.putAt("Source_Name", parts[0])
                         tmpMap.putAt("testing_list", Eval.me(parts[1]))
                         if(SOURCE_SYSTEM == tmpMap.Source_Name)
                         {       
                           for (String item : tmpMap.testing_list) {
                                mapList.add(item)
                           }
                         } }
                         return mapList'''
                ]
            ]
        ],
        [$class: 'CascadeChoiceParameter', 
            choiceType: 'PT_SINGLE_SELECT', 
            description: 'Select the Testing Detail Options from the Dropdown List', 
            filterLength: 1, 
            filterable: true, 
            name: 'TESTING_DETAIL_OPTIONS', 
            randomName: 'choice-parameter-5631314439613978',
            referencedParameters: 'PERFORMANCE_TESTING_TYPE', 
            script: [
                $class: 'GroovyScript', 
                fallbackScript: [
                    classpath: [], 
                    sandbox: false, 
                    script: 
                        'return[\'Could not get Testing Detail Options\']'
                ], 
                script: [
                    classpath: [], 
                    sandbox: false, 
                    script: 
                      '''if (PERFORMANCE_TESTING_TYPE.equals("LOAD_TESTING")) {
                            return ["FOLDER_1(>1GB_AND_<2GB)", "FOLDER_2(>2GB_AND_<3GB)", "FOLDER_3(>3GB_AND_<4GB)","FOLDER_4(>4GB_AND_<5GB)"]
                         } else if (PERFORMANCE_TESTING_TYPE.equals("STRESS_TESTING")) {
                            return ["FOLDER_1(>5GB_AND_<10GB)", "FOLDER_2(>10GB)"]
                         } else if (PERFORMANCE_TESTING_TYPE.equals("CONCURRENT_FILES_TESTING")) {
                         //  return ["FOLDER_1(>1_AND_<5)", "FOLDER_2(>5_AND_<10)", "FOLDER_3(>10)"]
                            return [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
                         } else {
                           return [""]
                         }'''
                ]
            ]
        ]       
    ])
])

pipeline {
  environment {
         vari = ""
  }
  agent any
  stages {
      stage ("Performance Testing Framework") {
        steps {
         script{
          echo 'Hello'
          echo "${params.SOURCE_SYSTEM}"
          echo "${params.PIPELINE}"
          echo "${params.PERFORMANCE_TESTING_TYPE}"
          echo "${params.TESTING_DETAIL_OPTIONS}"          
          if (params.SOURCE_SYSTEM.equals("Could not get Source System from Env Param")) {
              echo "Must be the first build after Pipeline deployment.  Aborting the build"
              currentBuild.result = 'ABORTED'
              return
          }
          echo "Crossed param validation"
        } }
      }
  }
}
