/**
 * Copyright 2019, OpenCensus Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { LabelKey, LabelValue, Metric, MetricDescriptorType, TimeSeries, Timestamp } from '../export/types';
import { Meter } from '../types';
import { CumulativePoint } from './types';
/**
 * Cumulative metric is used to record aggregated metrics that represents a
 * single numerical value accumulated over a time interval. The value can only
 * increase or be reset to zero on restart or reset the event.
 */
export declare class Cumulative implements Meter {
    readonly labelKeys: LabelKey[];
    readonly constantLabels: Map<LabelKey, LabelValue>;
    private readonly metricDescriptor;
    private labelKeysLength;
    private defaultLabelValues;
    private registeredPoints;
    private readonly constantLabelValues;
    /**
     * Constructs a new Cumulative instance.
     *
     * @param name The name of the metric.
     * @param description The description of the metric.
     * @param unit The unit of the metric.
     * @param type The type of metric.
     * @param labelKeys The list of the label keys.
     * @param constantLabels The map of constant labels for the Metric.
     */
    constructor(name: string, description: string, unit: string, type: MetricDescriptorType, labelKeys: LabelKey[], constantLabels: Map<LabelKey, LabelValue>);
    /**
     * Creates a TimeSeries and returns a Point if the specified
     * labelValues is not already associated with this cumulative, else returns an
     * existing Point.
     *
     * It is recommended to keep a reference to the Point instead of always
     * calling this method for manual operations.
     *
     * @param labelValues The list of the label values.
     * @returns The value of single cumulative.
     */
    getOrCreateTimeSeries(labelValues: LabelValue[]): CumulativePoint;
    /**
     * Returns a Point for a cumulative with all labels not set, or default
     * labels.
     *
     * @returns The value of single cumulative.
     */
    getDefaultTimeSeries(): CumulativePoint;
    /**
     * Removes the TimeSeries from the cumulative metric, if it is present. i.e.
     * references to previous Point objects are invalid (not part of the
     * metric).
     *
     * @param labelValues The list of label values.
     */
    removeTimeSeries(labelValues: LabelValue[]): void;
    /**
     * Removes all TimeSeries from the cumulative metric. i.e. references to all
     * previous Point objects are invalid (not part of the metric).
     */
    clear(): void;
    /**
     * Registers a TimeSeries and returns a Point if the specified
     * labelValues is not already associated with this cumulative, else returns an
     * existing Point.
     *
     * @param labelValues The list of the label values.
     * @returns The value of single cumulative.
     */
    private registerTimeSeries;
    /**
     * Provides a Metric with one or more TimeSeries.
     *
     * @returns The Metric, or null if TimeSeries is not present in Metric.
     */
    getMetric(): Metric | null;
}
/**
 * The value of a single point in the Cumulative.TimeSeries.
 */
export declare class CumulativePointEntry implements CumulativePoint {
    private readonly labelValues;
    private startTimestamp;
    private value;
    constructor(labelValues: LabelValue[]);
    /** Reset cumulative metric. */
    reset(): void;
    /**
     * Increment the cumulative metric.
     * @param val The new value.
     */
    inc(val?: number): void;
    /**
     * Returns the TimeSeries with one or more Point.
     *
     * @param now The time at which the cumulative is recorded.
     * @returns The TimeSeries.
     */
    getTimeSeries(now: Timestamp): TimeSeries;
}
