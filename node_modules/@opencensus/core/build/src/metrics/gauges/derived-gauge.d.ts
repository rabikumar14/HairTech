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
import { LabelKey, LabelValue, Metric, MetricDescriptorType } from '../export/types';
import * as types from '../types';
import { AccessorInterface } from '../types';
/**
 * DerivedGauge metric
 */
export declare class DerivedGauge implements types.Meter {
    readonly constantLabels: Map<LabelKey, LabelValue>;
    private metricDescriptor;
    private labelKeysLength;
    private registeredPoints;
    private extractor?;
    private readonly constantLabelValues;
    private static readonly LABEL_VALUE;
    private static readonly LABEL_VALUES;
    private static readonly OBJECT;
    private static readonly ERROR_MESSAGE_INVALID_SIZE;
    private static readonly ERROR_MESSAGE_DUPLICATE_TIME_SERIES;
    private static readonly ERROR_MESSAGE_UNKNOWN_INTERFACE;
    /**
     * Constructs a new DerivedGauge instance.
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
     * Creates a TimeSeries. The value of a single point in the TimeSeries is
     * observed from a obj or a function. The ValueExtractor is invoked whenever
     * metrics are collected, meaning the reported value is up-to-date.
     *
     * @param labelValues The list of the label values.
     * @param objOrFn obj The obj to get the size or length or value from. If
     *     multiple options are available, the value (ToValueInterface) takes
     *     precedence first, followed by length and size. e.g value -> length ->
     *     size.
     *     fn is the function that will be called to get the current value
     *     of the gauge.
     */
    createTimeSeries(labelValues: LabelValue[], objOrFn: AccessorInterface): void;
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
     * Provides a Metric with one or more TimeSeries.
     *
     * @returns The Metric, or null if TimeSeries is not present in Metric.
     */
    getMetric(): Metric | null;
}
