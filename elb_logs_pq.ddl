CREATE EXTERNAL TABLE `elb_logs_pq`(
  `request_timestamp` string, 
  `elb_name` string, 
  `request_ip` string, 
  `request_port` int, 
  `backend_ip` string, 
  `backend_port` int, 
  `request_processing_time` double, 
  `backend_processing_time` double, 
  `client_response_time` double, 
  `elb_response_code` string, 
  `backend_response_code` string, 
  `received_bytes` bigint, 
  `sent_bytes` bigint, 
  `request_verb` string, 
  `url` string, 
  `protocol` string, 
  `user_agent` string, 
  `ssl_cipher` string, 
  `ssl_protocol` string)
PARTITIONED BY ( 
  `year` int, 
  `month` int, 
  `day` int)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://athena-examples/elb/parquet'
TBLPROPERTIES (
  'parquet.compress'='SNAPPY', 
  'spark.sql.sources.schema.numPartCols'='3', 
  'spark.sql.sources.schema.numParts'='1', 
  'spark.sql.sources.schema.part.0'='{\"type\":\"struct\",\"fields\":[{\"name\":\"request_timestamp\",\"type\":\"string\",\"nullable\":true,\"metadata\":{\"HIVE_TYPE_STRING\":\"string\"}},{\"name\":\"elb_name\",\"type\":\"string\",\"nullable\":true,\"metadata\":{\"HIVE_TYPE_STRING\":\"string\"}},{\"name\":\"request_ip\",\"type\":\"string\",\"nullable\":true,\"metadata\":{\"HIVE_TYPE_STRING\":\"string\"}},{\"name\":\"request_port\",\"type\":\"integer\",\"nullable\":true,\"metadata\":{\"HIVE_TYPE_STRING\":\"int\"}},{\"name\":\"backend_ip\",\"type\":\"string\",\"nullable\":true,\"metadata\":{\"HIVE_TYPE_STRING\":\"string\"}},{\"name\":\"backend_port\",\"type\":\"integer\",\"nullable\":true,\"metadata\":{\"HIVE_TYPE_STRING\":\"int\"}},{\"name\":\"request_processing_time\",\"type\":\"double\",\"nullable\":true,\"metadata\":{\"HIVE_TYPE_STRING\":\"double\"}},{\"name\":\"backend_processing_time\",\"type\":\"double\",\"nullable\":true,\"metadata\":{\"HIVE_TYPE_STRING\":\"double\"}},{\"name\":\"client_response_time\",\"type\":\"double\",\"nullable\":true,\"metadata\":{\"HIVE_TYPE_STRING\":\"double\"}},{\"name\":\"elb_response_code\",\"type\":\"string\",\"nullable\":true,\"metadata\":{\"HIVE_TYPE_STRING\":\"string\"}},{\"name\":\"backend_response_code\",\"type\":\"string\",\"nullable\":true,\"metadata\":{\"HIVE_TYPE_STRING\":\"string\"}},{\"name\":\"received_bytes\",\"type\":\"long\",\"nullable\":true,\"metadata\":{\"HIVE_TYPE_STRING\":\"bigint\"}},{\"name\":\"sent_bytes\",\"type\":\"long\",\"nullable\":true,\"metadata\":{\"HIVE_TYPE_STRING\":\"bigint\"}},{\"name\":\"request_verb\",\"type\":\"string\",\"nullable\":true,\"metadata\":{\"HIVE_TYPE_STRING\":\"string\"}},{\"name\":\"url\",\"type\":\"string\",\"nullable\":true,\"metadata\":{\"HIVE_TYPE_STRING\":\"string\"}},{\"name\":\"protocol\",\"type\":\"string\",\"nullable\":true,\"metadata\":{\"HIVE_TYPE_STRING\":\"string\"}},{\"name\":\"user_agent\",\"type\":\"string\",\"nullable\":true,\"metadata\":{\"HIVE_TYPE_STRING\":\"string\"}},{\"name\":\"ssl_cipher\",\"type\":\"string\",\"nullable\":true,\"metadata\":{\"HIVE_TYPE_STRING\":\"string\"}},{\"name\":\"ssl_protocol\",\"type\":\"string\",\"nullable\":true,\"metadata\":{\"HIVE_TYPE_STRING\":\"string\"}},{\"name\":\"year\",\"type\":\"integer\",\"nullable\":true,\"metadata\":{\"HIVE_TYPE_STRING\":\"int\"}},{\"name\":\"month\",\"type\":\"integer\",\"nullable\":true,\"metadata\":{\"HIVE_TYPE_STRING\":\"int\"}},{\"name\":\"day\",\"type\":\"integer\",\"nullable\":true,\"metadata\":{\"HIVE_TYPE_STRING\":\"int\"}}]}', 
  'spark.sql.sources.schema.partCol.0'='year', 
  'spark.sql.sources.schema.partCol.1'='month', 
  'spark.sql.sources.schema.partCol.2'='day')
