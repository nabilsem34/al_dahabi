allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val rootProjectDir = rootProject.projectDir
val newBuildDir: Directory = rootProjectDir.resolve("../build").toDirectory()
rootProject.layout.buildDirectory.set(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.set(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}