/**
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * Autogenerated by Thrift Compiler (0.9.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
package org.apache.airavata.model.appcatalog.computeresource;


import java.util.Map;
import java.util.HashMap;
import org.apache.thrift.TEnum;

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
@SuppressWarnings("all") public enum JobManagerCommand implements org.apache.thrift.TEnum {
  SUBMISSION(0),
  JOB_MONITORING(1),
  DELETION(2),
  CHECK_JOB(3),
  SHOW_QUEUE(4),
  SHOW_RESERVATION(5),
  SHOW_START(6);

  private final int value;

  private JobManagerCommand(int value) {
    this.value = value;
  }

  /**
   * Get the integer value of this enum value, as defined in the Thrift IDL.
   */
  public int getValue() {
    return value;
  }

  /**
   * Find a the enum type by its integer value, as defined in the Thrift IDL.
   * @return null if the value is not found.
   */
  public static JobManagerCommand findByValue(int value) { 
    switch (value) {
      case 0:
        return SUBMISSION;
      case 1:
        return JOB_MONITORING;
      case 2:
        return DELETION;
      case 3:
        return CHECK_JOB;
      case 4:
        return SHOW_QUEUE;
      case 5:
        return SHOW_RESERVATION;
      case 6:
        return SHOW_START;
      default:
        return null;
    }
  }
}
