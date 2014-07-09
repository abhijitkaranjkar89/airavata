/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements. See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership. The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 *
 */

namespace java org.apache.airavata.model.appcatalog.computeresource
namespace php Airavata.Model.AppCatalog.ComputeResource
namespace cpp apache.airavata.model.appcatalog.computeresource

const string DEFAULT_ID = "DO_NOT_SET_AT_CLIENTS"

/**
 * Enumeration of local resource job manager types supported by Airavata
 *
 * FORK:
 *  Forking of commands without any job manager
 *
 * PBS:
 *  Job manager supporting the Portal Batch System (PBS) protocol. Some examples include TORQUE, PBSPro, Grid Engine.
 *
 * UGE:
 *  Univa Grid Engine, a variation of PBS implementation.
 *
 * SLURM:
 *  The Simple Linux Utility for Resource Management is a open source workload manager.
 *
*/
enum ResourceJobManagerType {
    FORK,
    PBS,
    UGE,
    SLURM
}

/**
 * Enumeration of resource job manager commands
 *
 * SUBMISSION:
 *  Ex: qsub, sbatch
 *
 * JOBMONITORING:
 *  Ex: qstat, squeue
 *
 * DELETION:
 *  Ex: qdel, scancel
 *
 * CHECK_JOB:
 *  Detailed Status about the Job. Ex: checkjob
 *
 * SHOW_QUEUE:
 *  List of Queued Job by the schedular. Ex: showq
 *
 * SHOW_RESERVATION:
 *  List all reservations. Ex:showres, show_res
 *
 * SHOW_START:
 *  Display the start time of the specified job. Ex: showstart
 *
*/
enum JobManagerCommand {
    SUBMISSION,
    JOB_MONITORING,
    DELETION,
    CHECK_JOB,
    SHOW_QUEUE,
    SHOW_RESERVATION,
    SHOW_START
}

/**
 * Resource Job Manager Information
 *
 * resourceJobManagerType:
 *  A typical HPC cluster has a single Job Manager to manage the resources.
 *
 * pushMonitoringEndpoint:
 *  If the job manager pushes out state changes to a database or bus, specify the service endpoint.
 *   Ex: Moab Web Service, Moab MongoDB URL, AMQP (GLUE2) Broker
 *
 * jobManagerBinPath:
 *  Path to the Job Manager Installation Binary directory.
 *
 * jobManagerCommands:
 *  An enumeration of commonly used manager commands.
 *
*/
struct ResourceJobManager {
    1: required string resourceJobManagerId = DEFAULT_ID,
    2: required ResourceJobManagerType resourceJobManagerType,
    3: optional string pushMonitoringEndpoint,
    4: optional string jobManagerBinPath,
    5: optional map<JobManagerCommand, string> jobManagerCommands
}

/**
 * Enumeration of File Systems on the resource
 *
 * FORK:
 *  Forking of commands without any job manager
 *
 * PBS:
 *  Job manager supporting the Portal Batch System (PBS) protocol. Some examples include TORQUE, PBSPro, Grid Engine.
 *
 * UGE:
 *  Univa Grid Engine, a variation of PBS implementation.
 *
 * SLURM:
 *  The Simple Linux Utility for Resource Management is a open source workload manager.
 *
*/
enum FileSystems {
    HOME,
    WORK,
    LOCALTMP,
    SCRATCH,
    ARCHIVE
}

/**
 * Batch Queue Information on SuperComputers
 *
 * maxRunTime:
 *  Maximum allowed run time in hours.
*/
struct BatchQueue {
    1: required string queueName,
    2: optional string queueDescription,
    3: optional i32 maxRunTime,
    4: optional i32 maxNodes,
    5: optional i32 maxProcessors,
    6: optional i32 maxJobsInQueue
}

/**
 * Enumeration of security authentication and authorization mechanisms supported by Airavata. This enumeration just
 *  describes the supported mechanism. The corresponding security credentials are registered with Airavata Credential
 *  store.
 *
 * USERNAME_PASSWORD:
 *  A User Name.
 *
 * SSH_KEYS:
 *  SSH Keys
 *
*/
enum SecurityProtocol {
    USERNAME_PASSWORD,
    SSH_KEYS,
    GSI,
    KERBEROS,
    OAUTH
}

/**
 * Enumeration of Airavata supported Job Submission Mechanisms for High Performance Computing Clusters.
 *
 * SSH:
 *  Execute remote job submission commands using via secure shell protocol.
 *
 * GRAM:
 *  Execute remote jobs via Globus GRAM service.
 *
 * UNICORE:
 *  Execute remote jobs via Unicore services
 *
*/
enum JobSubmissionProtocol {
    LOCAL,
    SSH,
    GLOBUS,
    UNICORE
}

/**
 * Enumeration of data movement supported by Airavata
 *
 * SCP:
 *  Job manager supporting the Portal Batch System (PBS) protocol. Some examples include TORQUE, PBSPro, Grid Engine.
 *
 * SFTP:
 *  The Simple Linux Utility for Resource Management is a open source workload manager.
 *
 * GridFTP:
 *  Globus File Transfer Protocol
 *
 * UNICORE_STORAGE_SERVICE:
 *  Storage Service Provided by Unicore
 *
*/
enum DataMovementProtocol {
    LOCAL,
    SCP,
    SFTP,
    GridFTP,
    UNICORE_STORAGE_SERVICE
}

/**
 * Data Movement through Secured Copy
 *
 * alternativeSCPHostName:
 *  If the login to scp is different than the hostname itself, specify it here
 *
 * sshPort:
 *  If a non-default port needs to used, specify it.
*/
struct SCPDataMovement {
    1: required string dataMovementInterfaceId = DEFAULT_ID,
    2: required SecurityProtocol securityProtocol,
    3: optional string alternativeSCPHostName,
    4: optional i32 sshPort = 22
}

/**
 * Data Movement through GridFTP
 *
 * alternativeSCPHostName:
 *  If the login to scp is different than the hostname itself, specify it here
 *
 * sshPort:
 *  If a non-default port needs to used, specify it.
*/
struct GridFTPDataMovement {
    1: required string dataMovementInterfaceId = DEFAULT_ID,
    2: required SecurityProtocol securityProtocol,
    3: required list<string>  gridFTPEndPoints
}

/**
 * Locally Fork Jobs as OS processes
 *
 * alternativeSSHHostName:
 *  If the login to ssh is different than the hostname itself, specify it here
 *
 * sshPort:
 *  If a non-default port needs to used, specify it.
*/
struct LOCALSubmission {
    1: required string jobSubmissionInterfaceId = DEFAULT_ID,
    2: required ResourceJobManager resourceJobManager
}

/**
 * LOCAL
 *
 * alternativeSCPHostName:
 *  If the login to scp is different than the hostname itself, specify it here
 *
 * sshPort:
 *  If a non-defualt port needs to used, specify it.
*/
struct LOCALDataMovement {
    1: required string dataMovementInterfaceId = DEFAULT_ID,
}

/**
 * Authenticate using Secured Shell
 *
 * alternativeSSHHostName:
 *  If the login to ssh is different than the hostname itself, specify it here
 *
 * sshPort:
 *  If a non-default port needs to used, specify it.
*/
struct SSHJobSubmission {
    1: required string jobSubmissionInterfaceId = DEFAULT_ID,
    2: required SecurityProtocol securityProtocol,
    3: required ResourceJobManager resourceJobManager,
    4: optional string alternativeSSHHostName,
    5: optional i32 sshPort = 22
}

struct GlobusJobSubmission {
    1: required string jobSubmissionInterfaceId = DEFAULT_ID,
    2: required SecurityProtocol securityProtocol,
    3: optional list<string> globusGateKeeperEndPoint
}

/**
 * Job Submission Interfaces
 *
 * jobSubmissionInterfaceId: The Job Submission Interface has to be previously registered and referenced here.
 *
 * priorityOrder:
 *  For resources with multiple interfaces, the priority order should be selected.
 *   Lower the numerical number, higher the priority
 *
*/
struct JobSubmissionInterface {
    1: required string jobSubmissionInterfaceId,
    2: required JobSubmissionProtocol jobSubmissionProtocol
    3: required i32 priorityOrder = 0,
}

/**
 * Data Movement Interfaces
 *
 * dataMovementInterfaceId: The Data Movement Interface has to be previously registered and referenced here.
 *
 * priorityOrder:
 *  For resources with multiple interfaces, the priority order should be selected.
 *   Lower the numerical number, higher the priority
 *
*/
struct DataMovementInterface {
    1: required string dataMovementInterfaceId,
    2: required DataMovementProtocol dataMovementProtocol,
    3: required i32 priorityOrder = 0,
}

/**
 * Computational Resource Description
 *
 * computeResourceId: Airavata Internal Unique Identifier to distinguish Compute Resource.
 *
 * hostName:
 *   Fully Qualified Host Name.
 *
 * hostAliases:
 *   Aliases if any.
 *
 * ipAddress:
 *   IP Addresses of the Resource.
 *
 * resourceDescription:
 *  A user friendly description of the resource.
 *
 * JobSubmissionProtocols:
 *  A computational resources may have one or more ways of submitting Jobs. This structure
 *    will hold all available mechanisms to interact with the resource.
 *  The key is the priority
 *
 * DataMovementProtocol:
 *  Option to specify a prefered data movement mechanism of the available options.
 *
 * fileSystems:
 *  Map of file systems type and the path.
 *
*/
struct ComputeResourceDescription {
//    1: required bool isEmpty = 0,
    1: required string computeResourceId = DEFAULT_ID,
    2: required string hostName,
    3: optional set<string> hostAliases,
    4: optional set<string> ipAddresses,
    5: optional string resourceDescription,
    6: optional list<BatchQueue> batchQueues,
    7: optional map<FileSystems, string> fileSystems,
    8: optional list<JobSubmissionInterface> jobSubmissionInterfaces,
    9: optional list<DataMovementInterface> dataMovementInterfaces
}
