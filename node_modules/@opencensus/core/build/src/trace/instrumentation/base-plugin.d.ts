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
import { Logger } from '../../common/types';
import { Stats } from '../../stats/types';
import * as modelTypes from '../model/types';
import * as types from './types';
/**
 * Maps a name (key) representing a internal file module and its exports
 */
export interface ModuleExportsMapping {
    [key: string]: any;
}
/** This class represent the base to patch plugin. */
export declare abstract class BasePlugin implements types.Plugin {
    /** Exports from the nodejs module to be instrumented */
    protected moduleExports: any;
    /** The module name */
    protected moduleName: string;
    /** A tracer object. */
    protected tracer: modelTypes.Tracer;
    /** The module version. */
    protected version: string;
    /** a logger */
    protected logger: Logger;
    /** list of internal files that need patch and are not exported by default */
    protected readonly internalFileList: types.PluginInternalFiles;
    /**  internal files loaded */
    protected internalFilesExports: ModuleExportsMapping;
    /** module directory - used to load internal files */
    protected basedir: string;
    /** plugin options */
    protected options: types.PluginConfig;
    /** A stats object. */
    protected stats?: Stats;
    /**
     * Constructs a new BasePlugin instance.
     * @param moduleName The module name.
     */
    constructor(moduleName: string);
    /**
     * Sets modified plugin to the context.
     * @param moduleExports nodejs module exports to set as context
     * @param tracer tracer relating to context
     * @param version module version description
     * @param options plugin options
     * @param basedir module absolute path
     * @param stats a stats instance
     */
    private setPluginContext;
    /**
     * Method that enables the instrumentation patch.
     *
     * This method implements the GoF Template Method Pattern
     * 'enable' is the invariant part of the pattern and
     * 'applyPatch' the variant.
     *
     * @param moduleExports nodejs module exports from the module to patch
     * @param tracer a tracer instance
     * @param version version of the current instaled module to patch
     * @param options plugin options
     * @param basedir an optional module absolute path
     * @param stats an optional stats instance
     */
    enable<T>(moduleExports: T, tracer: modelTypes.Tracer, version: string, options: types.PluginConfig, basedir?: string, stats?: Stats): any;
    /** Method to disable the instrumentation  */
    disable(): void;
    /**
     * This method implements the GoF Template Method Pattern,
     * 'applyPatch' is the variant part, each instrumentation should
     * implement its own version, 'enable' method is the invariant.
     * It will be called when enable is called.
     *
     */
    protected abstract applyPatch(): any;
    protected abstract applyUnpatch(): void;
    /**
     * Load internal files according to version range
     */
    private loadInternalFiles;
    /**
     * Load internal files from a module and  set internalFilesExports
     */
    private loadInternalModuleFiles;
}
