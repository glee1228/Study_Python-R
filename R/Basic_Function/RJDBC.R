library(RJDBC)
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_171')

jdbcDriver<-JDBC(driverClass = 'oracle.jdbc.OracleDriver', classPath = "C:\\test\\ojdbc6.jar")
con <- dbConnect(jdbcDriver, "jdbc:oracle:thin:@localhost:1521:xe","MULCAM","ldh1228")
result <- dbGetQuery(con,"select * from all_tables where owner='mulcam'")
result <- dbGetQuery(con,"select * from EMP")
result

