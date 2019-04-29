## Maven Wrapper init

A simple script that initializes the Maven Wrapper using temporary empty `settings.xml` and `pom.xml` files to prevent any conflicts with your local maven project.

Using this script prevents the wrapper from using the mirror from your `settings.xml` and it does not try to download any weird dependencies defined in your actual `pom.xml`

Run in the root of your project to add the wrapper. The script uses your `MAVEN_OPTS` and any arguments you supply

