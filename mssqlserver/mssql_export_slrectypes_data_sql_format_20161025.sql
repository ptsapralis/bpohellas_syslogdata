select concat('INSERT INTO slrectypes (slrectypename,slrectypecomment) VALUES("',slrectypename,'","',slrectypecomment,'");') from slrectypes;

# How to use this SQL statement:
# Example MacOSX command-line statement:

# sqsh -S sqlsrv2016dev.lan -D newbposyslogdb -U sa -P 'Dr3@mW$@v3R' -L semicolon_hack=on -i mssql_export_slrectypes_data_sql_format_20161025.sql -w 140 -m bcp|sed s/\|//g|sed s/\"/\'/g|mysql --host=mysqldbserver.lan --database=bposyslogdb --user=root --password='Dr3@mW$@v3R'
