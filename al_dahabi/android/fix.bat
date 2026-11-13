@echo off
cd /d "%~dp0"
if not exist gradle\wrapper mkdir gradle\wrapper
(
echo distributionBase=GRADLE_USER_HOME
echo distributionPath=wrapper/dists
echo distributionUrl=https\://services.gradle.org/distributions/gradle-7.5-bin.zip
echo zipStoreBase=GRADLE_USER_HOME
echo zipStorePath=wrapper/dists
) > gradle\wrapper\gradle-wrapper.properties
echo Fait ! Le fichier a ete recree proprement.
pause