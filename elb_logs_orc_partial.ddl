CREATE EXTERNAL TABLE `elb_logs_orc_partial`(
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
  'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
LOCATION
  's3://athena-examples/elb/orc'
TBLPROPERTIES (
  'transient_lastDdlTime'='1516479987')
