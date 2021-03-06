# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module Google
  module Cloud
    module Dataproc
      ##
      # # Google Cloud Dataproc API Contents
      #
      # | Class | Description |
      # | ----- | ----------- |
      # | [JobControllerClient][] | The JobController provides methods to manage jobs. |
      # | [Data Types][] | Data types for Google::Cloud::Dataproc::V1 |
      #
      # [JobControllerClient]: https://googlecloudplatform.github.io/google-cloud-ruby/#/docs/google-cloud-dataproc/latest/google/cloud/dataproc/v1/jobcontrollerclient
      # [Data Types]: https://googlecloudplatform.github.io/google-cloud-ruby/#/docs/google-cloud-dataproc/latest/google/cloud/dataproc/v1/datatypes
      #
      module V1
        # The runtime logging config of the job.
        # @!attribute [rw] driver_log_levels
        #   @return [Hash{String => Google::Cloud::Dataproc::V1::LoggingConfig::Level}]
        #     The per-package log levels for the driver. This may include
        #     "root" package name to configure rootLogger.
        #     Examples:
        #       'com.google = FATAL', 'root = INFO', 'org.apache = DEBUG'
        class LoggingConfig
          # The Log4j level for job execution. When running an
          # [Apache Hive](http://hive.apache.org/) job, Cloud
          # Dataproc configures the Hive client to an equivalent verbosity level.
          module Level
            # Level is unspecified. Use default level for log4j.
            LEVEL_UNSPECIFIED = 0

            # Use ALL level for log4j.
            ALL = 1

            # Use TRACE level for log4j.
            TRACE = 2

            # Use DEBUG level for log4j.
            DEBUG = 3

            # Use INFO level for log4j.
            INFO = 4

            # Use WARN level for log4j.
            WARN = 5

            # Use ERROR level for log4j.
            ERROR = 6

            # Use FATAL level for log4j.
            FATAL = 7

            # Turn off log4j.
            OFF = 8
          end
        end

        # A Cloud Dataproc job for running
        # [Apache Hadoop MapReduce](https://hadoop.apache.org/docs/current/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html)
        # jobs on [Apache Hadoop YARN](https://hadoop.apache.org/docs/r2.7.1/hadoop-yarn/hadoop-yarn-site/YARN.html).
        # @!attribute [rw] main_jar_file_uri
        #   @return [String]
        #     The HCFS URI of the jar file containing the main class.
        #     Examples:
        #         'gs://foo-bucket/analytics-binaries/extract-useful-metrics-mr.jar'
        #         'hdfs:/tmp/test-samples/custom-wordcount.jar'
        #         'file:///home/usr/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar'
        # @!attribute [rw] main_class
        #   @return [String]
        #     The name of the driver's main class. The jar file containing the class
        #     must be in the default CLASSPATH or specified in +jar_file_uris+.
        # @!attribute [rw] args
        #   @return [Array<String>]
        #     Optional. The arguments to pass to the driver. Do not
        #     include arguments, such as +-libjars+ or +-Dfoo=bar+, that can be set as job
        #     properties, since a collision may occur that causes an incorrect job
        #     submission.
        # @!attribute [rw] jar_file_uris
        #   @return [Array<String>]
        #     Optional. Jar file URIs to add to the CLASSPATHs of the
        #     Hadoop driver and tasks.
        # @!attribute [rw] file_uris
        #   @return [Array<String>]
        #     Optional. HCFS (Hadoop Compatible Filesystem) URIs of files to be copied
        #     to the working directory of Hadoop drivers and distributed tasks. Useful
        #     for naively parallel tasks.
        # @!attribute [rw] archive_uris
        #   @return [Array<String>]
        #     Optional. HCFS URIs of archives to be extracted in the working directory of
        #     Hadoop drivers and tasks. Supported file types:
        #     .jar, .tar, .tar.gz, .tgz, or .zip.
        # @!attribute [rw] properties
        #   @return [Hash{String => String}]
        #     Optional. A mapping of property names to values, used to configure Hadoop.
        #     Properties that conflict with values set by the Cloud Dataproc API may be
        #     overwritten. Can include properties set in /etc/hadoop/conf/*-site and
        #     classes in user code.
        # @!attribute [rw] logging_config
        #   @return [Google::Cloud::Dataproc::V1::LoggingConfig]
        #     Optional. The runtime log config for job execution.
        class HadoopJob; end

        # A Cloud Dataproc job for running [Apache Spark](http://spark.apache.org/)
        # applications on YARN.
        # @!attribute [rw] main_jar_file_uri
        #   @return [String]
        #     The HCFS URI of the jar file that contains the main class.
        # @!attribute [rw] main_class
        #   @return [String]
        #     The name of the driver's main class. The jar file that contains the class
        #     must be in the default CLASSPATH or specified in +jar_file_uris+.
        # @!attribute [rw] args
        #   @return [Array<String>]
        #     Optional. The arguments to pass to the driver. Do not include arguments,
        #     such as +--conf+, that can be set as job properties, since a collision may
        #     occur that causes an incorrect job submission.
        # @!attribute [rw] jar_file_uris
        #   @return [Array<String>]
        #     Optional. HCFS URIs of jar files to add to the CLASSPATHs of the
        #     Spark driver and tasks.
        # @!attribute [rw] file_uris
        #   @return [Array<String>]
        #     Optional. HCFS URIs of files to be copied to the working directory of
        #     Spark drivers and distributed tasks. Useful for naively parallel tasks.
        # @!attribute [rw] archive_uris
        #   @return [Array<String>]
        #     Optional. HCFS URIs of archives to be extracted in the working directory
        #     of Spark drivers and tasks. Supported file types:
        #     .jar, .tar, .tar.gz, .tgz, and .zip.
        # @!attribute [rw] properties
        #   @return [Hash{String => String}]
        #     Optional. A mapping of property names to values, used to configure Spark.
        #     Properties that conflict with values set by the Cloud Dataproc API may be
        #     overwritten. Can include properties set in
        #     /etc/spark/conf/spark-defaults.conf and classes in user code.
        # @!attribute [rw] logging_config
        #   @return [Google::Cloud::Dataproc::V1::LoggingConfig]
        #     Optional. The runtime log config for job execution.
        class SparkJob; end

        # A Cloud Dataproc job for running
        # [Apache PySpark](https://spark.apache.org/docs/0.9.0/python-programming-guide.html)
        # applications on YARN.
        # @!attribute [rw] main_python_file_uri
        #   @return [String]
        #     Required. The HCFS URI of the main Python file to use as the driver. Must
        #     be a .py file.
        # @!attribute [rw] args
        #   @return [Array<String>]
        #     Optional. The arguments to pass to the driver.  Do not include arguments,
        #     such as +--conf+, that can be set as job properties, since a collision may
        #     occur that causes an incorrect job submission.
        # @!attribute [rw] python_file_uris
        #   @return [Array<String>]
        #     Optional. HCFS file URIs of Python files to pass to the PySpark
        #     framework. Supported file types: .py, .egg, and .zip.
        # @!attribute [rw] jar_file_uris
        #   @return [Array<String>]
        #     Optional. HCFS URIs of jar files to add to the CLASSPATHs of the
        #     Python driver and tasks.
        # @!attribute [rw] file_uris
        #   @return [Array<String>]
        #     Optional. HCFS URIs of files to be copied to the working directory of
        #     Python drivers and distributed tasks. Useful for naively parallel tasks.
        # @!attribute [rw] archive_uris
        #   @return [Array<String>]
        #     Optional. HCFS URIs of archives to be extracted in the working directory of
        #     .jar, .tar, .tar.gz, .tgz, and .zip.
        # @!attribute [rw] properties
        #   @return [Hash{String => String}]
        #     Optional. A mapping of property names to values, used to configure PySpark.
        #     Properties that conflict with values set by the Cloud Dataproc API may be
        #     overwritten. Can include properties set in
        #     /etc/spark/conf/spark-defaults.conf and classes in user code.
        # @!attribute [rw] logging_config
        #   @return [Google::Cloud::Dataproc::V1::LoggingConfig]
        #     Optional. The runtime log config for job execution.
        class PySparkJob; end

        # A list of queries to run on a cluster.
        # @!attribute [rw] queries
        #   @return [Array<String>]
        #     Required. The queries to execute. You do not need to terminate a query
        #     with a semicolon. Multiple queries can be specified in one string
        #     by separating each with a semicolon. Here is an example of an Cloud
        #     Dataproc API snippet that uses a QueryList to specify a HiveJob:
        #
        #         "hiveJob": {
        #           "queryList": {
        #             "queries": [
        #               "query1",
        #               "query2",
        #               "query3;query4",
        #             ]
        #           }
        #         }
        class QueryList; end

        # A Cloud Dataproc job for running [Apache Hive](https://hive.apache.org/)
        # queries on YARN.
        # @!attribute [rw] query_file_uri
        #   @return [String]
        #     The HCFS URI of the script that contains Hive queries.
        # @!attribute [rw] query_list
        #   @return [Google::Cloud::Dataproc::V1::QueryList]
        #     A list of queries.
        # @!attribute [rw] continue_on_failure
        #   @return [true, false]
        #     Optional. Whether to continue executing queries if a query fails.
        #     The default value is +false+. Setting to +true+ can be useful when executing
        #     independent parallel queries.
        # @!attribute [rw] script_variables
        #   @return [Hash{String => String}]
        #     Optional. Mapping of query variable names to values (equivalent to the
        #     Hive command: +SET name="value";+).
        # @!attribute [rw] properties
        #   @return [Hash{String => String}]
        #     Optional. A mapping of property names and values, used to configure Hive.
        #     Properties that conflict with values set by the Cloud Dataproc API may be
        #     overwritten. Can include properties set in /etc/hadoop/conf/*-site.xml,
        #     /etc/hive/conf/hive-site.xml, and classes in user code.
        # @!attribute [rw] jar_file_uris
        #   @return [Array<String>]
        #     Optional. HCFS URIs of jar files to add to the CLASSPATH of the
        #     Hive server and Hadoop MapReduce (MR) tasks. Can contain Hive SerDes
        #     and UDFs.
        class HiveJob; end

        # A Cloud Dataproc job for running [Apache Spark SQL](http://spark.apache.org/sql/)
        # queries.
        # @!attribute [rw] query_file_uri
        #   @return [String]
        #     The HCFS URI of the script that contains SQL queries.
        # @!attribute [rw] query_list
        #   @return [Google::Cloud::Dataproc::V1::QueryList]
        #     A list of queries.
        # @!attribute [rw] script_variables
        #   @return [Hash{String => String}]
        #     Optional. Mapping of query variable names to values (equivalent to the
        #     Spark SQL command: SET +name="value";+).
        # @!attribute [rw] properties
        #   @return [Hash{String => String}]
        #     Optional. A mapping of property names to values, used to configure
        #     Spark SQL's SparkConf. Properties that conflict with values set by the
        #     Cloud Dataproc API may be overwritten.
        # @!attribute [rw] jar_file_uris
        #   @return [Array<String>]
        #     Optional. HCFS URIs of jar files to be added to the Spark CLASSPATH.
        # @!attribute [rw] logging_config
        #   @return [Google::Cloud::Dataproc::V1::LoggingConfig]
        #     Optional. The runtime log config for job execution.
        class SparkSqlJob; end

        # A Cloud Dataproc job for running [Apache Pig](https://pig.apache.org/)
        # queries on YARN.
        # @!attribute [rw] query_file_uri
        #   @return [String]
        #     The HCFS URI of the script that contains the Pig queries.
        # @!attribute [rw] query_list
        #   @return [Google::Cloud::Dataproc::V1::QueryList]
        #     A list of queries.
        # @!attribute [rw] continue_on_failure
        #   @return [true, false]
        #     Optional. Whether to continue executing queries if a query fails.
        #     The default value is +false+. Setting to +true+ can be useful when executing
        #     independent parallel queries.
        # @!attribute [rw] script_variables
        #   @return [Hash{String => String}]
        #     Optional. Mapping of query variable names to values (equivalent to the Pig
        #     command: +name=[value]+).
        # @!attribute [rw] properties
        #   @return [Hash{String => String}]
        #     Optional. A mapping of property names to values, used to configure Pig.
        #     Properties that conflict with values set by the Cloud Dataproc API may be
        #     overwritten. Can include properties set in /etc/hadoop/conf/*-site.xml,
        #     /etc/pig/conf/pig.properties, and classes in user code.
        # @!attribute [rw] jar_file_uris
        #   @return [Array<String>]
        #     Optional. HCFS URIs of jar files to add to the CLASSPATH of
        #     the Pig Client and Hadoop MapReduce (MR) tasks. Can contain Pig UDFs.
        # @!attribute [rw] logging_config
        #   @return [Google::Cloud::Dataproc::V1::LoggingConfig]
        #     Optional. The runtime log config for job execution.
        class PigJob; end

        # Cloud Dataproc job config.
        # @!attribute [rw] cluster_name
        #   @return [String]
        #     Required. The name of the cluster where the job will be submitted.
        # @!attribute [rw] cluster_uuid
        #   @return [String]
        #     Output-only. A cluster UUID generated by the Cloud Dataproc service when
        #     the job is submitted.
        class JobPlacement; end

        # Cloud Dataproc job status.
        # @!attribute [rw] state
        #   @return [Google::Cloud::Dataproc::V1::JobStatus::State]
        #     Output-only. A state message specifying the overall job state.
        # @!attribute [rw] details
        #   @return [String]
        #     Output-only. Optional job state details, such as an error
        #     description if the state is <code>ERROR</code>.
        # @!attribute [rw] state_start_time
        #   @return [Google::Protobuf::Timestamp]
        #     Output-only. The time when this state was entered.
        # @!attribute [rw] substate
        #   @return [Google::Cloud::Dataproc::V1::JobStatus::Substate]
        #     Output-only. Additional state information, which includes
        #     status reported by the agent.
        class JobStatus
          # The job state.
          module State
            # The job state is unknown.
            STATE_UNSPECIFIED = 0

            # The job is pending; it has been submitted, but is not yet running.
            PENDING = 1

            # Job has been received by the service and completed initial setup;
            # it will soon be submitted to the cluster.
            SETUP_DONE = 8

            # The job is running on the cluster.
            RUNNING = 2

            # A CancelJob request has been received, but is pending.
            CANCEL_PENDING = 3

            # Transient in-flight resources have been canceled, and the request to
            # cancel the running job has been issued to the cluster.
            CANCEL_STARTED = 7

            # The job cancellation was successful.
            CANCELLED = 4

            # The job has completed successfully.
            DONE = 5

            # The job has completed, but encountered an error.
            ERROR = 6

            # Job attempt has failed. The detail field contains failure details for
            # this attempt.
            #
            # Applies to restartable jobs only.
            ATTEMPT_FAILURE = 9
          end

          module Substate
            UNSPECIFIED = 0

            # The Job is submitted to the agent.
            #
            # Applies to RUNNING state.
            SUBMITTED = 1

            # The Job has been received and is awaiting execution (it may be waiting
            # for a condition to be met). See the "details" field for the reason for
            # the delay.
            #
            # Applies to RUNNING state.
            QUEUED = 2

            # The agent-reported status is out of date, which may be caused by a
            # loss of communication between the agent and Cloud Dataproc. If the
            # agent does not send a timely update, the job will fail.
            #
            # Applies to RUNNING state.
            STALE_STATUS = 3
          end
        end

        # Encapsulates the full scoping used to reference a job.
        # @!attribute [rw] project_id
        #   @return [String]
        #     Required. The ID of the Google Cloud Platform project that the job
        #     belongs to.
        # @!attribute [rw] job_id
        #   @return [String]
        #     Optional. The job ID, which must be unique within the project. The job ID
        #     is generated by the server upon job submission or provided by the user as a
        #     means to perform retries without creating duplicate jobs. The ID must
        #     contain only letters (a-z, A-Z), numbers (0-9), underscores (_), or
        #     hyphens (-). The maximum length is 100 characters.
        class JobReference; end

        # A YARN application created by a job. Application information is a subset of
        # <code>org.apache.hadoop.yarn.proto.YarnProtos.ApplicationReportProto</code>.
        #
        # **Beta Feature**: This report is available for testing purposes only. It may
        # be changed before final release.
        # @!attribute [rw] name
        #   @return [String]
        #     Required. The application name.
        # @!attribute [rw] state
        #   @return [Google::Cloud::Dataproc::V1::YarnApplication::State]
        #     Required. The application state.
        # @!attribute [rw] progress
        #   @return [Float]
        #     Required. The numerical progress of the application, from 1 to 100.
        # @!attribute [rw] tracking_url
        #   @return [String]
        #     Optional. The HTTP URL of the ApplicationMaster, HistoryServer, or
        #     TimelineServer that provides application-specific information. The URL uses
        #     the internal hostname, and requires a proxy server for resolution and,
        #     possibly, access.
        class YarnApplication
          # The application state, corresponding to
          # <code>YarnProtos.YarnApplicationStateProto</code>.
          module State
            # Status is unspecified.
            STATE_UNSPECIFIED = 0

            # Status is NEW.
            NEW = 1

            # Status is NEW_SAVING.
            NEW_SAVING = 2

            # Status is SUBMITTED.
            SUBMITTED = 3

            # Status is ACCEPTED.
            ACCEPTED = 4

            # Status is RUNNING.
            RUNNING = 5

            # Status is FINISHED.
            FINISHED = 6

            # Status is FAILED.
            FAILED = 7

            # Status is KILLED.
            KILLED = 8
          end
        end

        # A Cloud Dataproc job resource.
        # @!attribute [rw] reference
        #   @return [Google::Cloud::Dataproc::V1::JobReference]
        #     Optional. The fully qualified reference to the job, which can be used to
        #     obtain the equivalent REST path of the job resource. If this property
        #     is not specified when a job is created, the server generates a
        #     <code>job_id</code>.
        # @!attribute [rw] placement
        #   @return [Google::Cloud::Dataproc::V1::JobPlacement]
        #     Required. Job information, including how, when, and where to
        #     run the job.
        # @!attribute [rw] hadoop_job
        #   @return [Google::Cloud::Dataproc::V1::HadoopJob]
        #     Job is a Hadoop job.
        # @!attribute [rw] spark_job
        #   @return [Google::Cloud::Dataproc::V1::SparkJob]
        #     Job is a Spark job.
        # @!attribute [rw] pyspark_job
        #   @return [Google::Cloud::Dataproc::V1::PySparkJob]
        #     Job is a Pyspark job.
        # @!attribute [rw] hive_job
        #   @return [Google::Cloud::Dataproc::V1::HiveJob]
        #     Job is a Hive job.
        # @!attribute [rw] pig_job
        #   @return [Google::Cloud::Dataproc::V1::PigJob]
        #     Job is a Pig job.
        # @!attribute [rw] spark_sql_job
        #   @return [Google::Cloud::Dataproc::V1::SparkSqlJob]
        #     Job is a SparkSql job.
        # @!attribute [rw] status
        #   @return [Google::Cloud::Dataproc::V1::JobStatus]
        #     Output-only. The job status. Additional application-specific
        #     status information may be contained in the <code>type_job</code>
        #     and <code>yarn_applications</code> fields.
        # @!attribute [rw] status_history
        #   @return [Array<Google::Cloud::Dataproc::V1::JobStatus>]
        #     Output-only. The previous job status.
        # @!attribute [rw] yarn_applications
        #   @return [Array<Google::Cloud::Dataproc::V1::YarnApplication>]
        #     Output-only. The collection of YARN applications spun up by this job.
        #
        #     **Beta** Feature: This report is available for testing purposes only. It may
        #     be changed before final release.
        # @!attribute [rw] driver_output_resource_uri
        #   @return [String]
        #     Output-only. A URI pointing to the location of the stdout of the job's
        #     driver program.
        # @!attribute [rw] driver_control_files_uri
        #   @return [String]
        #     Output-only. If present, the location of miscellaneous control files
        #     which may be used as part of job setup and handling. If not present,
        #     control files may be placed in the same location as +driver_output_uri+.
        # @!attribute [rw] labels
        #   @return [Hash{String => String}]
        #     Optional. The labels to associate with this job.
        #     Label **keys** must contain 1 to 63 characters, and must conform to
        #     [RFC 1035](https://www.ietf.org/rfc/rfc1035.txt).
        #     Label **values** may be empty, but, if present, must contain 1 to 63
        #     characters, and must conform to [RFC 1035](https://www.ietf.org/rfc/rfc1035.txt).
        #     No more than 32 labels can be associated with a job.
        # @!attribute [rw] scheduling
        #   @return [Google::Cloud::Dataproc::V1::JobScheduling]
        #     Optional. Job scheduling configuration.
        class Job; end

        # Job scheduling options.
        #
        # **Beta Feature**: These options are available for testing purposes only.
        # They may be changed before final release.
        # @!attribute [rw] max_failures_per_hour
        #   @return [Integer]
        #     Optional. Maximum number of times per hour a driver may be restarted as
        #     a result of driver terminating with non-zero code before job is
        #     reported failed.
        #
        #     A job may be reported as thrashing if driver exits with non-zero code
        #     4 times within 10 minute window.
        #
        #     Maximum value is 10.
        class JobScheduling; end

        # A request to submit a job.
        # @!attribute [rw] project_id
        #   @return [String]
        #     Required. The ID of the Google Cloud Platform project that the job
        #     belongs to.
        # @!attribute [rw] region
        #   @return [String]
        #     Required. The Cloud Dataproc region in which to handle the request.
        # @!attribute [rw] job
        #   @return [Google::Cloud::Dataproc::V1::Job]
        #     Required. The job resource.
        class SubmitJobRequest; end

        # A request to get the resource representation for a job in a project.
        # @!attribute [rw] project_id
        #   @return [String]
        #     Required. The ID of the Google Cloud Platform project that the job
        #     belongs to.
        # @!attribute [rw] region
        #   @return [String]
        #     Required. The Cloud Dataproc region in which to handle the request.
        # @!attribute [rw] job_id
        #   @return [String]
        #     Required. The job ID.
        class GetJobRequest; end

        # A request to list jobs in a project.
        # @!attribute [rw] project_id
        #   @return [String]
        #     Required. The ID of the Google Cloud Platform project that the job
        #     belongs to.
        # @!attribute [rw] region
        #   @return [String]
        #     Required. The Cloud Dataproc region in which to handle the request.
        # @!attribute [rw] page_size
        #   @return [Integer]
        #     Optional. The number of results to return in each response.
        # @!attribute [rw] page_token
        #   @return [String]
        #     Optional. The page token, returned by a previous call, to request the
        #     next page of results.
        # @!attribute [rw] cluster_name
        #   @return [String]
        #     Optional. If set, the returned jobs list includes only jobs that were
        #     submitted to the named cluster.
        # @!attribute [rw] job_state_matcher
        #   @return [Google::Cloud::Dataproc::V1::ListJobsRequest::JobStateMatcher]
        #     Optional. Specifies enumerated categories of jobs to list.
        #     (default = match ALL jobs).
        #
        #     If +filter+ is provided, +jobStateMatcher+ will be ignored.
        # @!attribute [rw] filter
        #   @return [String]
        #     Optional. A filter constraining the jobs to list. Filters are
        #     case-sensitive and have the following syntax:
        #
        #     [field = value] AND [field [= value]] ...
        #
        #     where **field** is +status.state+ or +labels.[KEY]+, and +[KEY]+ is a label
        #     key. **value** can be +*+ to match all values.
        #     +status.state+ can be either +ACTIVE+ or +NON_ACTIVE+.
        #     Only the logical +AND+ operator is supported; space-separated items are
        #     treated as having an implicit +AND+ operator.
        #
        #     Example filter:
        #
        #     status.state = ACTIVE AND labels.env = staging AND labels.starred = *
        class ListJobsRequest
          # A matcher that specifies categories of job states.
          module JobStateMatcher
            # Match all jobs, regardless of state.
            ALL = 0

            # Only match jobs in non-terminal states: PENDING, RUNNING, or
            # CANCEL_PENDING.
            ACTIVE = 1

            # Only match jobs in terminal states: CANCELLED, DONE, or ERROR.
            NON_ACTIVE = 2
          end
        end

        # A request to update a job.
        # @!attribute [rw] project_id
        #   @return [String]
        #     Required. The ID of the Google Cloud Platform project that the job
        #     belongs to.
        # @!attribute [rw] region
        #   @return [String]
        #     Required. The Cloud Dataproc region in which to handle the request.
        # @!attribute [rw] job_id
        #   @return [String]
        #     Required. The job ID.
        # @!attribute [rw] job
        #   @return [Google::Cloud::Dataproc::V1::Job]
        #     Required. The changes to the job.
        # @!attribute [rw] update_mask
        #   @return [Google::Protobuf::FieldMask]
        #     Required. Specifies the path, relative to <code>Job</code>, of
        #     the field to update. For example, to update the labels of a Job the
        #     <code>update_mask</code> parameter would be specified as
        #     <code>labels</code>, and the +PATCH+ request body would specify the new
        #     value. <strong>Note:</strong> Currently, <code>labels</code> is the only
        #     field that can be updated.
        class UpdateJobRequest; end

        # A list of jobs in a project.
        # @!attribute [rw] jobs
        #   @return [Array<Google::Cloud::Dataproc::V1::Job>]
        #     Output-only. Jobs list.
        # @!attribute [rw] next_page_token
        #   @return [String]
        #     Optional. This token is included in the response if there are more results
        #     to fetch. To fetch additional results, provide this value as the
        #     +page_token+ in a subsequent <code>ListJobsRequest</code>.
        class ListJobsResponse; end

        # A request to cancel a job.
        # @!attribute [rw] project_id
        #   @return [String]
        #     Required. The ID of the Google Cloud Platform project that the job
        #     belongs to.
        # @!attribute [rw] region
        #   @return [String]
        #     Required. The Cloud Dataproc region in which to handle the request.
        # @!attribute [rw] job_id
        #   @return [String]
        #     Required. The job ID.
        class CancelJobRequest; end

        # A request to delete a job.
        # @!attribute [rw] project_id
        #   @return [String]
        #     Required. The ID of the Google Cloud Platform project that the job
        #     belongs to.
        # @!attribute [rw] region
        #   @return [String]
        #     Required. The Cloud Dataproc region in which to handle the request.
        # @!attribute [rw] job_id
        #   @return [String]
        #     Required. The job ID.
        class DeleteJobRequest; end
      end
    end
  end
end