# junit classpath
CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

# remove any previous student-submission
rm -rf student-submission
# clone the repository passed in as a CLI into student-submission
git clone $1 student-submission
echo 'Finished cloning'

# cd into the directory
cd student-submission
findfile=`find -name ListExamples.java`
classname="class ListExamples"
findclass=`grep "$classname" ListExamples.java`
if [[ -f $findfile ]] && [[ $findclass == *"class ListExamples"* ]]
then 
    method1="static List<String> filter(List<String> s, StringChecker sc)"
    method2="static List<String> merge(List<String> list1, List<String> list2)"
    containsmethod1=`grep "$method1" ListExamples.java`
    containsmethod2=`grep "$method2" ListExamples.java`
    if [[ $containsmethod1 != *$method1* ]] 
    then
        echo "filter does not exist"
        exit 1
    fi 
    if [[ containsmethod2 != *$method2* ]]
    then    
        echo "merge does not exist"
        exit 1
    fi
    echo "they both exist wow"
fi
