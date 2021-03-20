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
import * as cls from '../internal/cls';
import { TagMap } from './tag-map';
export declare const EMPTY_TAG_MAP: TagMap;
/** Gets the current tag context. */
export declare function getCurrentTagContext(contextManager: cls.Namespace): TagMap;
/**
 * Sets the current tag context.
 * @param tags The TagMap.
 */
export declare function setCurrentTagContext(contextManager: cls.Namespace, tags: TagMap): void;
/**
 * Enters the scope of code where the given `TagMap` is in the current context
 * (replacing the previous `TagMap`).
 * @param tags The TagMap to be set to the current context.
 * @param fn Callback function.
 * @returns The callback return.
 */
export declare function withTagContext<T>(contextManager: cls.Namespace, tags: TagMap, fn: cls.Func<T>): T;
/** Clear the current tag context. */
export declare function clear(contextManager: cls.Namespace): void;
