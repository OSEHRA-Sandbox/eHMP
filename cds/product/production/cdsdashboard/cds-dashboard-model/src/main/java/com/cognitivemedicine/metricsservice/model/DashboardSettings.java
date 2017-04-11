/*
 * COPYRIGHT STATUS: © 2015.  This work, authored by Cognitive Medical Systems
 * employees, was funded in whole or in part by The Department of Veterans
 * Affairs under U.S. Government contract VA118-11-D-1011 / VA118-1011-0013.
 * The copyright holder agrees to post or allow the Government to post all or
 * part of this work in open-source repositories subject to the Apache License,
 * Version 2.0, dated January 2004. All other rights are reserved by the
 * copyright owner.
 *
 * For use outside the Government, the following notice applies:
 *
 *     Copyright 2015 © Cognitive Medical Systems
 *
 *     Licensed under the Apache License, Version 2.0 (the "License"); you may
 *     not use this file except in compliance with the License. You may obtain
 *     a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
 *
 *     Unless required by applicable law or agreed to in writing, software
 *     distributed under the License is distributed on an "AS IS" BASIS,
 *     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *     See the License for the specific language governing permissions and
 *     limitations under the License.
 *
 */
package com.cognitivemedicine.metricsservice.model;

import java.io.Serializable;
import java.util.Date;

/**
 * Dashboard level settings that supercede chart level settings for all charts
 * in a dashboard
 * 
 * @author sschechter
 * 
 */
public class DashboardSettings implements Serializable {

    private long startPeriod;
    private long endPeriod;

    // These 3 fields also act as a boolean flag. If they are
    // set to null, they can't override individual chart settings
    private boolean periodSelected;
    private boolean granularitySelected;

    private Period period;
    private Granularity granularity;

    private Date endDate;
    private String hours;
    private String minutes;
    private String amPm;

    public long getStartPeriod() {
        return startPeriod;
    }

    public void setStartPeriod(long startPeriod) {
        this.startPeriod = startPeriod;
    }

    public long getEndPeriod() {
        return endPeriod;
    }

    public void setEndPeriod(long endPeriod) {
        this.endPeriod = endPeriod;
    }

    public Granularity getGranularity() {
        return granularity;
    }

    public void setGranularity(Granularity granularity) {
        this.granularity = granularity;
    }

    public Period getPeriod() {
        return period;
    }

    public void setPeriod(Period period) {
        this.period = period;
    }

    public boolean isPeriodSelected() {
        return periodSelected;
    }

    public void setPeriodSelected(boolean periodSelected) {
        this.periodSelected = periodSelected;
    }

    public boolean isGranularitySelected() {
        return granularitySelected;
    }

    public void setGranularitySelected(boolean granularitySelected) {
        this.granularitySelected = granularitySelected;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getHours() {
        return hours;
    }

    public void setHours(String hours) {
        this.hours = hours;
    }

    public String getMinutes() {
        return minutes;
    }

    public void setMinutes(String minutes) {
        this.minutes = minutes;
    }

    public String getAmPm() {
        return amPm;
    }

    public void setAmPm(String amPm) {
        this.amPm = amPm;
    }
}
