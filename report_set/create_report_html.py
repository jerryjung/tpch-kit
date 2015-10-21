#!/usr/lib/python2.7
# -*- coding: utf-8 -*-
import sys
import re
import time
import properties

test_runner = sys.argv[1]
data_type = sys.argv[2]
data_size = sys.argv[3]
running_score = sys.argv[4]
home_dir = sys.argv[5]

resultPath = home_dir + "/result/" + test_runner + "/" + data_type + "/" + data_size + "G/"
reportPath = home_dir + "/report/"

if (test_runner == "spark"):
	runner_version = properties.spark_version
elif (test_runner == "hive"):
	runner_version = properties.hive_version

scoreCount = int(running_score)
queryCount = 22
totalRunTime = 0
scoreTime = [0 for _ in range(scoreCount)]
startTime  = time.strftime("%Y%m%d%H%M%S", time.localtime())
chartData = [ [0]*2 for _ in range(queryCount+1) ]

resultFileName = "TPC_H_"+ test_runner.upper() + "_" + data_type.upper() + "_"+ data_size +"G_REPORT_"+startTime+".html"

f = open(reportPath + resultFileName, 'w')
f.write("<!DOCTYPE html>\n")
f.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n")
f.write("<html>\n")
f.write("<title>" + test_runner.upper() +" Test</title>\n")
f.write("\n")
f.write("<head>\n")
f.write("\n")
f.write("<h2>"+ time.strftime("%Y-%m-%d", time.localtime()) +" " + test_runner.upper() +" TEST</h2>\n")
f.write("<p>Host Name - " + properties.host_name + "</p>\n")
f.write("<p>테스트 조건 - DataSize : " + data_size + ", OS : " + properties.os_version + ", Hadoop : " + properties.hadoop_version + ", " + runner_version + "</p>\n")
f.write("</head>\n")
f.write("\n")
f.write("<body>\n")
f.write("<table border='1'>\n")
f.write("<thead>\n")
f.write("<tr bgcolor = '#999999'>\n")
f.write("<th width = '100'> QueryID </th>\n")
for queryId in range(1,queryCount+1):
	f.write("<th width = '100' align = center> q"+ str('{0:0>2}'.format(queryId)) +" </td>\n")
	chartData[queryId-1][0] = str(queryId)

f.write("<th width = '100'> Total </th>\n")
f.write("</tr>\n")
f.write("</thead>\n")
f.write("\n")
f.write("<tbody>\n")

for score in range(1,scoreCount+1):
	runTime = [0 for _ in range(queryCount) ]
	totalRunTimePerScore = 0
        f.write("<tr>\n")
	f.write("<td width = '100'> Score " + str(score) + "</th>\n")
        for queryId in range(1,queryCount+1):
                startTime = 0
                endTime = 0
                scanLineCount = 0
                startTimeLine = 0
                endTimeLine = 0
                lineCount = 0
                file = resultPath + test_runner + "." + data_type + "." + data_size + "G." + "query." + str('{0:0>2}'.format(queryId)) + "." + str(score)
		try:
	                for scanline in open(file, 'r').readlines():
        	                scanLineCount += 1

                	        if (scanline[0:15] == "Start Time Line"):					
                        	        startTimeLine = scanLineCount + 1

	                        if (scanline[0:13] == "End Time Line"):
        	                        endTimeLine = scanLineCount + 1

               		for line in open(file, 'r').readlines():
                       		lineCount += 1
                        	if (lineCount == startTimeLine):
                                	startTime = line
	                        elif (lineCount == endTimeLine):
        	                        endTime = line
                	runTime[queryId-1] = (int(endTime) - int(startTime)) / 1000
	                totalRunTimePerScore = totalRunTimePerScore + runTime[queryId-1]
        	        f.write("<td align = right> " + str(runTime[queryId-1]) + "<i>s</i></td>\n")
                except IOError:
                        f.write("<td align = right>No Test</td>\n")

	scoreTime[score-1]=runTime
        f.write("<td align = right> " + str(totalRunTimePerScore)+"<i>s</i></td>\n")
        f.write("</tr>\n")
#        queryId = queryId + 1

averageTotalTime = 0
f.write("<tr>\n")
f.write("<td width = '100'>Average</td>\n")
for queryId in range(1,queryCount+1):
	totalTimePerQuery = 0
	for score in range(1,scoreCount+1):
		totalTimePerQuery = totalTimePerQuery + scoreTime[score-1][queryId-1]

	averageTimePerQuery = totalTimePerQuery / scoreCount
	f.write("<td align = right> " + str(averageTimePerQuery) + "<i>s</i></td>\n")
	chartData[queryId-1][1] = str(averageTimePerQuery)
	averageTotalTime = averageTotalTime + averageTimePerQuery
	
f.write("<td align = right> " + str(averageTotalTime)+"<i>s</i></td>\n")
f.write("</tr>\n")
f.write("</table>\n")
f.write("</body>\n")
f.write("</html>\n")
f.close()

chartDataPath = home_dir + "/report_set/chartdata/"
chartDataFileName = "TPC_H_"+ test_runner.upper() + "_" + data_type.upper() + "_"+ data_size +"G_CHARTDATA"

c = open(chartDataPath + chartDataFileName, 'w')
for queryId in range(1,queryCount+1):
	c.write(chartData[queryId-1][0] + "," + chartData[queryId-1][1] + "\n")

c.close()



