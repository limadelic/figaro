set path=C:\Ruby\18\bin;%path%
start chrome http://localhost:8081/FrontPage
java -Xmx100M -jar fitnesse.jar -o -e 0 -p 8081 %1 %2 %3 %4 %5
pause

