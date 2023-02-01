## 11.1 Warming up

Picked Java for the language.

1.
There are many linters for Java, for example Checkstyle which is one of the most popular linters available. In addition, other options includes Lightrun, Error-prone, PMD and Spoon.
Java build tools options are Apache Maven, Ant with ivy, Gradle and SBT. Java test tools options are Selenium, JUnit, Mockito, TestNG, Cucumber and Arquillian.

2.
When setuping the CI for Java, instead of using Jenkins or Github Actions, you can consider using some of the alternatives like GitLab, CircleCI, JetBrains TeamCity, Atlassian Bamboo, Buddy or TravisCI for example.

3.
When considering using self-hosted or cloud-based environment you need to think various things. With self-hosted options billing is mainly based on the hardware and you pay for the server, while cloud-based environments are billed by build time. Also, with self-hosted options you need to setup and configure more than with cloud-hosted options, where you dont need to worry about setups. For small and medium software projects cloud-based solution might be the right pick. It's simple and cheaper. If you have multiple teams and projects, or you have to do something special, then a self-hosted solution is probably better choice. The exercise's example has a team with 6 people, so I think that is considered medium. I would pick cloud-hosted environment for the case.
