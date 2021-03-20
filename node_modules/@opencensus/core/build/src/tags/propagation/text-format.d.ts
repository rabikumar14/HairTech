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
/**
 * This module contains the functions for serializing and deserializing
 * TagMap (TagContext) with W3C Correlation Context as the HTTP text format.
 * It allows tags to propagate across requests.
 *
 * OpenCensus uses W3C Correlation Context as the HTTP text format.
 * https://github.com/w3c/correlation-context/blob/master/correlation_context/HTTP_HEADER_FORMAT.md
 */
import { TagMap } from '../tag-map';
export declare const MAX_NUMBER_OF_TAGS = 180;
/**
 * Serializes a given TagMap to the on-the-wire format based on the W3C HTTP
 * text format standard.
 * @param tagMap The TagMap to serialize.
 */
export declare function serializeTextFormat(tagMap: TagMap): string;
/**
 * Deserializes input to TagMap based on the W3C HTTP text format standard.
 * @param str The TagMap to deserialize.
 */
export declare function deserializeTextFormat(str: string): TagMap;
