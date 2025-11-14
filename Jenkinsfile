@Library('Shared') _

pipeline {
    agent any

    parameters {
        string(name: 'DOCKER_TAG', defaultValue: '', description: 'Tag for Docker Images (e.g., CV1, CV2, latest)')
    }

    environment {
        SONAR_HOME = tool "sonar"
    }

    stages {

        stage('Validate Parameters') {
            steps {
                script {
                    if (!params.DOCKER_TAG?.trim()) {
                        error '❌ DOCKER_TAG parameter is required! Please provide a tag value (e.g., v1, v2).'
                    } else {
                        echo "✅ DOCKER_TAG is set to: ${params.DOCKER_TAG}"
                    }
                }
            }
        }

        stage('Workspace cleanup') {
            steps { cleanWs() }
        }

        stage('Git Clone') {
            steps {
                script {
                    code_checkout("https://github.com/rohitDev450/CampVista.git", "main")
                }
            }
        }

        stage('Trivy: Filesystem scan') {
            steps {
                script { trivy_scan() }
            }
        }

        stage('OWASP: Dependency check') {
            steps {
                script { owasp_dependency() }
            }
        }

        stage('SonarQube: Code Analysis') {
            steps {
                script {
                    sonarqube_analysis("sonar", "CampVista", "CampVista")
                }
            }
        }

        stage('SonarQube: Code Quality Gates') {
            steps {
                script { sonarqube_code_quality() }
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    '''
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh '''
                    docker build -t rohitar/campvista:${DOCKER_TAG} .
                '''
            }
        }

        stage('Docker Image Push') {
            steps {
                sh '''
                    docker push rohitar/campvista:${DOCKER_TAG}
                '''
            }
        }
    }

    // POST BLOCK IS OPTIONAL AND VALID
    // post {
    //     success {
    //         script {
    //             def xmlFiles = findFiles(glob: '*.xml')
    //             if (xmlFiles.length > 0) {
    //                 archiveArtifacts artifacts: '*.xml', followSymlinks: false
    //             } else {
    //                 echo "No XML files to archive"
    //             }

    //             catchError(buildResult: 'SUCCESS', stageResult: 'SUCCESS') {
    //                 build job: "Codexhub-CD",
    //                       parameters: [string(name: 'DOCKER_TAG', value: "${params.DOCKER_TAG}")],
    //                       wait: false, propagate: false
    //             }
    //         }
    //     }
    // }
}
