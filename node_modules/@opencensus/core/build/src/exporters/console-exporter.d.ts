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
import * as loggerTypes from '../common/types';
import { Measurement, View } from '../stats/types';
import { TagKey, TagValue } from '../tags/types';
import * as modelTypes from '../trace/model/types';
import { Exporter, ExporterConfig, StatsEventListener } from './types';
/** Do not send span data */
export declare class NoopExporter implements Exporter {
    logger?: loggerTypes.Logger;
    onStartSpan(span: modelTypes.Span): void;
    onEndSpan(span: modelTypes.Span): void;
    publish(spans: modelTypes.Span[]): Promise<void>;
}
/** Format and sends span data to the console. */
export declare class ConsoleExporter implements Exporter {
    /** Buffer object to store the spans. */
    logger: loggerTypes.Logger;
    private buffer;
    /**
     * Constructs a new ConsoleExporter instance.
     * @param config Exporter configuration object to create a console log
     *     exporter.
     */
    constructor(config: ExporterConfig);
    onStartSpan(span: modelTypes.Span): void;
    /**
     * Event called when a span is ended.
     * @param span Ended span.
     */
    onEndSpan(span: modelTypes.Span): void;
    /**
     * Sends the spans information to the console.
     * @param spans A list of spans to publish.
     */
    publish(spans: modelTypes.Span[]): Promise<void>;
}
/** Exporter that receives stats data and shows in the log console. */
export declare class ConsoleStatsExporter implements StatsEventListener {
    /**
     * Event called when a view is registered
     * @param view registered view
     */
    onRegisterView(view: View): void;
    /**
     * Event called when a measurement is recorded
     * @param view recorded view from measurement
     * @param measurement recorded measurement
     * @param tags The tags to which the value is applied
     */
    onRecord(views: View[], measurement: Measurement, tags: Map<TagKey, TagValue>): void;
    /**
     * Starts the Console exporter that polls Metric from Metrics library and
     * shows in the log console..
     */
    start(): void;
    /** Stops the exporter. */
    stop(): void;
}
