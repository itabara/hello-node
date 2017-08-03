#!groovy

node("docker-ci"){
    def app
    currentBuild.result = "SUCCESS"

    try{
      stage('Clone repository') {
          /* Let's make sure we have the repository cloned to our workspace */

          checkout scm
      }

      stage('Test'){

         env.NODE_ENV = "test"

         print "Environment will be : ${env.NODE_ENV}"

         sh 'node -v'
         sh 'npm prune'
         sh 'npm install'
         sh 'npm test'

         /* Ideally, we would run a test framework against our image.

         app.inside {
             sh 'echo "Tests passed"'
         }
       }

       stage('Build image'){

            sh './dockerBuild.sh'
            /* This builds the actual image; synonymous to
             * docker build on the command line */

            // app = docker.build("iulian/hello-node")
       }

       stage('Push image'){
        /* Finally, we'll push the image with two tags:
        * First, the incremental build number from Jenkins
        * Second, the 'latest' tag.
        * Pushing multiple tags is cheap, as all the layers are reused. */

        echo 'Push to Repo'
        sh './dockerPushToRepo.sh'

        echo 'ssh to web server and tell it to pull new image'
        //sh 'ssh iulian@iulian.co.uk running/xxxxxxx/dockerRun.sh'


        // docker.withRegistry('https://docker.iulian.co.uk', 'docker-registry-credentials') {
        //     app.push("${env.BUILD_NUMBER}")
        //     app.push("latest")
        //}
       }

       stage('Cleanup'){

         echo 'prune and cleanup'
         // sh 'npm prune'
         // sh 'rm node_modules -rf'

//         mail body: 'project build successful',
//                     from: 'xxxx@yyyyy.com',
//                     replyTo: 'xxxx@yyyy.com',
//                     subject: 'project build successful',
//                     to: 'yyyyy@yyyy.com'
       }
    }
    catch (err) {

        currentBuild.result = "FAILURE"

/*            mail body: "project build error is here: ${env.BUILD_URL}" ,
            from: 'xxxx@yyyy.com',
            replyTo: 'yyyy@yyyy.com',
            subject: 'project build failed',
            to: 'zzzz@yyyyy.com'*/
        throw err
    }
}
