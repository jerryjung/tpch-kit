#!/usr/lib/python2.7
# -*- coding: utf-8 -*-
import sys
import re
import time
import properties
import os.path
from pychart import *

theme.get_options()
theme.use_color=1
theme.reinitialize()

data_size = sys.argv[1]
home_dir = sys.argv[2]
chart_subject =  properties.chart_subject

reportPath = home_dir + "/report/"
dataPath = home_dir + "/report_set/chartdata/"

reportFileName = reportPath + "TPC_H_REPORT_CHART_"+time.strftime("%Y%m%d%H%M%S", time.localtime())+".pdf"
queryCount = 22

data = [ [0]*(len(chart_subject)+1) for _ in range(queryCount) ]
bar_plots = [0 for _ in range(len(chart_subject))]
line_plots = [0 for _ in range(len(chart_subject))]
plot_target = ""
max_time = 1
total_plot_count = 0
plot_count = 0

can = canvas.init(reportFileName)

tb = text_box.T(loc=(0,1100), text="/24 TPC-H RESULT ( " + time.strftime("%Y%m%d", time.localtime()) + " )", line_style=None)
tb.draw()
tb = text_box.T(loc=(20,1080), text="/12OS : " + properties.os_version, line_style=None)
tb.draw()
tb = text_box.T(loc=(20,1060), text="/12Hadoop : " + properties.hadoop_version, line_style=None)
tb.draw()
tb = text_box.T(loc=(20,1040), text="/12" + properties.spark_version, line_style=None)
tb.draw()
tb = text_box.T(loc=(20,1020), text="/12" + properties.hive_version, line_style=None)
tb.draw()
tb = text_box.T(loc=(20,1000), text="/12Data Size : " + data_size + "GB", line_style=None)
tb.draw()



for queryId in range(1,queryCount+1):
        data[queryId-1][0] = "Q"+ str('{0:0>2}'.format(queryId))

for subject in range(0, len(chart_subject)):
	queryId = 1
	dataFileName = dataPath + "TPC_H_" + chart_subject[subject].upper() + "_" + str(data_size) + "G_CHARTDATA"
	if (os.path.isfile(dataFileName)): 
		lines = open(dataFileName, 'r').readlines()
		total_plot_count = total_plot_count + 1
		for line in lines:
			data[queryId-1][subject+1] = int(line.split(",")[1][:-1])

			if ( max_time < data[queryId-1][subject+1] ):
				max_time = data[queryId-1][subject+1]

			queryId = queryId + 1

tic_time = (max_time / 100 + 1) * 10

chart_object.set_defaults(area.T, size = (900, 450), y_range = (0, max_time*1.2), x_coord = category_coord.T(data, 0))
chart_object.set_defaults(bar_plot.T, data = data)

ar = area.T(legend = legend.T(),loc=(0,500), x_axis=axis.X(label="Query ID"), y_axis=axis.Y(label="Times(s)", tic_interval=tic_time), bg_style = fill_style.gray90)

for subject in range(0, len(chart_subject)):
	dataFileName = dataPath + "TPC_H_" + chart_subject[subject].upper() + "_" + str(data_size) + "G_CHARTDATA"
	
	if (os.path.isfile(dataFileName)):
		chart_label=chart_subject[subject]
        	bar_plots[subject] = bar_plot.T(label=chart_label, hcol=subject+1, cluster=(plot_count,total_plot_count))
		ar.add_plot(bar_plots[subject])
		plot_count = plot_count + 1

ar.draw()

ar = area.T(legend = legend.T(), x_axis=axis.X(label="Query ID"), y_axis=axis.Y(label="Times(s)", tic_interval=10), bg_style = fill_style.gray90)

for subject in range(0, len(chart_subject)):
        dataFileName = dataPath + "TPC_H_" + chart_subject[subject].upper() + "_" + str(data_size) + "G_CHARTDATA"

        if (os.path.isfile(dataFileName)):
                chart_label=chart_subject[subject]
                line_plots[subject] = line_plot.T(label=chart_label,data=data, ycol=subject+1, tick_mark=tick_mark.circle2)
                ar.add_plot(line_plots[subject])

ar.draw()


