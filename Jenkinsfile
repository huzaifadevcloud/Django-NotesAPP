@Library('Shared')_
pipeline{
    agent { label 'prod'}
    
    stages{
        stage("Code clone"){
            steps{
                sh "whoami"
            clone("https://github.com/huzaifadevcloud/Django-NotesAPP.git","main")
            }
        }
        stage("Code Build"){
            steps{
            docker_build(imageName: "notes-app", imageTag: "latest")
            //docker_build("notes-app","latest")
            }
        }
        stage("Push to DockerHub"){
            steps{
                docker_push(credentials: 'dockerhub-creds', imageName: 'huzaifafev/python-docker-image', imageTag: 'latest', dockerHubUser: 'huzaifafev')
                //docker_push("dockerhub-creds","notes-app","latest")
            }
        }
        stage("Deploy"){
            steps{
                deploy()
            }
        }
        
    }
}
