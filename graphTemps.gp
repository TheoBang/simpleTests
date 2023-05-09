set term png
set xdata time
set timefmt "%H:%M:%S"
set xlabel "Time"
set ylabel "CPU Temperature (C°)"
set yrange[30:90]
set output "temp_graph.png"
plot "cpu_temp_log.txt" using 1:2 with lines
