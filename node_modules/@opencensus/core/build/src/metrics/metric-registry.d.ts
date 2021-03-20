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
import { Cumulative } from './cumulative/cumulative';
import { DerivedCumulative } from './cumulative/derived-cumulative';
import { MetricProducer } from './export/types';
import { DerivedGauge } from './gauges/derived-gauge';
import { Gauge } from './gauges/gauge';
import { MetricOptions } from './types';
/**
 * Creates and manages application's set of metrics.
 */
export declare class MetricRegistry {
    private registeredMetrics;
    private metricProducer;
    private static readonly NAME;
    private static readonly LABEL_KEY;
    private static readonly CONSTANT_LABELS;
    private static readonly DEFAULT_DESCRIPTION;
    private static readonly DEFAULT_UNIT;
    private static readonly DEFAULT_LABEL_KEYS;
    private static readonly DEFAULT_CONSTANT_LABEL;
    constructor();
    /**
     * Builds a new Int64 gauge to be added to the registry. This is more
     * convenient form when you want to manually increase and decrease values as
     * per your service requirements.
     *
     * @param name The name of the metric.
     * @param options The options for the metric.
     * @returns A Int64 Gauge metric.
     */
    addInt64Gauge(name: string, options?: MetricOptions): Gauge;
    /**
     * Builds a new double gauge to be added to the registry. This is more
     * convenient form when you want to manually increase and decrease values as
     * per your service requirements.
     *
     * @param name The name of the metric.
     * @param options The options for the metric.
     * @returns A Double Gauge metric.
     */
    addDoubleGauge(name: string, options?: MetricOptions): Gauge;
    /**
     * Builds a new derived Int64 gauge to be added to the registry. This is more
     * convenient form when you want to manually increase and decrease values as
     * per your service requirements.
     *
     * @param name The name of the metric.
     * @param options The options for the metric.
     * @returns A Int64 DerivedGauge metric.
     */
    addDerivedInt64Gauge(name: string, options?: MetricOptions): DerivedGauge;
    /**
     * Builds a new derived double gauge to be added to the registry. This is more
     * convenient form when you want to manually increase and decrease values as
     * per your service requirements.
     *
     * @param name The name of the metric.
     * @param options The options for the metric.
     * @returns A Double DerivedGauge metric.
     */
    addDerivedDoubleGauge(name: string, options?: MetricOptions): DerivedGauge;
    /**
     * Builds a new Int64 cumulative to be added to the registry. This API is
     * useful when you want to manually increase and reset values as per service
     * requirements.
     *
     * @param name The name of the metric.
     * @param options The options for the metric.
     * @returns A Int64 Cumulative metric.
     */
    addInt64Cumulative(name: string, options?: MetricOptions): Cumulative;
    /**
     * Builds a new double cumulative to be added to the registry. This API is
     * useful when you want to manually increase and reset values as per service
     * requirements.
     *
     * @param name The name of the metric.
     * @param options The options for the metric.
     * @returns A Double Cumulative metric.
     */
    addDoubleCumulative(name: string, options?: MetricOptions): Cumulative;
    /**
     * Builds a new derived Int64 Cumulative to be added to the registry.
     *
     * @param name The name of the metric.
     * @param options The options for the metric.
     * @returns A Int64 DerivedCumulative metric.
     */
    addDerivedInt64Cumulative(name: string, options?: MetricOptions): DerivedCumulative;
    /**
     * Builds a new derived Double Cumulative to be added to the registry.
     *
     * @param name The name of the metric.
     * @param options The options for the metric.
     * @returns A Double DerivedCumulative metric.
     */
    addDerivedDoubleCumulative(name: string, options?: MetricOptions): DerivedCumulative;
    /**
     * Registers metric to register.
     *
     * @param name The name of the metric.
     * @param meter The metric to register.
     */
    private registerMetric;
    /**
     * Gets a metric producer for registry.
     *
     * @returns The metric producer.
     */
    getMetricProducer(): MetricProducer;
    /** Validates labelKeys and constantLabels. */
    private validateLables;
}
