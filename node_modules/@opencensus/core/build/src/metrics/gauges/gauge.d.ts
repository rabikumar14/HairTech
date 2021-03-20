/**
 * Copyright 2018, OpenCensus Authors
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
import * as types from './types';
/**
 * Gauge metric
 */
export declare class Gauge implements Meter {
    readonly labelKeys: LabelKey[];
    readonly constantLabels: Map<LabelKey, LabelValue>;
    private readonly metricDescriptor;
    private labelKeysLength;
    private defaultLabelValues;
    private registeredPoints;
    private readonly constantLabelValues;
    private static readonly LABEL_VALUE;
    private static readonly LABEL_VALUES;
    private static readonly ERROR_MESSAGE_INVALID_SIZE;
    /**
     * Constructs a new Gauge instance.
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
     * labelValues is not already associated with this gauge, else returns an
     * existing Point.
     *
     * It is recommended to keep a reference to the Point instead of always
     * calling this method for manual operations.
     *
     * @param labelValues The list of the label values.
     * @returns The value of single gauge.
     */
    getOrCreateTimeSeries(labelValues: LabelValue[]): types.Point;
    /**
     * Returns a Point for a gauge with all labels not set, or default
     * labels.
     *
     * @returns The value of single gauge.
     */
    getDefaultTimeSeries(): types.Point;
    /**
     * Removes the TimeSeries from the gauge metric, if it is present. i.e.
     * references to previous Point objects are invalid (not part of the
     * metric).
     *
     * @param labelValues The list of label values.
     */
    removeTimeSeries(labelValues: LabelValue[]): void;
    /**
     * Removes all TimeSeries from the gauge metric. i.e. references to all
     * previous Point objects are invalid (not part of the metric).
     */
    clear(): void;
    /**
     * Registers a TimeSeries and returns a Point if the specified
     * labelValues is not already associated with this gauge, else returns an
     * existing Point.
     *
     * @param labelValues The list of the label values.
     * @returns The value of single gauge.
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
 * The value of a single point in the Gauge.TimeSeries.
 */
export declare class PointEntry implements types.Point {
    private readonly labelValues;
    private value;
    constructor(labelValues: LabelValue[]);
    /**
     * Adds the given value to the current value. The values can be negative.
     *
     * @param amt The value to add.
     */
    add(amt: number): void;
    /**
     * Sets the given value.
     *
     * @param val The new value.
     */
    set(val: number): void;
    /**
     * Returns the TimeSeries with one or more Point.
     *
     * @param timestamp The time at which the gauge is recorded.
     * @returns The TimeSeries.
     */
    getTimeSeries(timestamp: Timestamp): TimeSeries;
}
