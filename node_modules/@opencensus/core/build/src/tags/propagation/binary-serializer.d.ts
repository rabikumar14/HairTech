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
/// <reference types="node" />
/**
 * This module contains the functions for serializing and deserializing
 * TagMap (TagContext) with the binary format. It allows tags to propagate
 * across requests.
 *
 * <p>OpenCensus tag context encoding:
 *
 * <ul>
 *   <li>Tags are encoded in single byte sequence. The version 0 format is:
 *   <li>{@code <version_id><encoded_tags>}
 *   <li>{@code <version_id> -> a single byte, value 0}
 *   <li>{@code <encoded_tags> -> (<tag_field_id><tag_encoding>)*}
 *     <ul>
 *       <li>{@code <tag_field_id>} -> a single byte, value 0
 *       <li>{@code <tag_encoding>}:
 *         <ul>
 *           <li>{@code <tag_key_len><tag_key><tag_val_len><tag_val>}
 *             <ul>
 *               <li>{@code <tag_key_len>} -> varint encoded integer
 *               <li>{@code <tag_key>} -> tag_key_len bytes comprising tag name
 *               <li>{@code <tag_val_len>} -> varint encoded integer
 *               <li>{@code <tag_val>} -> tag_val_len bytes comprising tag value
 *             </ul>
 *           </li>
 *         </ul>
 *       </li>
 *     </ul>
 * </ul>
 */
import { TagMap } from '../tag-map';
export declare const TAG_MAP_SERIALIZED_SIZE_LIMIT = 8192;
/**
 * Serializes a given TagMap to the on-the-wire format.
 * @param tagMap The TagMap to serialize.
 */
export declare function serializeBinary(tagMap: TagMap): Buffer;
/**
 * Deserializes input to TagMap based on the binary format standard.
 * @param buffer The TagMap to deserialize.
 */
export declare function deserializeBinary(buffer: Buffer): TagMap;
