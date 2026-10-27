{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 6,
			"revision" : 3,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 34.0, 77.0, 1475.0, 921.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"basictuning" : 440,
					"data" : 					{
						"clips" : [ 							{
								"absolutepath" : "jongly.aif",
								"filename" : "jongly.aif",
								"filekind" : "audiofile",
								"id" : "u408000776",
								"selection" : [ 0.0, 1.0 ],
								"loop" : 1,
								"content_state" : 								{
									"loop" : 1,
									"speed" : 0.39
								}

							}
 ]
					}
,
					"followglobaltempo" : 0,
					"formantcorrection" : 0,
					"id" : "obj-40",
					"maxclass" : "playlist~",
					"mode" : "basic",
					"numinlets" : 1,
					"numoutlets" : 5,
					"originallength" : [ 0.0, "ticks" ],
					"originaltempo" : 120.0,
					"outlettype" : [ "signal", "signal", "signal", "", "dictionary" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 663.0, 349.0, 150.0, 30.0 ],
					"pitchcorrection" : 0,
					"quality" : "basic",
					"timestretch" : [ 0 ]
				}

			}
, 			{
				"box" : 				{
					"autosave" : 1,
					"id" : "obj-1",
					"inletInfo" : 					{
						"IOInfo" : [ 							{
								"type" : "signal",
								"index" : 1,
								"tag" : "in1",
								"comment" : ""
							}
, 							{
								"type" : "signal",
								"index" : 2,
								"tag" : "in2",
								"comment" : ""
							}
 ]
					}
,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outletInfo" : 					{
						"IOInfo" : [ 							{
								"type" : "signal",
								"index" : 1,
								"tag" : "out1",
								"comment" : ""
							}
, 							{
								"type" : "signal",
								"index" : 2,
								"tag" : "out2",
								"comment" : ""
							}
 ]
					}
,
					"outlettype" : [ "signal", "signal", "list" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 6,
							"revision" : 3,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "rnbo",
						"rect" : [ 348.0, 258.0, 1738.0, 969.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Lato",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"assistshowspatchername" : 0,
						"title" : "untitled",
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-21",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 727.0, 366.0, 67.0, 23.0 ],
									"rnbo_classname" : "r~",
									"rnbo_serial" : 1,
									"rnbo_uniqueid" : "r~_obj-21",
									"text" : "r~ dry_gain"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 699.0, 409.0, 47.0, 23.0 ],
									"rnbo_classname" : "*~",
									"rnbo_serial" : 1,
									"rnbo_uniqueid" : "*~_obj-19",
									"text" : "*~"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-20",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 634.0, 409.0, 47.0, 23.0 ],
									"rnbo_classname" : "*~",
									"rnbo_serial" : 2,
									"rnbo_uniqueid" : "*~_obj-20",
									"text" : "*~"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-18",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 527.0, 366.0, 69.0, 23.0 ],
									"rnbo_classname" : "r~",
									"rnbo_serial" : 2,
									"rnbo_uniqueid" : "r~_obj-18",
									"text" : "r~ wet_gain"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-17",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 499.0, 409.0, 47.0, 23.0 ],
									"rnbo_classname" : "*~",
									"rnbo_serial" : 3,
									"rnbo_uniqueid" : "*~_obj-17",
									"text" : "*~"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 117.0, 436.0, 29.5, 23.0 ],
									"rnbo_classname" : "+",
									"rnbo_extra_attributes" : 									{
										"hot" : 0
									}
,
									"rnbo_serial" : 1,
									"rnbo_uniqueid" : "+_obj-16",
									"text" : "+ 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 117.0, 404.0, 29.5, 23.0 ],
									"rnbo_classname" : "*",
									"rnbo_extra_attributes" : 									{
										"hot" : 0
									}
,
									"rnbo_serial" : 1,
									"rnbo_uniqueid" : "*_obj-15",
									"text" : "* -1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "signal", "" ],
									"patching_rect" : [ 117.0, 465.0, 134.0, 23.0 ],
									"rnbo_classname" : "line~",
									"rnbo_serial" : 1,
									"rnbo_uniqueid" : "line~_obj-14",
									"rnboinfo" : 									{
										"needsInstanceInfo" : 1,
										"argnames" : 										{
											"segments" : 											{
												"attrOrProp" : 1,
												"digest" : "Target value or target value/ramp time pairs",
												"isalias" : 0,
												"aliases" : [ "dest" ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"inlet" : 1,
												"type" : "list",
												"defaultValue" : ""
											}
,
											"dest" : 											{
												"attrOrProp" : 1,
												"digest" : "Target value or target value/ramp time pairs",
												"isalias" : 1,
												"aliasOf" : "segments",
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"inlet" : 1,
												"type" : "list",
												"defaultValue" : ""
											}
,
											"time" : 											{
												"attrOrProp" : 1,
												"digest" : "Ramp time",
												"defaultarg" : 2,
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"inlet" : 1,
												"type" : "number",
												"defaultValue" : "0"
											}
,
											"keepramp" : 											{
												"attrOrProp" : 1,
												"digest" : "Keep last ramp",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 1,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "bool",
												"defaultValue" : "false"
											}
,
											"out" : 											{
												"attrOrProp" : 1,
												"digest" : "Ramp out",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 0,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"outlet" : 1,
												"type" : "signal"
											}
,
											"target" : 											{
												"attrOrProp" : 1,
												"digest" : "Bang when ramp has finished",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 0,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"outlet" : 1,
												"type" : "bang"
											}
,
											"value" : 											{
												"attrOrProp" : 2,
												"digest" : "Initial value.",
												"defaultarg" : 1,
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"defaultValue" : "0"
											}

										}
,
										"inputs" : [ 											{
												"name" : "segments",
												"type" : "list",
												"digest" : "Target value or target value/ramp time pairs",
												"hot" : 1,
												"docked" : 0
											}
, 											{
												"name" : "time",
												"type" : "number",
												"digest" : "Ramp time",
												"defaultarg" : 2,
												"docked" : 0
											}
 ],
										"outputs" : [ 											{
												"name" : "out",
												"type" : "signal",
												"digest" : "Ramp out",
												"docked" : 0
											}
, 											{
												"name" : "target",
												"type" : "bang",
												"digest" : "Bang when ramp has finished",
												"docked" : 0
											}
 ],
										"helpname" : "line~",
										"aliasOf" : "line~",
										"classname" : "line~",
										"operator" : 0,
										"versionId" : 2134689829,
										"changesPatcherIO" : 0
									}
,
									"text" : "line~ 0 20 @keepramp 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-13",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 117.0, 494.0, 67.0, 23.0 ],
									"rnbo_classname" : "s~",
									"rnbo_serial" : 1,
									"rnbo_uniqueid" : "s~_obj-13",
									"text" : "s~ dry_gain"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 263.0, 494.0, 70.0, 23.0 ],
									"rnbo_classname" : "s~",
									"rnbo_serial" : 2,
									"rnbo_uniqueid" : "s~_obj-12",
									"text" : "s~ wet_gain"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 117.0, 356.0, 180.0, 23.0 ],
									"rnbo_classname" : "param",
									"rnbo_extra_attributes" : 									{
										"unit" : "",
										"order" : "0",
										"sendinit" : 1,
										"preset" : 1,
										"meta" : "",
										"displayname" : "",
										"steps" : 0.0,
										"displayorder" : "-",
										"ctlin" : -1.0,
										"fromnormalized" : "",
										"tonormalized" : "",
										"exponent" : 1.0,
										"enum" : ""
									}
,
									"rnbo_serial" : 1,
									"rnbo_uniqueid" : "dry_wet",
									"rnboinfo" : 									{
										"needsInstanceInfo" : 1,
										"argnames" : 										{
											"value" : 											{
												"attrOrProp" : 1,
												"digest" : "Parameter value",
												"defaultarg" : 2,
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 1,
												"deprecated" : 0,
												"touched" : 0,
												"inlet" : 1,
												"type" : "number",
												"defaultValue" : "1"
											}
,
											"normalizedvalue" : 											{
												"attrOrProp" : 1,
												"digest" : "Set value normalized. ",
												"isalias" : 0,
												"aliases" : [  ],
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"inlet" : 1,
												"type" : "number"
											}
,
											"reset" : 											{
												"attrOrProp" : 1,
												"digest" : "Reset param to initial value",
												"isalias" : 0,
												"aliases" : [  ],
												"attachable" : 1,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "bang"
											}
,
											"normalized" : 											{
												"attrOrProp" : 1,
												"digest" : "Normalized parameter value.",
												"isalias" : 0,
												"aliases" : [  ],
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"outlet" : 1,
												"type" : "number"
											}
,
											"name" : 											{
												"attrOrProp" : 2,
												"digest" : "Name of the parameter",
												"defaultarg" : 1,
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"label" : "Parameter Name",
												"mandatory" : 1
											}
,
											"enum" : 											{
												"attrOrProp" : 2,
												"digest" : "Use an enumerated output",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "list",
												"label" : "Enum Values",
												"displayorder" : 6
											}
,
											"minimum" : 											{
												"attrOrProp" : 2,
												"digest" : "Minimum value",
												"isalias" : 0,
												"aliases" : [ "min" ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"defaultValue" : "0",
												"label" : "Minimum",
												"displayorder" : 1
											}
,
											"min" : 											{
												"attrOrProp" : 2,
												"digest" : "Minimum value",
												"isalias" : 1,
												"aliasOf" : "minimum",
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"defaultValue" : "0",
												"label" : "Minimum",
												"displayorder" : 1
											}
,
											"maximum" : 											{
												"attrOrProp" : 2,
												"digest" : "Maximum value",
												"isalias" : 0,
												"aliases" : [ "max" ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"defaultValue" : "1",
												"label" : "Maximum",
												"displayorder" : 2
											}
,
											"max" : 											{
												"attrOrProp" : 2,
												"digest" : "Maximum value",
												"isalias" : 1,
												"aliasOf" : "maximum",
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"defaultValue" : "1",
												"label" : "Maximum",
												"displayorder" : 2
											}
,
											"exponent" : 											{
												"attrOrProp" : 2,
												"digest" : "Scale values exponentially",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"defaultValue" : "1",
												"label" : "Exponent",
												"displayorder" : 7
											}
,
											"steps" : 											{
												"attrOrProp" : 2,
												"digest" : "Divide the output into a number of discrete steps",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"defaultValue" : "0",
												"label" : "Steps",
												"displayorder" : 8
											}
,
											"displayName" : 											{
												"attrOrProp" : 2,
												"digest" : "DEPRECATED: Use the lower case 'displayname' instead",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 1,
												"touched" : 0,
												"type" : "symbol",
												"label" : "Display Name"
											}
,
											"displayname" : 											{
												"attrOrProp" : 2,
												"digest" : "A more readable name for the parameter in an external RNBO target",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"defaultValue" : "",
												"label" : "Display Name",
												"displayorder" : 14
											}
,
											"unit" : 											{
												"attrOrProp" : 2,
												"digest" : "A symbol to describe the unit of the parameter in an external RNBO target",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"defaultValue" : "",
												"label" : "Unit",
												"displayorder" : 15
											}
,
											"tonormalized" : 											{
												"attrOrProp" : 2,
												"digest" : "Converts a real parameter value to its normalized form",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"label" : "To Normalized Expression",
												"displayorder" : 10
											}
,
											"fromnormalized" : 											{
												"attrOrProp" : 2,
												"digest" : "Converts a normalized parameter into its actual parameter value",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"label" : "From Normalized Expression",
												"displayorder" : 9
											}
,
											"order" : 											{
												"attrOrProp" : 2,
												"digest" : "Order in which initial parameter values will be sent out on patcher load. The order can be numeric or symbolic ('first' and 'last')",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"defaultValue" : "0",
												"label" : "Restore Order",
												"displayorder" : 12
											}
,
											"displayorder" : 											{
												"attrOrProp" : 2,
												"digest" : "Order in which parameters will show up in a list of all parameters. The order can be numeric or symbolic ('first' and 'last')",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"defaultValue" : "-",
												"label" : "Display Order",
												"displayorder" : 13
											}
,
											"sendinit" : 											{
												"attrOrProp" : 2,
												"digest" : "Send initial value",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "bool",
												"defaultValue" : "true",
												"label" : "Send Init",
												"displayorder" : 4
											}
,
											"ctlin" : 											{
												"attrOrProp" : 2,
												"digest" : "MIDI controller number to control this parameter.",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"defaultValue" : "-1",
												"label" : "MIDI Controller Number.",
												"displayorder" : 16
											}
,
											"meta" : 											{
												"attrOrProp" : 2,
												"digest" : "A JSON formatted string containing metadata for use by the exported code",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"defaultValue" : "",
												"label" : "Metadata",
												"displayorder" : 17
											}
,
											"nopreset" : 											{
												"attrOrProp" : 2,
												"digest" : "Do not add this value to the preset [DEPRECATED - USE @preset 0 instead].",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 1,
												"touched" : 0,
												"type" : "bool",
												"defaultValue" : "false"
											}
,
											"preset" : 											{
												"attrOrProp" : 2,
												"digest" : "Add this value to the preset.",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "bool",
												"defaultValue" : "true",
												"label" : "Include In Preset",
												"displayorder" : 11
											}

										}
,
										"inputs" : [ 											{
												"name" : "value",
												"type" : "number",
												"digest" : "Parameter value",
												"defaultarg" : 2,
												"hot" : 1,
												"docked" : 0
											}
, 											{
												"name" : "normalizedvalue",
												"type" : "number",
												"digest" : "Set value normalized. ",
												"docked" : 0
											}
 ],
										"outputs" : [ 											{
												"name" : "value",
												"type" : "number",
												"digest" : "Parameter value",
												"defaultarg" : 2,
												"hot" : 1,
												"docked" : 0
											}
, 											{
												"name" : "normalized",
												"type" : "number",
												"digest" : "Normalized parameter value.",
												"docked" : 0
											}
 ],
										"helpname" : "param",
										"aliasOf" : "param",
										"classname" : "param",
										"operator" : 0,
										"versionId" : -1661410411,
										"changesPatcherIO" : 0
									}
,
									"text" : "param dry_wet 1 @min 0 @max 1",
									"varname" : "dry_wet"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "signal", "" ],
									"patching_rect" : [ 263.0, 465.0, 134.0, 23.0 ],
									"rnbo_classname" : "line~",
									"rnbo_serial" : 2,
									"rnbo_uniqueid" : "line~_obj-10",
									"rnboinfo" : 									{
										"needsInstanceInfo" : 1,
										"argnames" : 										{
											"segments" : 											{
												"attrOrProp" : 1,
												"digest" : "Target value or target value/ramp time pairs",
												"isalias" : 0,
												"aliases" : [ "dest" ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"inlet" : 1,
												"type" : "list",
												"defaultValue" : ""
											}
,
											"dest" : 											{
												"attrOrProp" : 1,
												"digest" : "Target value or target value/ramp time pairs",
												"isalias" : 1,
												"aliasOf" : "segments",
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"inlet" : 1,
												"type" : "list",
												"defaultValue" : ""
											}
,
											"time" : 											{
												"attrOrProp" : 1,
												"digest" : "Ramp time",
												"defaultarg" : 2,
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"inlet" : 1,
												"type" : "number",
												"defaultValue" : "0"
											}
,
											"keepramp" : 											{
												"attrOrProp" : 1,
												"digest" : "Keep last ramp",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 1,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "bool",
												"defaultValue" : "false"
											}
,
											"out" : 											{
												"attrOrProp" : 1,
												"digest" : "Ramp out",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 0,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"outlet" : 1,
												"type" : "signal"
											}
,
											"target" : 											{
												"attrOrProp" : 1,
												"digest" : "Bang when ramp has finished",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 0,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"outlet" : 1,
												"type" : "bang"
											}
,
											"value" : 											{
												"attrOrProp" : 2,
												"digest" : "Initial value.",
												"defaultarg" : 1,
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"defaultValue" : "0"
											}

										}
,
										"inputs" : [ 											{
												"name" : "segments",
												"type" : "list",
												"digest" : "Target value or target value/ramp time pairs",
												"hot" : 1,
												"docked" : 0
											}
, 											{
												"name" : "time",
												"type" : "number",
												"digest" : "Ramp time",
												"defaultarg" : 2,
												"docked" : 0
											}
 ],
										"outputs" : [ 											{
												"name" : "out",
												"type" : "signal",
												"digest" : "Ramp out",
												"docked" : 0
											}
, 											{
												"name" : "target",
												"type" : "bang",
												"digest" : "Bang when ramp has finished",
												"docked" : 0
											}
 ],
										"helpname" : "line~",
										"aliasOf" : "line~",
										"classname" : "line~",
										"operator" : 0,
										"versionId" : 2134689829,
										"changesPatcherIO" : 0
									}
,
									"text" : "line~ 0 20 @keepramp 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 436.0, 409.0, 47.0, 23.0 ],
									"rnbo_classname" : "*~",
									"rnbo_serial" : 4,
									"rnbo_uniqueid" : "*~_obj-9",
									"text" : "*~"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 499.0, 494.0, 43.0, 23.0 ],
									"rnbo_classname" : "out~",
									"rnbo_extra_attributes" : 									{
										"meta" : "",
										"comment" : ""
									}
,
									"rnbo_serial" : 1,
									"rnbo_uniqueid" : "out~_obj-8",
									"rnboinfo" : 									{
										"needsInstanceInfo" : 1,
										"argnames" : 										{
											"in1" : 											{
												"attrOrProp" : 1,
												"digest" : "signal sent to outlet with index 2",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 0,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"inlet" : 1,
												"type" : "signal"
											}
,
											"index" : 											{
												"attrOrProp" : 2,
												"digest" : "outlet number",
												"defaultarg" : 1,
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"mandatory" : 1
											}
,
											"comment" : 											{
												"attrOrProp" : 2,
												"digest" : "mouse over comment",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol"
											}
,
											"meta" : 											{
												"attrOrProp" : 2,
												"digest" : "A JSON formatted string containing metadata for use by the exported code",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"defaultValue" : "",
												"label" : "Metadata",
												"displayorder" : 3
											}

										}
,
										"inputs" : [ 											{
												"name" : "in1",
												"type" : "signal",
												"digest" : "signal sent to outlet with index 2",
												"displayName" : "",
												"hot" : 1,
												"docked" : 0
											}
 ],
										"outputs" : [  ],
										"helpname" : "out~",
										"aliasOf" : "out~",
										"classname" : "out~",
										"operator" : 0,
										"versionId" : 1989326771,
										"changesPatcherIO" : 1
									}
,
									"text" : "out~ 2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 436.0, 494.0, 43.0, 23.0 ],
									"rnbo_classname" : "out~",
									"rnbo_extra_attributes" : 									{
										"meta" : "",
										"comment" : ""
									}
,
									"rnbo_serial" : 2,
									"rnbo_uniqueid" : "out~_obj-7",
									"rnboinfo" : 									{
										"needsInstanceInfo" : 1,
										"argnames" : 										{
											"in1" : 											{
												"attrOrProp" : 1,
												"digest" : "signal sent to outlet with index 1",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 0,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"inlet" : 1,
												"type" : "signal"
											}
,
											"index" : 											{
												"attrOrProp" : 2,
												"digest" : "outlet number",
												"defaultarg" : 1,
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"mandatory" : 1
											}
,
											"comment" : 											{
												"attrOrProp" : 2,
												"digest" : "mouse over comment",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol"
											}
,
											"meta" : 											{
												"attrOrProp" : 2,
												"digest" : "A JSON formatted string containing metadata for use by the exported code",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"defaultValue" : "",
												"label" : "Metadata",
												"displayorder" : 3
											}

										}
,
										"inputs" : [ 											{
												"name" : "in1",
												"type" : "signal",
												"digest" : "signal sent to outlet with index 1",
												"displayName" : "",
												"hot" : 1,
												"docked" : 0
											}
 ],
										"outputs" : [  ],
										"helpname" : "out~",
										"aliasOf" : "out~",
										"classname" : "out~",
										"operator" : 0,
										"versionId" : 1989326771,
										"changesPatcherIO" : 1
									}
,
									"text" : "out~ 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 117.0, 248.0, 146.0, 23.0 ],
									"rnbo_classname" : "set",
									"rnbo_serial" : 1,
									"rnbo_uniqueid" : "set_obj-6",
									"rnboinfo" : 									{
										"needsInstanceInfo" : 1,
										"argnames" : 										{
											"name" : 											{
												"attrOrProp" : 2,
												"digest" : "attribute/param to control",
												"defaultarg" : 1,
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"mandatory" : 1
											}

										}
,
										"inputs" : [ 											{
												"name" : "input",
												"type" : [ "bang", "number", "list", "signal" ],
												"digest" : "attribute or parameter value (bang, number, list)",
												"hot" : 1,
												"docked" : 0
											}
 ],
										"outputs" : [ 											{
												"name" : "output",
												"type" : [ "bang", "number", "list", "signal" ],
												"digest" : "connect to first inlet of gen or subpatcher",
												"docked" : 0
											}
 ],
										"helpname" : "set",
										"aliasOf" : "set",
										"classname" : "set",
										"operator" : 0,
										"versionId" : 1197449671,
										"changesPatcherIO" : 0
									}
,
									"text" : "set sample_rate_reduction"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 117.0, 219.0, 210.0, 23.0 ],
									"rnbo_classname" : "param",
									"rnbo_extra_attributes" : 									{
										"unit" : "",
										"order" : "0",
										"sendinit" : 1,
										"preset" : 1,
										"meta" : "",
										"displayname" : "",
										"steps" : 0.0,
										"displayorder" : "-",
										"ctlin" : -1.0,
										"fromnormalized" : "",
										"tonormalized" : "",
										"exponent" : 1.0,
										"enum" : ""
									}
,
									"rnbo_serial" : 2,
									"rnbo_uniqueid" : "clock_speed",
									"rnboinfo" : 									{
										"needsInstanceInfo" : 1,
										"argnames" : 										{
											"value" : 											{
												"attrOrProp" : 1,
												"digest" : "Parameter value",
												"defaultarg" : 2,
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 1,
												"deprecated" : 0,
												"touched" : 0,
												"inlet" : 1,
												"type" : "number",
												"defaultValue" : "0.6"
											}
,
											"normalizedvalue" : 											{
												"attrOrProp" : 1,
												"digest" : "Set value normalized. ",
												"isalias" : 0,
												"aliases" : [  ],
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"inlet" : 1,
												"type" : "number"
											}
,
											"reset" : 											{
												"attrOrProp" : 1,
												"digest" : "Reset param to initial value",
												"isalias" : 0,
												"aliases" : [  ],
												"attachable" : 1,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "bang"
											}
,
											"normalized" : 											{
												"attrOrProp" : 1,
												"digest" : "Normalized parameter value.",
												"isalias" : 0,
												"aliases" : [  ],
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"outlet" : 1,
												"type" : "number"
											}
,
											"name" : 											{
												"attrOrProp" : 2,
												"digest" : "Name of the parameter",
												"defaultarg" : 1,
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"label" : "Parameter Name",
												"mandatory" : 1
											}
,
											"enum" : 											{
												"attrOrProp" : 2,
												"digest" : "Use an enumerated output",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "list",
												"label" : "Enum Values",
												"displayorder" : 6
											}
,
											"minimum" : 											{
												"attrOrProp" : 2,
												"digest" : "Minimum value",
												"isalias" : 0,
												"aliases" : [ "min" ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"defaultValue" : "0",
												"label" : "Minimum",
												"displayorder" : 1
											}
,
											"min" : 											{
												"attrOrProp" : 2,
												"digest" : "Minimum value",
												"isalias" : 1,
												"aliasOf" : "minimum",
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"defaultValue" : "0",
												"label" : "Minimum",
												"displayorder" : 1
											}
,
											"maximum" : 											{
												"attrOrProp" : 2,
												"digest" : "Maximum value",
												"isalias" : 0,
												"aliases" : [ "max" ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"defaultValue" : "1",
												"label" : "Maximum",
												"displayorder" : 2
											}
,
											"max" : 											{
												"attrOrProp" : 2,
												"digest" : "Maximum value",
												"isalias" : 1,
												"aliasOf" : "maximum",
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"defaultValue" : "1",
												"label" : "Maximum",
												"displayorder" : 2
											}
,
											"exponent" : 											{
												"attrOrProp" : 2,
												"digest" : "Scale values exponentially",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"defaultValue" : "1",
												"label" : "Exponent",
												"displayorder" : 7
											}
,
											"steps" : 											{
												"attrOrProp" : 2,
												"digest" : "Divide the output into a number of discrete steps",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"defaultValue" : "0",
												"label" : "Steps",
												"displayorder" : 8
											}
,
											"displayName" : 											{
												"attrOrProp" : 2,
												"digest" : "DEPRECATED: Use the lower case 'displayname' instead",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 1,
												"touched" : 0,
												"type" : "symbol",
												"label" : "Display Name"
											}
,
											"displayname" : 											{
												"attrOrProp" : 2,
												"digest" : "A more readable name for the parameter in an external RNBO target",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"defaultValue" : "",
												"label" : "Display Name",
												"displayorder" : 14
											}
,
											"unit" : 											{
												"attrOrProp" : 2,
												"digest" : "A symbol to describe the unit of the parameter in an external RNBO target",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"defaultValue" : "",
												"label" : "Unit",
												"displayorder" : 15
											}
,
											"tonormalized" : 											{
												"attrOrProp" : 2,
												"digest" : "Converts a real parameter value to its normalized form",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"label" : "To Normalized Expression",
												"displayorder" : 10
											}
,
											"fromnormalized" : 											{
												"attrOrProp" : 2,
												"digest" : "Converts a normalized parameter into its actual parameter value",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"label" : "From Normalized Expression",
												"displayorder" : 9
											}
,
											"order" : 											{
												"attrOrProp" : 2,
												"digest" : "Order in which initial parameter values will be sent out on patcher load. The order can be numeric or symbolic ('first' and 'last')",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"defaultValue" : "0",
												"label" : "Restore Order",
												"displayorder" : 12
											}
,
											"displayorder" : 											{
												"attrOrProp" : 2,
												"digest" : "Order in which parameters will show up in a list of all parameters. The order can be numeric or symbolic ('first' and 'last')",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"defaultValue" : "-",
												"label" : "Display Order",
												"displayorder" : 13
											}
,
											"sendinit" : 											{
												"attrOrProp" : 2,
												"digest" : "Send initial value",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "bool",
												"defaultValue" : "true",
												"label" : "Send Init",
												"displayorder" : 4
											}
,
											"ctlin" : 											{
												"attrOrProp" : 2,
												"digest" : "MIDI controller number to control this parameter.",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"defaultValue" : "-1",
												"label" : "MIDI Controller Number.",
												"displayorder" : 16
											}
,
											"meta" : 											{
												"attrOrProp" : 2,
												"digest" : "A JSON formatted string containing metadata for use by the exported code",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"defaultValue" : "",
												"label" : "Metadata",
												"displayorder" : 17
											}
,
											"nopreset" : 											{
												"attrOrProp" : 2,
												"digest" : "Do not add this value to the preset [DEPRECATED - USE @preset 0 instead].",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 1,
												"touched" : 0,
												"type" : "bool",
												"defaultValue" : "false"
											}
,
											"preset" : 											{
												"attrOrProp" : 2,
												"digest" : "Add this value to the preset.",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "bool",
												"defaultValue" : "true",
												"label" : "Include In Preset",
												"displayorder" : 11
											}

										}
,
										"inputs" : [ 											{
												"name" : "value",
												"type" : "number",
												"digest" : "Parameter value",
												"defaultarg" : 2,
												"hot" : 1,
												"docked" : 0
											}
, 											{
												"name" : "normalizedvalue",
												"type" : "number",
												"digest" : "Set value normalized. ",
												"docked" : 0
											}
 ],
										"outputs" : [ 											{
												"name" : "value",
												"type" : "number",
												"digest" : "Parameter value",
												"defaultarg" : 2,
												"hot" : 1,
												"docked" : 0
											}
, 											{
												"name" : "normalized",
												"type" : "number",
												"digest" : "Normalized parameter value.",
												"docked" : 0
											}
 ],
										"helpname" : "param",
										"aliasOf" : "param",
										"classname" : "param",
										"operator" : 0,
										"versionId" : -1661410411,
										"changesPatcherIO" : 0
									}
,
									"text" : "param clock_speed 0.6 @min 0 @max 1",
									"varname" : "clock_speed"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 117.0, 169.0, 57.0, 23.0 ],
									"rnbo_classname" : "set",
									"rnbo_serial" : 2,
									"rnbo_uniqueid" : "set_obj-4",
									"rnboinfo" : 									{
										"needsInstanceInfo" : 1,
										"argnames" : 										{
											"name" : 											{
												"attrOrProp" : 2,
												"digest" : "attribute/param to control",
												"defaultarg" : 1,
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"mandatory" : 1
											}

										}
,
										"inputs" : [ 											{
												"name" : "input",
												"type" : [ "bang", "number", "list", "signal" ],
												"digest" : "attribute or parameter value (bang, number, list)",
												"hot" : 1,
												"docked" : 0
											}
 ],
										"outputs" : [ 											{
												"name" : "output",
												"type" : [ "bang", "number", "list", "signal" ],
												"digest" : "connect to first inlet of gen or subpatcher",
												"docked" : 0
											}
 ],
										"helpname" : "set",
										"aliasOf" : "set",
										"classname" : "set",
										"operator" : 0,
										"versionId" : 1197449671,
										"changesPatcherIO" : 0
									}
,
									"text" : "set decay"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 117.0, 141.0, 178.0, 23.0 ],
									"rnbo_classname" : "param",
									"rnbo_extra_attributes" : 									{
										"unit" : "",
										"order" : "0",
										"sendinit" : 1,
										"preset" : 1,
										"meta" : "",
										"displayname" : "",
										"steps" : 0.0,
										"displayorder" : "-",
										"ctlin" : -1.0,
										"fromnormalized" : "",
										"tonormalized" : "",
										"exponent" : 1.0,
										"enum" : ""
									}
,
									"rnbo_serial" : 3,
									"rnbo_uniqueid" : "decay",
									"rnboinfo" : 									{
										"needsInstanceInfo" : 1,
										"argnames" : 										{
											"value" : 											{
												"attrOrProp" : 1,
												"digest" : "Parameter value",
												"defaultarg" : 2,
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 1,
												"deprecated" : 0,
												"touched" : 0,
												"inlet" : 1,
												"type" : "number",
												"defaultValue" : "0.7"
											}
,
											"normalizedvalue" : 											{
												"attrOrProp" : 1,
												"digest" : "Set value normalized. ",
												"isalias" : 0,
												"aliases" : [  ],
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"inlet" : 1,
												"type" : "number"
											}
,
											"reset" : 											{
												"attrOrProp" : 1,
												"digest" : "Reset param to initial value",
												"isalias" : 0,
												"aliases" : [  ],
												"attachable" : 1,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "bang"
											}
,
											"normalized" : 											{
												"attrOrProp" : 1,
												"digest" : "Normalized parameter value.",
												"isalias" : 0,
												"aliases" : [  ],
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"outlet" : 1,
												"type" : "number"
											}
,
											"name" : 											{
												"attrOrProp" : 2,
												"digest" : "Name of the parameter",
												"defaultarg" : 1,
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"label" : "Parameter Name",
												"mandatory" : 1
											}
,
											"enum" : 											{
												"attrOrProp" : 2,
												"digest" : "Use an enumerated output",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "list",
												"label" : "Enum Values",
												"displayorder" : 6
											}
,
											"minimum" : 											{
												"attrOrProp" : 2,
												"digest" : "Minimum value",
												"isalias" : 0,
												"aliases" : [ "min" ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"defaultValue" : "0",
												"label" : "Minimum",
												"displayorder" : 1
											}
,
											"min" : 											{
												"attrOrProp" : 2,
												"digest" : "Minimum value",
												"isalias" : 1,
												"aliasOf" : "minimum",
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"defaultValue" : "0",
												"label" : "Minimum",
												"displayorder" : 1
											}
,
											"maximum" : 											{
												"attrOrProp" : 2,
												"digest" : "Maximum value",
												"isalias" : 0,
												"aliases" : [ "max" ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"defaultValue" : "1",
												"label" : "Maximum",
												"displayorder" : 2
											}
,
											"max" : 											{
												"attrOrProp" : 2,
												"digest" : "Maximum value",
												"isalias" : 1,
												"aliasOf" : "maximum",
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"defaultValue" : "1",
												"label" : "Maximum",
												"displayorder" : 2
											}
,
											"exponent" : 											{
												"attrOrProp" : 2,
												"digest" : "Scale values exponentially",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"defaultValue" : "1",
												"label" : "Exponent",
												"displayorder" : 7
											}
,
											"steps" : 											{
												"attrOrProp" : 2,
												"digest" : "Divide the output into a number of discrete steps",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"defaultValue" : "0",
												"label" : "Steps",
												"displayorder" : 8
											}
,
											"displayName" : 											{
												"attrOrProp" : 2,
												"digest" : "DEPRECATED: Use the lower case 'displayname' instead",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 1,
												"touched" : 0,
												"type" : "symbol",
												"label" : "Display Name"
											}
,
											"displayname" : 											{
												"attrOrProp" : 2,
												"digest" : "A more readable name for the parameter in an external RNBO target",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"defaultValue" : "",
												"label" : "Display Name",
												"displayorder" : 14
											}
,
											"unit" : 											{
												"attrOrProp" : 2,
												"digest" : "A symbol to describe the unit of the parameter in an external RNBO target",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"defaultValue" : "",
												"label" : "Unit",
												"displayorder" : 15
											}
,
											"tonormalized" : 											{
												"attrOrProp" : 2,
												"digest" : "Converts a real parameter value to its normalized form",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"label" : "To Normalized Expression",
												"displayorder" : 10
											}
,
											"fromnormalized" : 											{
												"attrOrProp" : 2,
												"digest" : "Converts a normalized parameter into its actual parameter value",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"label" : "From Normalized Expression",
												"displayorder" : 9
											}
,
											"order" : 											{
												"attrOrProp" : 2,
												"digest" : "Order in which initial parameter values will be sent out on patcher load. The order can be numeric or symbolic ('first' and 'last')",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"defaultValue" : "0",
												"label" : "Restore Order",
												"displayorder" : 12
											}
,
											"displayorder" : 											{
												"attrOrProp" : 2,
												"digest" : "Order in which parameters will show up in a list of all parameters. The order can be numeric or symbolic ('first' and 'last')",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"defaultValue" : "-",
												"label" : "Display Order",
												"displayorder" : 13
											}
,
											"sendinit" : 											{
												"attrOrProp" : 2,
												"digest" : "Send initial value",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "bool",
												"defaultValue" : "true",
												"label" : "Send Init",
												"displayorder" : 4
											}
,
											"ctlin" : 											{
												"attrOrProp" : 2,
												"digest" : "MIDI controller number to control this parameter.",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"defaultValue" : "-1",
												"label" : "MIDI Controller Number.",
												"displayorder" : 16
											}
,
											"meta" : 											{
												"attrOrProp" : 2,
												"digest" : "A JSON formatted string containing metadata for use by the exported code",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"defaultValue" : "",
												"label" : "Metadata",
												"displayorder" : 17
											}
,
											"nopreset" : 											{
												"attrOrProp" : 2,
												"digest" : "Do not add this value to the preset [DEPRECATED - USE @preset 0 instead].",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 1,
												"touched" : 0,
												"type" : "bool",
												"defaultValue" : "false"
											}
,
											"preset" : 											{
												"attrOrProp" : 2,
												"digest" : "Add this value to the preset.",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "bool",
												"defaultValue" : "true",
												"label" : "Include In Preset",
												"displayorder" : 11
											}

										}
,
										"inputs" : [ 											{
												"name" : "value",
												"type" : "number",
												"digest" : "Parameter value",
												"defaultarg" : 2,
												"hot" : 1,
												"docked" : 0
											}
, 											{
												"name" : "normalizedvalue",
												"type" : "number",
												"digest" : "Set value normalized. ",
												"docked" : 0
											}
 ],
										"outputs" : [ 											{
												"name" : "value",
												"type" : "number",
												"digest" : "Parameter value",
												"defaultarg" : 2,
												"hot" : 1,
												"docked" : 0
											}
, 											{
												"name" : "normalized",
												"type" : "number",
												"digest" : "Normalized parameter value.",
												"docked" : 0
											}
 ],
										"helpname" : "param",
										"aliasOf" : "param",
										"classname" : "param",
										"operator" : 0,
										"versionId" : -1661410411,
										"changesPatcherIO" : 0
									}
,
									"text" : "param decay 0.7 @min 0 @max 1",
									"varname" : "decay"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 499.0, 261.0, 34.0, 23.0 ],
									"rnbo_classname" : "in~",
									"rnbo_extra_attributes" : 									{
										"meta" : "",
										"comment" : ""
									}
,
									"rnbo_serial" : 1,
									"rnbo_uniqueid" : "in~_obj-2",
									"rnboinfo" : 									{
										"needsInstanceInfo" : 1,
										"argnames" : 										{
											"out1" : 											{
												"attrOrProp" : 1,
												"digest" : "signal from inlet with index 2",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 0,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"outlet" : 1,
												"type" : "signal"
											}
,
											"index" : 											{
												"attrOrProp" : 2,
												"digest" : "inlet number",
												"defaultarg" : 1,
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"mandatory" : 1
											}
,
											"comment" : 											{
												"attrOrProp" : 2,
												"digest" : "mouse over comment",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol"
											}
,
											"meta" : 											{
												"attrOrProp" : 2,
												"digest" : "A JSON formatted string containing metadata for use by the exported code",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"defaultValue" : "",
												"label" : "Metadata",
												"displayorder" : 3
											}

										}
,
										"inputs" : [  ],
										"outputs" : [ 											{
												"name" : "out1",
												"type" : "signal",
												"digest" : "signal from inlet with index 2",
												"displayName" : "",
												"docked" : 0
											}
 ],
										"helpname" : "in~",
										"aliasOf" : "in~",
										"classname" : "in~",
										"operator" : 0,
										"versionId" : -1654556303,
										"changesPatcherIO" : 1
									}
,
									"text" : "in~ 2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 436.0, 261.0, 34.0, 23.0 ],
									"rnbo_classname" : "in~",
									"rnbo_extra_attributes" : 									{
										"meta" : "",
										"comment" : ""
									}
,
									"rnbo_serial" : 2,
									"rnbo_uniqueid" : "in~_obj-1",
									"rnboinfo" : 									{
										"needsInstanceInfo" : 1,
										"argnames" : 										{
											"out1" : 											{
												"attrOrProp" : 1,
												"digest" : "signal from inlet with index 1",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 0,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"outlet" : 1,
												"type" : "signal"
											}
,
											"index" : 											{
												"attrOrProp" : 2,
												"digest" : "inlet number",
												"defaultarg" : 1,
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "number",
												"mandatory" : 1
											}
,
											"comment" : 											{
												"attrOrProp" : 2,
												"digest" : "mouse over comment",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol"
											}
,
											"meta" : 											{
												"attrOrProp" : 2,
												"digest" : "A JSON formatted string containing metadata for use by the exported code",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"defaultValue" : "",
												"label" : "Metadata",
												"displayorder" : 3
											}

										}
,
										"inputs" : [  ],
										"outputs" : [ 											{
												"name" : "out1",
												"type" : "signal",
												"digest" : "signal from inlet with index 1",
												"displayName" : "",
												"docked" : 0
											}
 ],
										"helpname" : "in~",
										"aliasOf" : "in~",
										"classname" : "in~",
										"operator" : 0,
										"versionId" : -1654556303,
										"changesPatcherIO" : 1
									}
,
									"text" : "in~ 1"
								}

							}
, 							{
								"box" : 								{
									"genpatcher" : 									{
										"patcher" : 										{
											"fileversion" : 1,
											"appversion" : 											{
												"major" : 8,
												"minor" : 6,
												"revision" : 3,
												"architecture" : "x64",
												"modernui" : 1
											}
,
											"classnamespace" : "dsp.gen",
											"rect" : [ 1954.0, 77.0, 2492.0, 969.0 ],
											"bglocked" : 0,
											"openinpresentation" : 0,
											"default_fontsize" : 12.0,
											"default_fontface" : 0,
											"default_fontname" : "Arial",
											"gridonopen" : 1,
											"gridsize" : [ 15.0, 15.0 ],
											"gridsnaponopen" : 1,
											"objectsnaponopen" : 1,
											"statusbarvisible" : 2,
											"toolbarvisible" : 1,
											"lefttoolbarpinned" : 0,
											"toptoolbarpinned" : 0,
											"righttoolbarpinned" : 0,
											"bottomtoolbarpinned" : 0,
											"toolbars_unpinned_last_save" : 0,
											"tallnewobj" : 0,
											"boxanimatetime" : 200,
											"enablehscroll" : 1,
											"enablevscroll" : 1,
											"devicewidth" : 0.0,
											"description" : "",
											"digest" : "",
											"tags" : "",
											"style" : "",
											"subpatcher_template" : "",
											"assistshowspatchername" : 0,
											"boxes" : [ 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "Early Reflections",
														"id" : "obj-486",
														"patching_rect" : [ 1361.0, 511.0, 150.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "Early Reflections",
														"id" : "obj-485",
														"patching_rect" : [ 260.0, 511.0, 150.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r lfo_scaler",
														"id" : "obj-482",
														"patching_rect" : [ 1897.0, 1589.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-483",
														"patching_rect" : [ 1859.0, 1618.0, 57.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r lfo_scaler",
														"id" : "obj-480",
														"patching_rect" : [ 1407.0, 1597.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-481",
														"patching_rect" : [ 1369.0, 1626.0, 57.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r lfo_scaler",
														"id" : "obj-478",
														"patching_rect" : [ 803.0, 1589.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-479",
														"patching_rect" : [ 765.0, 1618.0, 57.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r lfo_scaler",
														"id" : "obj-477",
														"patching_rect" : [ 306.0, 1604.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-476",
														"patching_rect" : [ 268.0, 1633.0, 57.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s lfo_scaler",
														"id" : "obj-475",
														"patching_rect" : [ 1079.0, 295.0, 69.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "/ 44100",
														"id" : "obj-474",
														"patching_rect" : [ 1079.0, 264.5, 49.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.6",
														"id" : "obj-468",
														"patching_rect" : [ 1183.0, 1583.0, 33.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s early_reflections_R",
														"id" : "obj-469",
														"patching_rect" : [ 1183.0, 1611.0, 121.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.6",
														"id" : "obj-467",
														"patching_rect" : [ 90.5, 1598.0, 33.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s early_reflections_L",
														"id" : "obj-466",
														"patching_rect" : [ 90.5, 1626.0, 119.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s early_reflections_L",
														"id" : "obj-463",
														"patching_rect" : [ 194.0, 761.0, 119.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r early_reflections_R",
														"id" : "obj-462",
														"patching_rect" : [ 1865.0, 2545.0, 119.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s early_reflections_R",
														"id" : "obj-428",
														"patching_rect" : [ 1295.0, 761.0, 121.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.841",
														"id" : "obj-429",
														"patching_rect" : [ 1295.0, 677.0, 47.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.167",
														"id" : "obj-430",
														"patching_rect" : [ 1955.0, 677.0, 47.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.181",
														"id" : "obj-431",
														"patching_rect" : [ 1882.0, 677.0, 47.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.181",
														"id" : "obj-432",
														"patching_rect" : [ 1808.0, 677.0, 47.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.217",
														"id" : "obj-433",
														"patching_rect" : [ 1735.0, 677.0, 47.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-434",
														"patching_rect" : [ 1955.0, 614.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.0753",
														"id" : "obj-435",
														"patching_rect" : [ 1955.0, 586.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-436",
														"patching_rect" : [ 1889.0, 614.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.0726",
														"id" : "obj-437",
														"patching_rect" : [ 1889.0, 586.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-438",
														"patching_rect" : [ 1823.0, 614.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.0595",
														"id" : "obj-439",
														"patching_rect" : [ 1823.0, 586.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-440",
														"patching_rect" : [ 1757.0, 614.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.0572",
														"id" : "obj-441",
														"patching_rect" : [ 1757.0, 586.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.289",
														"id" : "obj-442",
														"patching_rect" : [ 1662.0, 677.0, 47.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.272",
														"id" : "obj-443",
														"patching_rect" : [ 1588.0, 677.0, 47.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.38",
														"id" : "obj-444",
														"patching_rect" : [ 1515.0, 677.0, 40.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.491",
														"id" : "obj-445",
														"patching_rect" : [ 1442.0, 677.0, 47.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.504",
														"id" : "obj-446",
														"patching_rect" : [ 1368.0, 677.0, 47.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.7",
														"id" : "obj-447",
														"patching_rect" : [ 1295.0, 729.0, 33.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-448",
														"patching_rect" : [ 1361.0, 537.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-449",
														"patching_rect" : [ 1691.0, 614.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.0485",
														"id" : "obj-450",
														"patching_rect" : [ 1691.0, 586.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-451",
														"patching_rect" : [ 1625.0, 614.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.0458",
														"id" : "obj-452",
														"patching_rect" : [ 1625.0, 586.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-453",
														"patching_rect" : [ 1559.0, 614.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.0298",
														"id" : "obj-454",
														"patching_rect" : [ 1559.0, 586.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-455",
														"patching_rect" : [ 1493.0, 614.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.0268",
														"id" : "obj-456",
														"patching_rect" : [ 1493.0, 586.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-457",
														"patching_rect" : [ 1427.0, 614.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.0215",
														"id" : "obj-458",
														"patching_rect" : [ 1427.0, 586.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-459",
														"patching_rect" : [ 1361.0, 614.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.0043",
														"id" : "obj-460",
														"patching_rect" : [ 1361.0, 586.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*15 10 @feedback 1",
														"id" : "obj-461",
														"patching_rect" : [ 1295.0, 644.0, 679.0, 22.0 ],
														"outlettype" : [ "", "", "", "", "", "", "", "", "", "" ],
														"numinlets" : 11,
														"numoutlets" : 10
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.841",
														"id" : "obj-425",
														"patching_rect" : [ 194.0, 677.0, 47.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.167",
														"id" : "obj-421",
														"patching_rect" : [ 854.0, 677.0, 47.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.181",
														"id" : "obj-422",
														"patching_rect" : [ 781.0, 677.0, 47.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.181",
														"id" : "obj-423",
														"patching_rect" : [ 708.0, 677.0, 47.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.217",
														"id" : "obj-424",
														"patching_rect" : [ 633.0, 677.0, 47.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-412",
														"patching_rect" : [ 854.0, 613.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.0753",
														"id" : "obj-413",
														"patching_rect" : [ 854.0, 586.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-414",
														"patching_rect" : [ 787.0, 613.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.0708",
														"id" : "obj-415",
														"patching_rect" : [ 787.0, 586.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-416",
														"patching_rect" : [ 723.0, 613.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.0612",
														"id" : "obj-417",
														"patching_rect" : [ 723.0, 586.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-418",
														"patching_rect" : [ 656.0, 613.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.0595",
														"id" : "obj-419",
														"patching_rect" : [ 656.0, 586.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r early_reflections_L",
														"id" : "obj-406",
														"patching_rect" : [ 821.0, 2549.0, 117.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.289",
														"id" : "obj-404",
														"patching_rect" : [ 560.0, 677.0, 47.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.272",
														"id" : "obj-403",
														"patching_rect" : [ 487.0, 677.0, 47.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.38",
														"id" : "obj-402",
														"patching_rect" : [ 414.0, 677.0, 40.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.491",
														"id" : "obj-401",
														"patching_rect" : [ 342.0, 677.0, 47.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.504",
														"id" : "obj-400",
														"patching_rect" : [ 267.0, 677.0, 47.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.7",
														"id" : "obj-399",
														"patching_rect" : [ 194.0, 729.0, 33.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-398",
														"patching_rect" : [ 260.0, 536.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-394",
														"patching_rect" : [ 589.0, 613.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.0485",
														"id" : "obj-395",
														"patching_rect" : [ 589.0, 586.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-396",
														"patching_rect" : [ 525.0, 613.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.0458",
														"id" : "obj-397",
														"patching_rect" : [ 525.0, 586.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-386",
														"patching_rect" : [ 458.0, 613.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.027",
														"id" : "obj-387",
														"patching_rect" : [ 458.0, 586.0, 47.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-388",
														"patching_rect" : [ 392.0, 613.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.0225",
														"id" : "obj-389",
														"patching_rect" : [ 392.0, 586.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-381",
														"patching_rect" : [ 327.0, 613.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.0215",
														"id" : "obj-385",
														"patching_rect" : [ 327.0, 586.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-380",
														"patching_rect" : [ 260.0, 613.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.0043",
														"id" : "obj-379",
														"patching_rect" : [ 260.0, 586.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*15 10 @feedback 1",
														"id" : "obj-375",
														"patching_rect" : [ 194.0, 644.0, 679.0, 22.0 ],
														"outlettype" : [ "", "", "", "", "", "", "", "", "", "" ],
														"numinlets" : 11,
														"numoutlets" : 10
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r triggerlatch",
														"id" : "obj-203",
														"patching_rect" : [ 2046.0, 2545.0, 75.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r triggerlatch",
														"id" : "obj-202",
														"patching_rect" : [ 1002.0, 2578.0, 75.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r triggerlatch",
														"id" : "obj-196",
														"patching_rect" : [ 1205.0, 412.0, 75.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r triggerlatch",
														"id" : "obj-42",
														"patching_rect" : [ 104.0, 412.0, 75.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s triggerlatch",
														"id" : "obj-39",
														"patching_rect" : [ 965.583277463912964, 295.0, 77.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r input_reduction",
														"id" : "obj-384",
														"patching_rect" : [ 684.0, 129.0, 98.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r input_reduction",
														"id" : "obj-383",
														"patching_rect" : [ 146.0, 163.0, 98.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "latch",
														"id" : "obj-382",
														"patching_rect" : [ 1996.0, 2607.0, 68.75, 23.0 ],
														"outlettype" : [ "" ],
														"fontsize" : 12.0,
														"numinlets" : 2,
														"fontname" : "Lato",
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "latch",
														"id" : "obj-369",
														"patching_rect" : [ 952.0, 2612.0, 68.75, 23.0 ],
														"outlettype" : [ "" ],
														"fontsize" : 12.0,
														"numinlets" : 2,
														"fontname" : "Lato",
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "f 1",
														"id" : "obj-376",
														"patching_rect" : [ 949.583277463912964, 235.0, 24.0, 23.0 ],
														"outlettype" : [ "" ],
														"fontsize" : 12.0,
														"numinlets" : 0,
														"fontname" : "Lato",
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "counter",
														"id" : "obj-377",
														"patching_rect" : [ 949.583277463912964, 264.0, 51.0, 23.0 ],
														"outlettype" : [ "", "", "" ],
														"fontsize" : 12.0,
														"numinlets" : 3,
														"fontname" : "Lato",
														"numoutlets" : 3
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "latch",
														"id" : "obj-378",
														"patching_rect" : [ 1155.0, 446.0, 68.75, 23.0 ],
														"outlettype" : [ "" ],
														"fontsize" : 12.0,
														"numinlets" : 2,
														"fontname" : "Lato",
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r bandwidth",
														"id" : "obj-372",
														"patching_rect" : [ 1176.0, 543.0, 71.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r predelay",
														"id" : "obj-368",
														"patching_rect" : [ 1247.0, 480.0, 62.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "dcblock",
														"id" : "obj-347",
														"patching_rect" : [ 1996.0, 2642.0, 49.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r tap6R",
														"id" : "obj-348",
														"patching_rect" : [ 2052.0, 2484.0, 48.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r tap5R",
														"id" : "obj-349",
														"patching_rect" : [ 2052.0, 2426.0, 48.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r tap4R",
														"id" : "obj-350",
														"patching_rect" : [ 2052.0, 2364.0, 48.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r tap3R",
														"id" : "obj-351",
														"patching_rect" : [ 2052.0, 2303.0, 48.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r tap2R",
														"id" : "obj-352",
														"patching_rect" : [ 2052.0, 2237.0, 51.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r tap1R",
														"id" : "obj-353",
														"patching_rect" : [ 1996.0, 2237.0, 48.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-354",
														"patching_rect" : [ 1996.0, 2545.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.6",
														"id" : "obj-355",
														"patching_rect" : [ 2052.0, 2510.0, 33.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-356",
														"patching_rect" : [ 1996.0, 2484.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.6",
														"id" : "obj-357",
														"patching_rect" : [ 2052.0, 2453.0, 33.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-358",
														"patching_rect" : [ 1996.0, 2425.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.6",
														"id" : "obj-359",
														"patching_rect" : [ 2052.0, 2391.0, 33.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-360",
														"patching_rect" : [ 1996.0, 2364.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.6",
														"id" : "obj-361",
														"patching_rect" : [ 2052.0, 2330.0, 33.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.6",
														"id" : "obj-362",
														"patching_rect" : [ 2052.0, 2263.0, 33.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-363",
														"patching_rect" : [ 1996.0, 2303.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.6",
														"id" : "obj-364",
														"patching_rect" : [ 1996.0, 2263.0, 33.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "out 2",
														"id" : "obj-365",
														"patching_rect" : [ 1996.0, 2675.0, 35.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.10628",
														"id" : "obj-199",
														"patching_rect" : [ 1818.0, 2463.0, 60.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-205",
														"patching_rect" : [ 1818.0, 2493.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-209",
														"patching_rect" : [ 1818.0, 2434.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.124995",
														"id" : "obj-212",
														"patching_rect" : [ 1328.0, 2473.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-213",
														"patching_rect" : [ 1328.0, 2503.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-214",
														"patching_rect" : [ 1328.0, 2444.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.089244",
														"id" : "obj-215",
														"patching_rect" : [ 1866.0, 2248.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-216",
														"patching_rect" : [ 1866.0, 2278.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-217",
														"patching_rect" : [ 1866.0, 2219.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.060481",
														"id" : "obj-218",
														"patching_rect" : [ 1376.0, 2248.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-219",
														"patching_rect" : [ 1376.0, 2278.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-220",
														"patching_rect" : [ 1376.0, 2219.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.149625",
														"id" : "obj-221",
														"patching_rect" : [ 1328.0, 1987.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-222",
														"patching_rect" : [ 1328.0, 2017.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-223",
														"patching_rect" : [ 1328.0, 1958.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.141695",
														"id" : "obj-224",
														"patching_rect" : [ 1818.0, 1974.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-225",
														"patching_rect" : [ 1818.0, 2004.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-226",
														"patching_rect" : [ 1818.0, 1945.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.030509",
														"id" : "obj-227",
														"patching_rect" : [ 1969.0, 1703.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-228",
														"patching_rect" : [ 1969.0, 1733.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-229",
														"patching_rect" : [ 1969.0, 1674.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.0005",
														"id" : "obj-230",
														"patching_rect" : [ 1875.0, 1703.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-231",
														"patching_rect" : [ 1875.0, 1674.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "Excursion",
														"id" : "obj-232",
														"patching_rect" : [ 1855.0, 1565.0, 66.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-233",
														"patching_rect" : [ 1859.0, 1767.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-234",
														"patching_rect" : [ 1859.0, 1733.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "1",
														"id" : "obj-235",
														"patching_rect" : [ 1859.0, 1589.0, 19.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "cycle",
														"id" : "obj-236",
														"patching_rect" : [ 1859.0, 1646.0, 36.0, 22.0 ],
														"outlettype" : [ "", "" ],
														"numinlets" : 1,
														"numoutlets" : 2
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.022579",
														"id" : "obj-237",
														"patching_rect" : [ 1478.0, 1713.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-238",
														"patching_rect" : [ 1478.0, 1743.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-239",
														"patching_rect" : [ 1478.0, 1684.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.0005",
														"id" : "obj-240",
														"patching_rect" : [ 1385.0, 1713.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-241",
														"patching_rect" : [ 1385.0, 1684.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.009307",
														"id" : "obj-242",
														"patching_rect" : [ 1369.0, 1354.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-243",
														"patching_rect" : [ 1369.0, 1378.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-244",
														"patching_rect" : [ 1369.0, 1330.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.003595",
														"id" : "obj-245",
														"patching_rect" : [ 1295.0, 1008.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-246",
														"patching_rect" : [ 1295.0, 1032.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-247",
														"patching_rect" : [ 1295.0, 984.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.012734",
														"id" : "obj-248",
														"patching_rect" : [ 1369.0, 1176.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-249",
														"patching_rect" : [ 1369.0, 1200.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-250",
														"patching_rect" : [ 1369.0, 1152.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.004771",
														"id" : "obj-251",
														"patching_rect" : [ 1295.0, 822.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-252",
														"patching_rect" : [ 1295.0, 846.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-253",
														"patching_rect" : [ 1295.0, 798.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r decay",
														"id" : "obj-254",
														"patching_rect" : [ 1684.0, 2591.0, 48.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r decay",
														"id" : "obj-255",
														"patching_rect" : [ 1176.0, 2599.0, 48.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r decay",
														"id" : "obj-256",
														"patching_rect" : [ 1673.0, 2156.0, 48.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r decay",
														"id" : "obj-257",
														"patching_rect" : [ 1183.0, 2156.0, 48.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r decay_diffusion_2",
														"id" : "obj-258",
														"patching_rect" : [ 1230.0, 2352.0, 112.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r decay_diffusion_2",
														"id" : "obj-259",
														"patching_rect" : [ 1722.0, 2339.0, 112.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r decay_diffusion_1",
														"id" : "obj-260",
														"patching_rect" : [ 1716.0, 1835.0, 112.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r decay_diffusion_1",
														"id" : "obj-261",
														"patching_rect" : [ 1226.0, 1846.0, 112.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r tank1_out_R",
														"id" : "obj-262",
														"patching_rect" : [ 1669.0, 1703.0, 84.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r tank2_out_R",
														"id" : "obj-263",
														"patching_rect" : [ 1183.0, 1706.0, 84.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s tank2_out_R",
														"id" : "obj-264",
														"patching_rect" : [ 1645.0, 2675.0, 86.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s tank1_out_R",
														"id" : "obj-265",
														"patching_rect" : [ 1155.0, 2675.0, 86.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "Excursion",
														"id" : "obj-266",
														"patching_rect" : [ 1369.0, 1571.0, 66.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-267",
														"patching_rect" : [ 1369.0, 1777.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-268",
														"patching_rect" : [ 1369.0, 1743.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "0.9",
														"id" : "obj-269",
														"patching_rect" : [ 1369.0, 1597.0, 25.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "cycle",
														"id" : "obj-270",
														"patching_rect" : [ 1369.0, 1656.0, 36.0, 22.0 ],
														"outlettype" : [ "", "" ],
														"numinlets" : 1,
														"numoutlets" : 2
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*2",
														"id" : "obj-271",
														"patching_rect" : [ 1155.0, 511.0, 111.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r input_diffusion_2",
														"id" : "obj-272",
														"patching_rect" : [ 1232.0, 1436.0, 106.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r input_diffusion_2",
														"id" : "obj-273",
														"patching_rect" : [ 1232.0, 1262.0, 106.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r input_diffusion_1",
														"id" : "obj-274",
														"patching_rect" : [ 1232.0, 1090.0, 106.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r input_diffusion_1",
														"id" : "obj-275",
														"patching_rect" : [ 1232.0, 908.0, 106.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s tap6R",
														"id" : "obj-276",
														"patching_rect" : [ 1687.0, 2562.0, 50.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s tap5R",
														"id" : "obj-277",
														"patching_rect" : [ 1693.0, 2407.0, 50.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s tap4R",
														"id" : "obj-278",
														"patching_rect" : [ 1734.0, 2088.0, 50.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s tap3R",
														"id" : "obj-279",
														"patching_rect" : [ 1230.0, 2567.0, 50.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s tap2R",
														"id" : "obj-280",
														"patching_rect" : [ 1203.0, 2419.0, 50.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s tap1R",
														"id" : "obj-281",
														"patching_rect" : [ 1247.0, 2096.0, 50.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r damping",
														"id" : "obj-282",
														"patching_rect" : [ 1666.0, 2088.0, 62.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r damping",
														"id" : "obj-283",
														"patching_rect" : [ 1176.0, 2096.0, 62.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-284",
														"patching_rect" : [ 1645.0, 2626.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "decay diffusion 2",
														"id" : "obj-285",
														"patching_rect" : [ 1748.0, 2376.0, 150.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-286",
														"patching_rect" : [ 1693.0, 2374.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-287",
														"patching_rect" : [ 1645.0, 2374.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-288",
														"patching_rect" : [ 1645.0, 2407.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-289",
														"patching_rect" : [ 1645.0, 2307.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*10 @feedback 1",
														"id" : "obj-290",
														"patching_rect" : [ 1693.0, 2307.0, 192.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*15 @feedback 1",
														"id" : "obj-291",
														"patching_rect" : [ 1645.0, 2523.0, 192.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-292",
														"patching_rect" : [ 1645.0, 2182.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "decay diffusion 1",
														"id" : "obj-293",
														"patching_rect" : [ 1733.0, 1879.0, 150.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "Damping",
														"id" : "obj-294",
														"patching_rect" : [ 1758.0, 2116.0, 150.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "mix",
														"id" : "obj-295",
														"patching_rect" : [ 1645.0, 2115.0, 40.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 3,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "history",
														"id" : "obj-296",
														"patching_rect" : [ 1709.0, 2115.0, 44.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*15 @feedback 1",
														"id" : "obj-297",
														"patching_rect" : [ 1645.0, 2036.0, 192.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-298",
														"patching_rect" : [ 1693.0, 1878.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-299",
														"patching_rect" : [ 1645.0, 1878.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-300",
														"patching_rect" : [ 1645.0, 1911.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-301",
														"patching_rect" : [ 1645.0, 1800.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*6 @feedback 1",
														"id" : "obj-302",
														"patching_rect" : [ 1693.0, 1800.0, 185.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-303",
														"patching_rect" : [ 1155.0, 2635.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-304",
														"patching_rect" : [ 1645.0, 1741.0, 43.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "decay diffusion 2",
														"id" : "obj-305",
														"patching_rect" : [ 1258.0, 2388.0, 150.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-306",
														"patching_rect" : [ 1203.0, 2386.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-307",
														"patching_rect" : [ 1155.0, 2386.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-308",
														"patching_rect" : [ 1155.0, 2419.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-309",
														"patching_rect" : [ 1155.0, 2319.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*10 @feedback 1",
														"id" : "obj-310",
														"patching_rect" : [ 1203.0, 2319.0, 192.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*15 @feedback 1",
														"id" : "obj-311",
														"patching_rect" : [ 1155.0, 2535.0, 192.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-312",
														"patching_rect" : [ 1155.0, 2189.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "decay diffusion 1",
														"id" : "obj-313",
														"patching_rect" : [ 1243.0, 1891.0, 150.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "Damping",
														"id" : "obj-314",
														"patching_rect" : [ 1268.0, 2128.0, 150.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "mix",
														"id" : "obj-315",
														"patching_rect" : [ 1155.0, 2127.0, 40.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 3,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "history",
														"id" : "obj-316",
														"patching_rect" : [ 1219.0, 2127.0, 44.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*15 @feedback 1",
														"id" : "obj-317",
														"patching_rect" : [ 1155.0, 2048.0, 192.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-318",
														"patching_rect" : [ 1203.0, 1890.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-319",
														"patching_rect" : [ 1155.0, 1890.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-320",
														"patching_rect" : [ 1155.0, 1923.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-321",
														"patching_rect" : [ 1155.0, 1812.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*5 @feedback 1",
														"id" : "obj-322",
														"patching_rect" : [ 1203.0, 1812.0, 185.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-323",
														"patching_rect" : [ 1155.0, 1741.0, 47.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "input diffusion 2",
														"id" : "obj-324",
														"patching_rect" : [ 1258.0, 1468.0, 150.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "input diffusion 2",
														"id" : "obj-325",
														"patching_rect" : [ 1258.0, 1292.0, 150.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "input diffusion 1",
														"id" : "obj-326",
														"patching_rect" : [ 1250.0, 1121.0, 150.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "input diffusion 1",
														"id" : "obj-327",
														"patching_rect" : [ 1250.0, 943.0, 150.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-328",
														"patching_rect" : [ 1203.0, 1466.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-329",
														"patching_rect" : [ 1155.0, 1466.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-330",
														"patching_rect" : [ 1155.0, 1497.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-331",
														"patching_rect" : [ 1155.0, 1408.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*2 @feedback 1",
														"id" : "obj-332",
														"patching_rect" : [ 1203.0, 1408.0, 185.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-333",
														"patching_rect" : [ 1203.0, 1291.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-334",
														"patching_rect" : [ 1155.0, 1291.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-335",
														"patching_rect" : [ 1155.0, 1324.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-336",
														"patching_rect" : [ 1155.0, 1228.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*3 @feedback 1",
														"id" : "obj-337",
														"patching_rect" : [ 1203.0, 1228.0, 185.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-338",
														"patching_rect" : [ 1203.0, 1120.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-339",
														"patching_rect" : [ 1155.0, 1120.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-340",
														"patching_rect" : [ 1155.0, 1153.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-341",
														"patching_rect" : [ 1155.0, 1062.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay @feedback 1",
														"id" : "obj-342",
														"patching_rect" : [ 1203.0, 1062.0, 111.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-343",
														"patching_rect" : [ 1203.0, 942.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-344",
														"patching_rect" : [ 1155.0, 942.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-345",
														"patching_rect" : [ 1155.0, 970.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-346",
														"patching_rect" : [ 1155.0, 879.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay @feedback 1",
														"id" : "obj-366",
														"patching_rect" : [ 1203.0, 879.0, 111.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "Bandwidth",
														"id" : "obj-367",
														"patching_rect" : [ 1268.0, 578.0, 70.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "mix",
														"id" : "obj-371",
														"patching_rect" : [ 1155.0, 577.0, 40.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 3,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "history",
														"id" : "obj-373",
														"patching_rect" : [ 1219.0, 577.0, 44.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "in 2",
														"id" : "obj-374",
														"patching_rect" : [ 1155.0, 412.0, 28.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s input_reduction",
														"id" : "obj-138",
														"patching_rect" : [ 836.583277463912964, 295.0, 100.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "samplerate",
														"id" : "obj-112",
														"patching_rect" : [ 836.583277463912964, 161.0, 68.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "/",
														"id" : "obj-67",
														"patching_rect" : [ 836.583277463912964, 195.0, 132.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "f 3",
														"id" : "obj-64",
														"patching_rect" : [ 1017.583277463912964, 134.0, 22.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "samplerate",
														"id" : "obj-61",
														"patching_rect" : [ 983.583277463912964, 108.0, 68.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "scale 0. 1. 500",
														"id" : "obj-58",
														"patching_rect" : [ 949.583277463912964, 161.0, 87.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 3,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate_reduction",
														"id" : "obj-55",
														"patching_rect" : [ 949.583277463912964, 78.0, 138.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "mix 0.9995",
														"id" : "obj-45",
														"patching_rect" : [ 684.0, 180.0, 69.0, 22.0 ],
														"outlettype" : [ "" ],
														"fontsize" : 12.0,
														"numinlets" : 2,
														"fontname" : "Arial",
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "history",
														"id" : "obj-53",
														"patching_rect" : [ 684.0, 230.0, 44.0, 22.0 ],
														"outlettype" : [ "" ],
														"fontsize" : 12.0,
														"numinlets" : 1,
														"fontname" : "Arial",
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s predelay",
														"id" : "obj-43",
														"patching_rect" : [ 620.0, 295.0, 64.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-36",
														"patching_rect" : [ 620.0, 230.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "f 2",
														"id" : "obj-33",
														"patching_rect" : [ 620.0, 196.0, 22.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "mstosamps",
														"id" : "obj-30",
														"patching_rect" : [ 620.0, 260.0, 70.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "f 0.85",
														"id" : "obj-27",
														"patching_rect" : [ 343.0, 229.0, 39.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "f 0.85",
														"id" : "obj-24",
														"patching_rect" : [ 343.0, 129.0, 39.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "scale 0. 1. 0.75 0",
														"id" : "obj-210",
														"patching_rect" : [ 345.0, 65.0, 100.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate_reduction",
														"id" : "obj-211",
														"patching_rect" : [ 345.0, 33.0, 138.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s sample_rate_reduction",
														"id" : "obj-206",
														"patching_rect" : [ 54.0, 67.0, 140.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "latch",
														"id" : "obj-204",
														"patching_rect" : [ 54.0, 446.0, 68.75, 23.0 ],
														"outlettype" : [ "" ],
														"fontsize" : 12.0,
														"numinlets" : 2,
														"fontname" : "Lato",
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "mix 0.9995",
														"id" : "obj-200",
														"patching_rect" : [ 146.0, 214.0, 69.0, 22.0 ],
														"outlettype" : [ "" ],
														"fontsize" : 12.0,
														"numinlets" : 2,
														"fontname" : "Arial",
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "history",
														"id" : "obj-201",
														"patching_rect" : [ 146.0, 264.0, 44.0, 22.0 ],
														"outlettype" : [ "" ],
														"fontsize" : 12.0,
														"numinlets" : 1,
														"fontname" : "Arial",
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-195",
														"patching_rect" : [ 726.0, 2435.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-194",
														"patching_rect" : [ 227.0, 2443.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-193",
														"patching_rect" : [ 773.0, 2218.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-192",
														"patching_rect" : [ 277.0, 2231.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-191",
														"patching_rect" : [ 726.0, 1943.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-190",
														"patching_rect" : [ 227.0, 1958.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-188",
														"patching_rect" : [ 878.0, 1675.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-189",
														"patching_rect" : [ 782.0, 1675.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-187",
														"patching_rect" : [ 381.0, 1687.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-186",
														"patching_rect" : [ 285.0, 1687.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-184",
														"patching_rect" : [ 269.0, 1329.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-185",
														"patching_rect" : [ 194.0, 983.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-183",
														"patching_rect" : [ 269.0, 1153.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r sample_rate",
														"id" : "obj-182",
														"patching_rect" : [ 194.0, 798.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s sample_rate",
														"id" : "obj-181",
														"patching_rect" : [ 52.0, 295.0, 84.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-180",
														"patching_rect" : [ 52.0, 253.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "samplerate",
														"id" : "obj-179",
														"patching_rect" : [ 52.0, 214.0, 68.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "param sample_rate_reduction @min 0. @max 1.",
														"id" : "obj-178",
														"patching_rect" : [ 54.0, 33.0, 268.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r bandwidth",
														"id" : "obj-1",
														"patching_rect" : [ 75.0, 544.0, 71.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r predelay",
														"id" : "obj-2",
														"patching_rect" : [ 146.0, 480.0, 62.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "dcblock",
														"id" : "obj-3",
														"patching_rect" : [ 952.0, 2647.0, 49.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r tap6L",
														"id" : "obj-4",
														"patching_rect" : [ 1009.0, 2489.0, 46.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r tap5L",
														"id" : "obj-5",
														"patching_rect" : [ 1009.0, 2430.0, 46.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r tap4L",
														"id" : "obj-6",
														"patching_rect" : [ 1009.0, 2368.0, 46.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r tap3L",
														"id" : "obj-7",
														"patching_rect" : [ 1009.0, 2308.0, 46.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r tap2L",
														"id" : "obj-8",
														"patching_rect" : [ 1009.0, 2241.0, 46.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r tap1L",
														"id" : "obj-9",
														"patching_rect" : [ 952.0, 2241.0, 46.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-10",
														"patching_rect" : [ 952.0, 2549.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.6",
														"id" : "obj-11",
														"patching_rect" : [ 1009.0, 2516.0, 33.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-12",
														"patching_rect" : [ 952.0, 2489.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.6",
														"id" : "obj-13",
														"patching_rect" : [ 1009.0, 2458.0, 33.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-14",
														"patching_rect" : [ 952.0, 2430.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.6",
														"id" : "obj-15",
														"patching_rect" : [ 1009.0, 2395.0, 33.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-16",
														"patching_rect" : [ 952.0, 2368.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.6",
														"id" : "obj-17",
														"patching_rect" : [ 1009.0, 2335.0, 33.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.6",
														"id" : "obj-18",
														"patching_rect" : [ 1009.0, 2268.0, 33.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-19",
														"patching_rect" : [ 952.0, 2308.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.6",
														"id" : "obj-20",
														"patching_rect" : [ 952.0, 2268.0, 33.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "out 1",
														"id" : "obj-21",
														"patching_rect" : [ 952.0, 2676.0, 35.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.10628",
														"id" : "obj-22",
														"patching_rect" : [ 726.0, 2462.0, 60.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-23",
														"patching_rect" : [ 726.0, 2493.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.124995",
														"id" : "obj-25",
														"patching_rect" : [ 227.0, 2473.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-26",
														"patching_rect" : [ 227.0, 2504.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.089244",
														"id" : "obj-28",
														"patching_rect" : [ 773.0, 2248.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-29",
														"patching_rect" : [ 773.0, 2279.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.060481",
														"id" : "obj-31",
														"patching_rect" : [ 277.0, 2260.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-32",
														"patching_rect" : [ 277.0, 2289.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.149625",
														"id" : "obj-34",
														"patching_rect" : [ 227.0, 1987.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-35",
														"patching_rect" : [ 227.0, 2016.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.141695",
														"id" : "obj-37",
														"patching_rect" : [ 726.0, 1975.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-38",
														"patching_rect" : [ 726.0, 2004.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.030509",
														"id" : "obj-40",
														"patching_rect" : [ 878.0, 1704.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-41",
														"patching_rect" : [ 878.0, 1733.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.0005",
														"id" : "obj-44",
														"patching_rect" : [ 782.0, 1704.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "Excursion",
														"id" : "obj-46",
														"patching_rect" : [ 765.0, 1564.0, 66.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-47",
														"patching_rect" : [ 765.0, 1766.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-48",
														"patching_rect" : [ 765.0, 1733.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "1",
														"id" : "obj-49",
														"patching_rect" : [ 765.0, 1589.0, 19.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "cycle",
														"id" : "obj-50",
														"patching_rect" : [ 765.0, 1646.0, 36.0, 22.0 ],
														"outlettype" : [ "", "" ],
														"numinlets" : 1,
														"numoutlets" : 2
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.022579",
														"id" : "obj-51",
														"patching_rect" : [ 381.0, 1718.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-52",
														"patching_rect" : [ 381.0, 1748.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.0005",
														"id" : "obj-54",
														"patching_rect" : [ 285.0, 1718.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.009307",
														"id" : "obj-56",
														"patching_rect" : [ 269.0, 1354.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-57",
														"patching_rect" : [ 269.0, 1377.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.003595",
														"id" : "obj-59",
														"patching_rect" : [ 194.0, 1008.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-60",
														"patching_rect" : [ 194.0, 1031.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.012734",
														"id" : "obj-62",
														"patching_rect" : [ 269.0, 1176.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-63",
														"patching_rect" : [ 269.0, 1201.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.004771",
														"id" : "obj-65",
														"patching_rect" : [ 194.0, 821.0, 67.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "trunc",
														"id" : "obj-66",
														"patching_rect" : [ 194.0, 846.0, 35.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r decay",
														"id" : "obj-68",
														"patching_rect" : [ 590.0, 2591.0, 48.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r decay",
														"id" : "obj-69",
														"patching_rect" : [ 77.0, 2600.0, 48.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r decay",
														"id" : "obj-70",
														"patching_rect" : [ 580.0, 2156.0, 48.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r decay",
														"id" : "obj-71",
														"patching_rect" : [ 83.0, 2156.0, 48.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r decay_diffusion_2",
														"id" : "obj-72",
														"patching_rect" : [ 129.0, 2352.0, 112.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r decay_diffusion_2",
														"id" : "obj-73",
														"patching_rect" : [ 630.0, 2339.0, 112.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r decay_diffusion_1",
														"id" : "obj-74",
														"patching_rect" : [ 623.0, 1835.0, 112.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r decay_diffusion_1",
														"id" : "obj-75",
														"patching_rect" : [ 127.0, 1846.0, 112.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r tank1_out_L",
														"id" : "obj-76",
														"patching_rect" : [ 578.0, 1706.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r tank2_out_L",
														"id" : "obj-77",
														"patching_rect" : [ 75.0, 1706.0, 82.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s tank2_out_L",
														"id" : "obj-78",
														"patching_rect" : [ 553.0, 2675.0, 84.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s tank1_out_L",
														"id" : "obj-79",
														"patching_rect" : [ 54.0, 2675.0, 84.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "Excursion",
														"id" : "obj-80",
														"patching_rect" : [ 268.0, 1579.0, 66.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-81",
														"patching_rect" : [ 268.0, 1781.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-82",
														"patching_rect" : [ 268.0, 1748.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "0.9",
														"id" : "obj-83",
														"patching_rect" : [ 268.0, 1604.0, 25.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "cycle",
														"id" : "obj-84",
														"patching_rect" : [ 268.0, 1660.0, 36.0, 22.0 ],
														"outlettype" : [ "", "" ],
														"numinlets" : 1,
														"numoutlets" : 2
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*2",
														"id" : "obj-85",
														"patching_rect" : [ 54.0, 511.0, 111.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r input_diffusion_2",
														"id" : "obj-86",
														"patching_rect" : [ 131.0, 1435.0, 106.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r input_diffusion_2",
														"id" : "obj-87",
														"patching_rect" : [ 131.0, 1263.0, 106.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r input_diffusion_1",
														"id" : "obj-88",
														"patching_rect" : [ 131.0, 1089.0, 106.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r input_diffusion_1",
														"id" : "obj-89",
														"patching_rect" : [ 131.0, 908.0, 106.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s tap3L",
														"id" : "obj-90",
														"patching_rect" : [ 594.0, 2562.0, 48.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s tap2L",
														"id" : "obj-91",
														"patching_rect" : [ 601.0, 2406.0, 48.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s tap1L",
														"id" : "obj-92",
														"patching_rect" : [ 640.0, 2087.0, 48.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s tap6L",
														"id" : "obj-93",
														"patching_rect" : [ 129.0, 2566.0, 48.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s tap5L",
														"id" : "obj-94",
														"patching_rect" : [ 102.0, 2418.0, 48.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s tap4L",
														"id" : "obj-95",
														"patching_rect" : [ 148.0, 2096.0, 48.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r damping",
														"id" : "obj-97",
														"patching_rect" : [ 573.0, 2087.0, 62.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "r damping",
														"id" : "obj-98",
														"patching_rect" : [ 77.0, 2096.0, 62.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-99",
														"patching_rect" : [ 553.0, 2627.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "decay diffusion 2",
														"id" : "obj-100",
														"patching_rect" : [ 655.0, 2377.0, 150.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-101",
														"patching_rect" : [ 601.0, 2375.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-102",
														"patching_rect" : [ 553.0, 2375.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-103",
														"patching_rect" : [ 553.0, 2406.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-104",
														"patching_rect" : [ 553.0, 2306.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*10 @feedback 1",
														"id" : "obj-105",
														"patching_rect" : [ 601.0, 2306.0, 192.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*15 @feedback 1",
														"id" : "obj-106",
														"patching_rect" : [ 553.0, 2523.0, 192.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-107",
														"patching_rect" : [ 553.0, 2181.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "decay diffusion 1",
														"id" : "obj-108",
														"patching_rect" : [ 640.0, 1879.0, 150.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "Damping",
														"id" : "obj-109",
														"patching_rect" : [ 665.0, 2116.0, 150.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "mix",
														"id" : "obj-110",
														"patching_rect" : [ 553.0, 2114.0, 40.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 3,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "history",
														"id" : "obj-113",
														"patching_rect" : [ 615.0, 2114.0, 44.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*15 @feedback 1",
														"id" : "obj-116",
														"patching_rect" : [ 553.0, 2035.0, 192.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-117",
														"patching_rect" : [ 601.0, 1879.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-118",
														"patching_rect" : [ 553.0, 1879.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-119",
														"patching_rect" : [ 553.0, 1910.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-120",
														"patching_rect" : [ 553.0, 1800.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*6 @feedback 1",
														"id" : "obj-122",
														"patching_rect" : [ 601.0, 1800.0, 185.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-123",
														"patching_rect" : [ 54.0, 2635.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-124",
														"patching_rect" : [ 553.0, 1741.0, 44.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "decay diffusion 2",
														"id" : "obj-125",
														"patching_rect" : [ 158.0, 2387.0, 150.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-126",
														"patching_rect" : [ 102.0, 2385.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-127",
														"patching_rect" : [ 54.0, 2385.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-128",
														"patching_rect" : [ 54.0, 2418.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-129",
														"patching_rect" : [ 54.0, 2318.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*10 @feedback 1",
														"id" : "obj-130",
														"patching_rect" : [ 102.0, 2318.0, 192.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*15 @feedback 1",
														"id" : "obj-131",
														"patching_rect" : [ 54.0, 2535.0, 192.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-132",
														"patching_rect" : [ 54.0, 2189.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "decay diffusion 1",
														"id" : "obj-133",
														"patching_rect" : [ 143.0, 1891.0, 150.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "Damping",
														"id" : "obj-134",
														"patching_rect" : [ 168.0, 2129.0, 150.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "mix",
														"id" : "obj-139",
														"patching_rect" : [ 54.0, 2127.0, 40.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 3,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "history",
														"id" : "obj-140",
														"patching_rect" : [ 118.0, 2127.0, 44.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*15 @feedback 1",
														"id" : "obj-141",
														"patching_rect" : [ 54.0, 2048.0, 192.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-142",
														"patching_rect" : [ 102.0, 1889.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-143",
														"patching_rect" : [ 54.0, 1889.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-144",
														"patching_rect" : [ 54.0, 1923.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-145",
														"patching_rect" : [ 54.0, 1812.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*5 @feedback 1",
														"id" : "obj-146",
														"patching_rect" : [ 102.0, 1812.0, 185.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-147",
														"patching_rect" : [ 54.0, 1741.0, 40.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "input diffusion 2",
														"id" : "obj-148",
														"patching_rect" : [ 156.0, 1466.0, 150.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "input diffusion 2",
														"id" : "obj-151",
														"patching_rect" : [ 156.0, 1293.0, 150.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "input diffusion 1",
														"id" : "obj-152",
														"patching_rect" : [ 150.0, 1120.0, 150.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "input diffusion 1",
														"id" : "obj-153",
														"patching_rect" : [ 150.0, 944.0, 150.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-154",
														"patching_rect" : [ 102.0, 1464.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-155",
														"patching_rect" : [ 54.0, 1464.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-156",
														"patching_rect" : [ 54.0, 1497.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-157",
														"patching_rect" : [ 54.0, 1408.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*2 @feedback 1",
														"id" : "obj-158",
														"patching_rect" : [ 102.0, 1408.0, 185.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-159",
														"patching_rect" : [ 102.0, 1293.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-160",
														"patching_rect" : [ 54.0, 1293.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-161",
														"patching_rect" : [ 54.0, 1324.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-162",
														"patching_rect" : [ 54.0, 1228.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay samplerate*3 @feedback 1",
														"id" : "obj-163",
														"patching_rect" : [ 102.0, 1228.0, 185.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-164",
														"patching_rect" : [ 102.0, 1118.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-165",
														"patching_rect" : [ 54.0, 1118.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-166",
														"patching_rect" : [ 54.0, 1151.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-167",
														"patching_rect" : [ 54.0, 1062.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay @feedback 1",
														"id" : "obj-168",
														"patching_rect" : [ 102.0, 1062.0, 111.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-169",
														"patching_rect" : [ 102.0, 942.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "*",
														"id" : "obj-170",
														"patching_rect" : [ 54.0, 942.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "+",
														"id" : "obj-171",
														"patching_rect" : [ 54.0, 969.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "-",
														"id" : "obj-172",
														"patching_rect" : [ 54.0, 879.0, 29.5, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "delay @feedback 1",
														"id" : "obj-173",
														"patching_rect" : [ 102.0, 879.0, 111.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 2,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "comment",
														"text" : "Bandwidth",
														"id" : "obj-174",
														"patching_rect" : [ 166.0, 577.0, 71.0, 20.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "mix",
														"id" : "obj-175",
														"patching_rect" : [ 54.0, 577.0, 40.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 3,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "history",
														"id" : "obj-176",
														"patching_rect" : [ 119.0, 577.0, 44.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "in 1",
														"id" : "obj-177",
														"patching_rect" : [ 54.0, 412.0, 28.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s bandwidth",
														"id" : "obj-370",
														"patching_rect" : [ 422.0, 99.0, 73.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s decay",
														"id" : "obj-149",
														"patching_rect" : [ 52.0, 128.0, 50.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "param decay @default 0.5 @min 0. @max 0.95",
														"id" : "obj-150",
														"patching_rect" : [ 52.0, 96.0, 262.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 0,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.7143",
														"id" : "obj-135",
														"patching_rect" : [ 461.0, 264.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s decay_diffusion_2",
														"id" : "obj-136",
														"patching_rect" : [ 461.0, 295.0, 114.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s decay_diffusion_1",
														"id" : "obj-137",
														"patching_rect" : [ 343.0, 295.0, 114.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "* 0.8333",
														"id" : "obj-114",
														"patching_rect" : [ 461.0, 158.0, 53.0, 22.0 ],
														"outlettype" : [ "" ],
														"numinlets" : 1,
														"numoutlets" : 1
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s input_diffusion_2",
														"id" : "obj-115",
														"patching_rect" : [ 461.0, 189.0, 108.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s input_diffusion_1",
														"id" : "obj-111",
														"patching_rect" : [ 343.0, 189.0, 108.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
, 												{
													"box" : 													{
														"maxclass" : "newobj",
														"text" : "s damping",
														"id" : "obj-96",
														"patching_rect" : [ 345.0, 99.0, 64.0, 22.0 ],
														"numinlets" : 1,
														"numoutlets" : 0
													}

												}
 ],
											"lines" : [ 												{
													"patchline" : 													{
														"source" : [ "obj-483", 0 ],
														"destination" : [ "obj-236", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-235", 0 ],
														"destination" : [ "obj-483", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-482", 0 ],
														"destination" : [ "obj-483", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-481", 0 ],
														"destination" : [ "obj-270", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-269", 0 ],
														"destination" : [ "obj-481", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-480", 0 ],
														"destination" : [ "obj-481", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-479", 0 ],
														"destination" : [ "obj-50", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-49", 0 ],
														"destination" : [ "obj-479", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-478", 0 ],
														"destination" : [ "obj-479", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-476", 0 ],
														"destination" : [ "obj-84", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-83", 0 ],
														"destination" : [ "obj-476", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-477", 0 ],
														"destination" : [ "obj-476", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-474", 0 ],
														"destination" : [ "obj-475", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-58", 0 ],
														"destination" : [ "obj-474", 0 ],
														"midpoints" : [ 959.083277463912964, 192.0, 1088.0, 192.0, 1088.0, 222.0, 1088.5, 222.0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-354", 0 ],
														"destination" : [ "obj-382", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-10", 0 ],
														"destination" : [ "obj-369", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-156", 0 ],
														"destination" : [ "obj-467", 0 ],
														"midpoints" : [ 63.5, 1584.0, 100.0, 1584.0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-330", 0 ],
														"destination" : [ "obj-468", 0 ],
														"midpoints" : [ 1164.5, 1570.0, 1192.5, 1570.0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-468", 0 ],
														"destination" : [ "obj-469", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-467", 0 ],
														"destination" : [ "obj-466", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-447", 0 ],
														"destination" : [ "obj-428", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-430", 0 ],
														"destination" : [ "obj-447", 0 ],
														"midpoints" : [ 1964.5, 716.0, 1304.5, 716.0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-431", 0 ],
														"destination" : [ "obj-447", 0 ],
														"midpoints" : [ 1891.5, 716.0, 1304.5, 716.0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-432", 0 ],
														"destination" : [ "obj-447", 0 ],
														"midpoints" : [ 1817.5, 716.0, 1304.5, 716.0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-433", 0 ],
														"destination" : [ "obj-447", 0 ],
														"midpoints" : [ 1744.5, 716.0, 1304.5, 716.0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-442", 0 ],
														"destination" : [ "obj-447", 0 ],
														"midpoints" : [ 1671.5, 714.0, 1304.5, 714.0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-443", 0 ],
														"destination" : [ "obj-447", 0 ],
														"midpoints" : [ 1597.5, 714.0, 1304.5, 714.0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-444", 0 ],
														"destination" : [ "obj-447", 0 ],
														"midpoints" : [ 1524.5, 714.0, 1304.5, 714.0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-445", 0 ],
														"destination" : [ "obj-447", 0 ],
														"midpoints" : [ 1451.5, 714.0, 1304.5, 714.0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-446", 0 ],
														"destination" : [ "obj-447", 0 ],
														"midpoints" : [ 1377.5, 714.0, 1304.5, 714.0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-429", 0 ],
														"destination" : [ "obj-447", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-399", 0 ],
														"destination" : [ "obj-463", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-425", 0 ],
														"destination" : [ "obj-399", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-400", 0 ],
														"destination" : [ "obj-399", 0 ],
														"midpoints" : [ 276.5, 712.250007390975952, 203.5, 712.250007390975952 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-401", 0 ],
														"destination" : [ "obj-399", 0 ],
														"midpoints" : [ 351.5, 712.250007390975952, 203.5, 712.250007390975952 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-402", 0 ],
														"destination" : [ "obj-399", 0 ],
														"midpoints" : [ 423.5, 712.250007390975952, 203.5, 712.250007390975952 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-403", 0 ],
														"destination" : [ "obj-399", 0 ],
														"midpoints" : [ 496.5, 712.250007390975952, 203.5, 712.250007390975952 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-404", 0 ],
														"destination" : [ "obj-399", 0 ],
														"midpoints" : [ 569.5, 712.250007390975952, 203.5, 712.250007390975952 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-424", 0 ],
														"destination" : [ "obj-399", 0 ],
														"midpoints" : [ 642.5, 714.250007390975952, 203.5, 714.250007390975952 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-423", 0 ],
														"destination" : [ "obj-399", 0 ],
														"midpoints" : [ 717.5, 714.250007390975952, 203.5, 714.250007390975952 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-422", 0 ],
														"destination" : [ "obj-399", 0 ],
														"midpoints" : [ 790.5, 714.250007390975952, 203.5, 714.250007390975952 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-421", 0 ],
														"destination" : [ "obj-399", 0 ],
														"midpoints" : [ 863.5, 714.250007390975952, 203.5, 714.250007390975952 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-437", 0 ],
														"destination" : [ "obj-436", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-448", 0 ],
														"destination" : [ "obj-437", 0 ],
														"midpoints" : [ 1370.5, 572.0, 1898.5, 572.0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-439", 0 ],
														"destination" : [ "obj-438", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-448", 0 ],
														"destination" : [ "obj-439", 0 ],
														"midpoints" : [ 1370.5, 572.0, 1832.5, 572.0 ],
														"order" : 2
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-441", 0 ],
														"destination" : [ "obj-440", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-448", 0 ],
														"destination" : [ "obj-441", 0 ],
														"midpoints" : [ 1370.5, 572.0, 1766.5, 572.0 ],
														"order" : 3
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-448", 0 ],
														"destination" : [ "obj-454", 0 ],
														"midpoints" : [ 1370.5, 573.0, 1568.5, 573.0 ],
														"order" : 6
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-454", 0 ],
														"destination" : [ "obj-453", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-448", 0 ],
														"destination" : [ "obj-456", 0 ],
														"midpoints" : [ 1370.5, 573.0, 1502.5, 573.0 ],
														"order" : 7
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-456", 0 ],
														"destination" : [ "obj-455", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-406", 0 ],
														"destination" : [ "obj-369", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-462", 0 ],
														"destination" : [ "obj-382", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-448", 0 ],
														"destination" : [ "obj-460", 0 ],
														"order" : 9
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-460", 0 ],
														"destination" : [ "obj-459", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-458", 0 ],
														"destination" : [ "obj-457", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-448", 0 ],
														"destination" : [ "obj-458", 0 ],
														"midpoints" : [ 1370.5, 573.0, 1436.5, 573.0 ],
														"order" : 8
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-452", 0 ],
														"destination" : [ "obj-451", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-448", 0 ],
														"destination" : [ "obj-452", 0 ],
														"midpoints" : [ 1370.5, 573.0, 1634.5, 573.0 ],
														"order" : 5
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-450", 0 ],
														"destination" : [ "obj-449", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-448", 0 ],
														"destination" : [ "obj-450", 0 ],
														"midpoints" : [ 1370.5, 573.0, 1700.5, 573.0 ],
														"order" : 4
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-448", 0 ],
														"destination" : [ "obj-435", 0 ],
														"midpoints" : [ 1370.5, 572.0, 1964.5, 572.0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-435", 0 ],
														"destination" : [ "obj-434", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-461", 9 ],
														"destination" : [ "obj-430", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-461", 8 ],
														"destination" : [ "obj-431", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-461", 7 ],
														"destination" : [ "obj-432", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-461", 6 ],
														"destination" : [ "obj-433", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-461", 5 ],
														"destination" : [ "obj-442", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-461", 4 ],
														"destination" : [ "obj-443", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-461", 3 ],
														"destination" : [ "obj-444", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-461", 2 ],
														"destination" : [ "obj-445", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-461", 1 ],
														"destination" : [ "obj-446", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-461", 0 ],
														"destination" : [ "obj-429", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-459", 0 ],
														"destination" : [ "obj-461", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-457", 0 ],
														"destination" : [ "obj-461", 2 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-455", 0 ],
														"destination" : [ "obj-461", 3 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-453", 0 ],
														"destination" : [ "obj-461", 4 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-451", 0 ],
														"destination" : [ "obj-461", 5 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-449", 0 ],
														"destination" : [ "obj-461", 6 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-440", 0 ],
														"destination" : [ "obj-461", 7 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-438", 0 ],
														"destination" : [ "obj-461", 8 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-436", 0 ],
														"destination" : [ "obj-461", 9 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-434", 0 ],
														"destination" : [ "obj-461", 10 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-412", 0 ],
														"destination" : [ "obj-375", 10 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-414", 0 ],
														"destination" : [ "obj-375", 9 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-416", 0 ],
														"destination" : [ "obj-375", 8 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-418", 0 ],
														"destination" : [ "obj-375", 7 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-394", 0 ],
														"destination" : [ "obj-375", 6 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-396", 0 ],
														"destination" : [ "obj-375", 5 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-386", 0 ],
														"destination" : [ "obj-375", 4 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-388", 0 ],
														"destination" : [ "obj-375", 3 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-381", 0 ],
														"destination" : [ "obj-375", 2 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-380", 0 ],
														"destination" : [ "obj-375", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-375", 0 ],
														"destination" : [ "obj-425", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-375", 1 ],
														"destination" : [ "obj-400", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-375", 2 ],
														"destination" : [ "obj-401", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-375", 3 ],
														"destination" : [ "obj-402", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-375", 4 ],
														"destination" : [ "obj-403", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-375", 5 ],
														"destination" : [ "obj-404", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-375", 6 ],
														"destination" : [ "obj-424", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-375", 7 ],
														"destination" : [ "obj-423", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-375", 8 ],
														"destination" : [ "obj-422", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-375", 9 ],
														"destination" : [ "obj-421", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-413", 0 ],
														"destination" : [ "obj-412", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-398", 0 ],
														"destination" : [ "obj-413", 0 ],
														"midpoints" : [ 269.5, 570.250007390975952, 863.5, 570.250007390975952 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-415", 0 ],
														"destination" : [ "obj-414", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-398", 0 ],
														"destination" : [ "obj-415", 0 ],
														"midpoints" : [ 269.5, 570.250007390975952, 796.5, 570.250007390975952 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-417", 0 ],
														"destination" : [ "obj-416", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-398", 0 ],
														"destination" : [ "obj-417", 0 ],
														"midpoints" : [ 269.5, 570.250007390975952, 732.5, 570.250007390975952 ],
														"order" : 2
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-419", 0 ],
														"destination" : [ "obj-418", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-398", 0 ],
														"destination" : [ "obj-419", 0 ],
														"midpoints" : [ 269.5, 570.250007390975952, 665.5, 570.250007390975952 ],
														"order" : 3
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-398", 0 ],
														"destination" : [ "obj-395", 0 ],
														"midpoints" : [ 269.5, 571.250007390975952, 598.5, 571.250007390975952 ],
														"order" : 4
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-395", 0 ],
														"destination" : [ "obj-394", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-398", 0 ],
														"destination" : [ "obj-397", 0 ],
														"midpoints" : [ 269.5, 571.250007390975952, 534.5, 571.250007390975952 ],
														"order" : 5
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-397", 0 ],
														"destination" : [ "obj-396", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-398", 0 ],
														"destination" : [ "obj-387", 0 ],
														"midpoints" : [ 269.5, 571.250007390975952, 467.5, 571.250007390975952 ],
														"order" : 6
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-387", 0 ],
														"destination" : [ "obj-386", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-398", 0 ],
														"destination" : [ "obj-389", 0 ],
														"midpoints" : [ 269.5, 571.250007390975952, 401.5, 571.250007390975952 ],
														"order" : 7
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-389", 0 ],
														"destination" : [ "obj-388", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-398", 0 ],
														"destination" : [ "obj-385", 0 ],
														"midpoints" : [ 269.5, 571.250007390975952, 336.5, 571.250007390975952 ],
														"order" : 8
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-385", 0 ],
														"destination" : [ "obj-381", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-379", 0 ],
														"destination" : [ "obj-380", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-398", 0 ],
														"destination" : [ "obj-379", 0 ],
														"order" : 9
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-205", 0 ],
														"destination" : [ "obj-291", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-288", 0 ],
														"destination" : [ "obj-291", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-291", 0 ],
														"destination" : [ "obj-276", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-291", 0 ],
														"destination" : [ "obj-284", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-213", 0 ],
														"destination" : [ "obj-311", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-308", 0 ],
														"destination" : [ "obj-311", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-311", 0 ],
														"destination" : [ "obj-279", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-311", 0 ],
														"destination" : [ "obj-303", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-103", 0 ],
														"destination" : [ "obj-106", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-106", 0 ],
														"destination" : [ "obj-90", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-106", 0 ],
														"destination" : [ "obj-99", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-23", 0 ],
														"destination" : [ "obj-106", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-128", 0 ],
														"destination" : [ "obj-131", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-131", 0 ],
														"destination" : [ "obj-123", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-131", 0 ],
														"destination" : [ "obj-93", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-26", 0 ],
														"destination" : [ "obj-131", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-216", 0 ],
														"destination" : [ "obj-290", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-289", 0 ],
														"destination" : [ "obj-290", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-290", 0 ],
														"destination" : [ "obj-277", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-290", 0 ],
														"destination" : [ "obj-286", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-290", 0 ],
														"destination" : [ "obj-288", 1 ],
														"order" : 2
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-219", 0 ],
														"destination" : [ "obj-310", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-309", 0 ],
														"destination" : [ "obj-310", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-310", 0 ],
														"destination" : [ "obj-280", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-310", 0 ],
														"destination" : [ "obj-306", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-310", 0 ],
														"destination" : [ "obj-308", 1 ],
														"order" : 2
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-104", 0 ],
														"destination" : [ "obj-105", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-105", 0 ],
														"destination" : [ "obj-101", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-105", 0 ],
														"destination" : [ "obj-103", 1 ],
														"order" : 2
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-105", 0 ],
														"destination" : [ "obj-91", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-29", 0 ],
														"destination" : [ "obj-105", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-129", 0 ],
														"destination" : [ "obj-130", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-130", 0 ],
														"destination" : [ "obj-126", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-130", 0 ],
														"destination" : [ "obj-128", 1 ],
														"order" : 2
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-130", 0 ],
														"destination" : [ "obj-94", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-32", 0 ],
														"destination" : [ "obj-130", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-300", 0 ],
														"destination" : [ "obj-297", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-297", 0 ],
														"destination" : [ "obj-295", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-297", 0 ],
														"destination" : [ "obj-278", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-225", 0 ],
														"destination" : [ "obj-297", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-320", 0 ],
														"destination" : [ "obj-317", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-317", 0 ],
														"destination" : [ "obj-315", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-317", 0 ],
														"destination" : [ "obj-281", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-222", 0 ],
														"destination" : [ "obj-317", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-116", 0 ],
														"destination" : [ "obj-110", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-116", 0 ],
														"destination" : [ "obj-92", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-119", 0 ],
														"destination" : [ "obj-116", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-38", 0 ],
														"destination" : [ "obj-116", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-35", 0 ],
														"destination" : [ "obj-141", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-144", 0 ],
														"destination" : [ "obj-141", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-141", 0 ],
														"destination" : [ "obj-95", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-141", 0 ],
														"destination" : [ "obj-139", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-233", 0 ],
														"destination" : [ "obj-302", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-301", 0 ],
														"destination" : [ "obj-302", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-302", 0 ],
														"destination" : [ "obj-298", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-302", 0 ],
														"destination" : [ "obj-300", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-120", 0 ],
														"destination" : [ "obj-122", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-122", 0 ],
														"destination" : [ "obj-117", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-122", 0 ],
														"destination" : [ "obj-119", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-47", 0 ],
														"destination" : [ "obj-122", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-267", 0 ],
														"destination" : [ "obj-322", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-321", 0 ],
														"destination" : [ "obj-322", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-322", 0 ],
														"destination" : [ "obj-318", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-322", 0 ],
														"destination" : [ "obj-320", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-145", 0 ],
														"destination" : [ "obj-146", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-146", 0 ],
														"destination" : [ "obj-142", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-146", 0 ],
														"destination" : [ "obj-144", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-81", 0 ],
														"destination" : [ "obj-146", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-243", 0 ],
														"destination" : [ "obj-332", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-331", 0 ],
														"destination" : [ "obj-332", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-332", 0 ],
														"destination" : [ "obj-328", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-332", 0 ],
														"destination" : [ "obj-330", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-57", 0 ],
														"destination" : [ "obj-158", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-158", 0 ],
														"destination" : [ "obj-156", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-158", 0 ],
														"destination" : [ "obj-154", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-157", 0 ],
														"destination" : [ "obj-158", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-249", 0 ],
														"destination" : [ "obj-337", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-336", 0 ],
														"destination" : [ "obj-337", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-337", 0 ],
														"destination" : [ "obj-333", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-337", 0 ],
														"destination" : [ "obj-335", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-162", 0 ],
														"destination" : [ "obj-163", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-163", 0 ],
														"destination" : [ "obj-159", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-163", 0 ],
														"destination" : [ "obj-161", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-63", 0 ],
														"destination" : [ "obj-163", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-203", 0 ],
														"destination" : [ "obj-382", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-202", 0 ],
														"destination" : [ "obj-369", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-196", 0 ],
														"destination" : [ "obj-378", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-42", 0 ],
														"destination" : [ "obj-204", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-377", 1 ],
														"destination" : [ "obj-39", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-67", 0 ],
														"destination" : [ "obj-377", 2 ],
														"midpoints" : [ 846.083277463912964, 227.0, 991.083277463912964, 227.0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-64", 0 ],
														"destination" : [ "obj-58", 2 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-61", 0 ],
														"destination" : [ "obj-58", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-58", 0 ],
														"destination" : [ "obj-67", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-55", 0 ],
														"destination" : [ "obj-58", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-2", 0 ],
														"destination" : [ "obj-85", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-378", 0 ],
														"destination" : [ "obj-271", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-368", 0 ],
														"destination" : [ "obj-271", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-271", 0 ],
														"destination" : [ "obj-371", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-204", 0 ],
														"destination" : [ "obj-85", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-85", 0 ],
														"destination" : [ "obj-175", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-33", 0 ],
														"destination" : [ "obj-36", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-382", 0 ],
														"destination" : [ "obj-347", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-369", 0 ],
														"destination" : [ "obj-3", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-210", 0 ],
														"destination" : [ "obj-370", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-210", 0 ],
														"destination" : [ "obj-96", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-211", 0 ],
														"destination" : [ "obj-210", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-99", 0 ],
														"destination" : [ "obj-78", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-98", 0 ],
														"destination" : [ "obj-139", 2 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-97", 0 ],
														"destination" : [ "obj-110", 2 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-9", 0 ],
														"destination" : [ "obj-20", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-89", 0 ],
														"destination" : [ "obj-170", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-89", 0 ],
														"destination" : [ "obj-169", 1 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-88", 0 ],
														"destination" : [ "obj-165", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-88", 0 ],
														"destination" : [ "obj-164", 1 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-87", 0 ],
														"destination" : [ "obj-160", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-87", 0 ],
														"destination" : [ "obj-159", 1 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-86", 0 ],
														"destination" : [ "obj-155", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-86", 0 ],
														"destination" : [ "obj-154", 1 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-84", 0 ],
														"destination" : [ "obj-82", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-82", 0 ],
														"destination" : [ "obj-81", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-8", 0 ],
														"destination" : [ "obj-18", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-77", 0 ],
														"destination" : [ "obj-147", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-76", 0 ],
														"destination" : [ "obj-124", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-75", 0 ],
														"destination" : [ "obj-143", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-75", 0 ],
														"destination" : [ "obj-142", 1 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-74", 0 ],
														"destination" : [ "obj-118", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-74", 0 ],
														"destination" : [ "obj-117", 1 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-73", 0 ],
														"destination" : [ "obj-102", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-73", 0 ],
														"destination" : [ "obj-101", 1 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-72", 0 ],
														"destination" : [ "obj-127", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-72", 0 ],
														"destination" : [ "obj-126", 1 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-71", 0 ],
														"destination" : [ "obj-132", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-70", 0 ],
														"destination" : [ "obj-107", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-7", 0 ],
														"destination" : [ "obj-17", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-69", 0 ],
														"destination" : [ "obj-123", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-68", 0 ],
														"destination" : [ "obj-99", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-67", 0 ],
														"destination" : [ "obj-138", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-66", 0 ],
														"destination" : [ "obj-173", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-65", 0 ],
														"destination" : [ "obj-66", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-62", 0 ],
														"destination" : [ "obj-63", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-60", 0 ],
														"destination" : [ "obj-168", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-6", 0 ],
														"destination" : [ "obj-15", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-59", 0 ],
														"destination" : [ "obj-60", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-56", 0 ],
														"destination" : [ "obj-57", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-54", 0 ],
														"destination" : [ "obj-82", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-53", 0 ],
														"destination" : [ "obj-45", 1 ],
														"midpoints" : [ 693.5, 252.0, 670.0, 252.0, 670.0, 165.0, 743.5, 165.0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-52", 0 ],
														"destination" : [ "obj-81", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-51", 0 ],
														"destination" : [ "obj-52", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-50", 0 ],
														"destination" : [ "obj-48", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-5", 0 ],
														"destination" : [ "obj-13", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-48", 0 ],
														"destination" : [ "obj-47", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-45", 0 ],
														"destination" : [ "obj-53", 0 ],
														"midpoints" : [ 693.5, 201.0, 693.5, 201.0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-45", 0 ],
														"destination" : [ "obj-36", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-44", 0 ],
														"destination" : [ "obj-48", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-41", 0 ],
														"destination" : [ "obj-47", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-40", 0 ],
														"destination" : [ "obj-41", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-4", 0 ],
														"destination" : [ "obj-11", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-376", 0 ],
														"destination" : [ "obj-377", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-374", 0 ],
														"destination" : [ "obj-378", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-373", 0 ],
														"destination" : [ "obj-371", 1 ],
														"midpoints" : [ 1228.5, 607.0, 1206.0, 607.0, 1206.0, 573.0, 1175.0, 573.0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-372", 0 ],
														"destination" : [ "obj-371", 2 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-371", 0 ],
														"destination" : [ "obj-373", 0 ],
														"midpoints" : [ 1164.5, 609.0, 1206.0, 609.0, 1206.0, 573.0, 1228.5, 573.0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-371", 0 ],
														"destination" : [ "obj-346", 0 ],
														"order" : 2
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-37", 0 ],
														"destination" : [ "obj-38", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-366", 0 ],
														"destination" : [ "obj-345", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-366", 0 ],
														"destination" : [ "obj-343", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-364", 0 ],
														"destination" : [ "obj-363", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-363", 0 ],
														"destination" : [ "obj-360", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-362", 0 ],
														"destination" : [ "obj-363", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-361", 0 ],
														"destination" : [ "obj-360", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-360", 0 ],
														"destination" : [ "obj-358", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-36", 0 ],
														"destination" : [ "obj-30", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-359", 0 ],
														"destination" : [ "obj-358", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-358", 0 ],
														"destination" : [ "obj-356", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-357", 0 ],
														"destination" : [ "obj-356", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-356", 0 ],
														"destination" : [ "obj-354", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-355", 0 ],
														"destination" : [ "obj-354", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-353", 0 ],
														"destination" : [ "obj-364", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-352", 0 ],
														"destination" : [ "obj-362", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-351", 0 ],
														"destination" : [ "obj-361", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-350", 0 ],
														"destination" : [ "obj-359", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-349", 0 ],
														"destination" : [ "obj-357", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-348", 0 ],
														"destination" : [ "obj-355", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-347", 0 ],
														"destination" : [ "obj-365", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-346", 0 ],
														"destination" : [ "obj-366", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-346", 0 ],
														"destination" : [ "obj-344", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-345", 0 ],
														"destination" : [ "obj-341", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-344", 0 ],
														"destination" : [ "obj-345", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-343", 0 ],
														"destination" : [ "obj-346", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-342", 0 ],
														"destination" : [ "obj-340", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-342", 0 ],
														"destination" : [ "obj-338", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-341", 0 ],
														"destination" : [ "obj-342", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-341", 0 ],
														"destination" : [ "obj-339", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-340", 0 ],
														"destination" : [ "obj-336", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-34", 0 ],
														"destination" : [ "obj-35", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-339", 0 ],
														"destination" : [ "obj-340", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-338", 0 ],
														"destination" : [ "obj-341", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-336", 0 ],
														"destination" : [ "obj-334", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-335", 0 ],
														"destination" : [ "obj-331", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-334", 0 ],
														"destination" : [ "obj-335", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-333", 0 ],
														"destination" : [ "obj-336", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-331", 0 ],
														"destination" : [ "obj-329", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-330", 0 ],
														"destination" : [ "obj-323", 0 ],
														"order" : 2
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-330", 0 ],
														"destination" : [ "obj-304", 0 ],
														"midpoints" : [ 1164.5, 1557.0, 1654.5, 1557.0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-329", 0 ],
														"destination" : [ "obj-330", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-328", 0 ],
														"destination" : [ "obj-331", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-323", 0 ],
														"destination" : [ "obj-321", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-321", 0 ],
														"destination" : [ "obj-319", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-319", 0 ],
														"destination" : [ "obj-320", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-318", 0 ],
														"destination" : [ "obj-321", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-316", 0 ],
														"destination" : [ "obj-315", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-315", 0 ],
														"destination" : [ "obj-316", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-315", 0 ],
														"destination" : [ "obj-312", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-312", 0 ],
														"destination" : [ "obj-309", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-31", 0 ],
														"destination" : [ "obj-32", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-309", 0 ],
														"destination" : [ "obj-307", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-307", 0 ],
														"destination" : [ "obj-308", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-306", 0 ],
														"destination" : [ "obj-309", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-304", 0 ],
														"destination" : [ "obj-301", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-303", 0 ],
														"destination" : [ "obj-265", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-301", 0 ],
														"destination" : [ "obj-299", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-30", 0 ],
														"destination" : [ "obj-43", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-3", 0 ],
														"destination" : [ "obj-21", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-299", 0 ],
														"destination" : [ "obj-300", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-298", 0 ],
														"destination" : [ "obj-301", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-296", 0 ],
														"destination" : [ "obj-295", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-295", 0 ],
														"destination" : [ "obj-296", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-295", 0 ],
														"destination" : [ "obj-292", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-292", 0 ],
														"destination" : [ "obj-289", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-289", 0 ],
														"destination" : [ "obj-287", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-287", 0 ],
														"destination" : [ "obj-288", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-286", 0 ],
														"destination" : [ "obj-289", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-284", 0 ],
														"destination" : [ "obj-264", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-283", 0 ],
														"destination" : [ "obj-315", 2 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-282", 0 ],
														"destination" : [ "obj-295", 2 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-28", 0 ],
														"destination" : [ "obj-29", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-275", 0 ],
														"destination" : [ "obj-344", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-275", 0 ],
														"destination" : [ "obj-343", 1 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-274", 0 ],
														"destination" : [ "obj-339", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-274", 0 ],
														"destination" : [ "obj-338", 1 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-273", 0 ],
														"destination" : [ "obj-334", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-273", 0 ],
														"destination" : [ "obj-333", 1 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-272", 0 ],
														"destination" : [ "obj-329", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-272", 0 ],
														"destination" : [ "obj-328", 1 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-270", 0 ],
														"destination" : [ "obj-268", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-27", 0 ],
														"destination" : [ "obj-137", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-27", 0 ],
														"destination" : [ "obj-135", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-268", 0 ],
														"destination" : [ "obj-267", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-263", 0 ],
														"destination" : [ "obj-323", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-262", 0 ],
														"destination" : [ "obj-304", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-261", 0 ],
														"destination" : [ "obj-319", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-261", 0 ],
														"destination" : [ "obj-318", 1 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-260", 0 ],
														"destination" : [ "obj-299", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-260", 0 ],
														"destination" : [ "obj-298", 1 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-259", 0 ],
														"destination" : [ "obj-287", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-259", 0 ],
														"destination" : [ "obj-286", 1 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-258", 0 ],
														"destination" : [ "obj-307", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-258", 0 ],
														"destination" : [ "obj-306", 1 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-257", 0 ],
														"destination" : [ "obj-312", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-256", 0 ],
														"destination" : [ "obj-292", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-255", 0 ],
														"destination" : [ "obj-303", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-254", 0 ],
														"destination" : [ "obj-284", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-253", 0 ],
														"destination" : [ "obj-251", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-252", 0 ],
														"destination" : [ "obj-366", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-251", 0 ],
														"destination" : [ "obj-252", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-250", 0 ],
														"destination" : [ "obj-248", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-25", 0 ],
														"destination" : [ "obj-26", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-248", 0 ],
														"destination" : [ "obj-249", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-247", 0 ],
														"destination" : [ "obj-245", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-246", 0 ],
														"destination" : [ "obj-342", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-245", 0 ],
														"destination" : [ "obj-246", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-244", 0 ],
														"destination" : [ "obj-242", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-242", 0 ],
														"destination" : [ "obj-243", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-241", 0 ],
														"destination" : [ "obj-240", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-240", 0 ],
														"destination" : [ "obj-268", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-24", 0 ],
														"destination" : [ "obj-114", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-24", 0 ],
														"destination" : [ "obj-111", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-239", 0 ],
														"destination" : [ "obj-237", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-238", 0 ],
														"destination" : [ "obj-267", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-237", 0 ],
														"destination" : [ "obj-238", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-236", 0 ],
														"destination" : [ "obj-234", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-234", 0 ],
														"destination" : [ "obj-233", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-231", 0 ],
														"destination" : [ "obj-230", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-230", 0 ],
														"destination" : [ "obj-234", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-229", 0 ],
														"destination" : [ "obj-227", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-228", 0 ],
														"destination" : [ "obj-233", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-227", 0 ],
														"destination" : [ "obj-228", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-226", 0 ],
														"destination" : [ "obj-224", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-224", 0 ],
														"destination" : [ "obj-225", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-223", 0 ],
														"destination" : [ "obj-221", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-221", 0 ],
														"destination" : [ "obj-222", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-220", 0 ],
														"destination" : [ "obj-218", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-22", 0 ],
														"destination" : [ "obj-23", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-218", 0 ],
														"destination" : [ "obj-219", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-217", 0 ],
														"destination" : [ "obj-215", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-215", 0 ],
														"destination" : [ "obj-216", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-214", 0 ],
														"destination" : [ "obj-212", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-212", 0 ],
														"destination" : [ "obj-213", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-209", 0 ],
														"destination" : [ "obj-199", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-201", 0 ],
														"destination" : [ "obj-200", 1 ],
														"midpoints" : [ 155.5, 286.0, 131.5, 286.0, 131.5, 199.0, 205.5, 199.0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-200", 0 ],
														"destination" : [ "obj-201", 0 ],
														"midpoints" : [ 155.5, 235.0, 155.5, 235.0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-200", 0 ],
														"destination" : [ "obj-180", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-20", 0 ],
														"destination" : [ "obj-19", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-199", 0 ],
														"destination" : [ "obj-205", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-195", 0 ],
														"destination" : [ "obj-22", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-194", 0 ],
														"destination" : [ "obj-25", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-193", 0 ],
														"destination" : [ "obj-28", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-192", 0 ],
														"destination" : [ "obj-31", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-191", 0 ],
														"destination" : [ "obj-37", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-190", 0 ],
														"destination" : [ "obj-34", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-19", 0 ],
														"destination" : [ "obj-16", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-189", 0 ],
														"destination" : [ "obj-44", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-188", 0 ],
														"destination" : [ "obj-40", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-187", 0 ],
														"destination" : [ "obj-51", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-186", 0 ],
														"destination" : [ "obj-54", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-185", 0 ],
														"destination" : [ "obj-59", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-184", 0 ],
														"destination" : [ "obj-56", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-183", 0 ],
														"destination" : [ "obj-62", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-182", 0 ],
														"destination" : [ "obj-65", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-180", 0 ],
														"destination" : [ "obj-181", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-18", 0 ],
														"destination" : [ "obj-19", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-179", 0 ],
														"destination" : [ "obj-180", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-178", 0 ],
														"destination" : [ "obj-206", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-177", 0 ],
														"destination" : [ "obj-204", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-176", 0 ],
														"destination" : [ "obj-175", 1 ],
														"midpoints" : [ 128.5, 605.0, 105.0, 605.0, 105.0, 573.0, 74.0, 573.0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-175", 0 ],
														"destination" : [ "obj-176", 0 ],
														"midpoints" : [ 63.5, 609.0, 105.0, 609.0, 105.0, 573.0, 128.5, 573.0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-175", 0 ],
														"destination" : [ "obj-172", 0 ],
														"order" : 2
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-173", 0 ],
														"destination" : [ "obj-171", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-173", 0 ],
														"destination" : [ "obj-169", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-172", 0 ],
														"destination" : [ "obj-173", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-172", 0 ],
														"destination" : [ "obj-170", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-171", 0 ],
														"destination" : [ "obj-167", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-170", 0 ],
														"destination" : [ "obj-171", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-17", 0 ],
														"destination" : [ "obj-16", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-169", 0 ],
														"destination" : [ "obj-172", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-168", 0 ],
														"destination" : [ "obj-166", 1 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-168", 0 ],
														"destination" : [ "obj-164", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-167", 0 ],
														"destination" : [ "obj-168", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-167", 0 ],
														"destination" : [ "obj-165", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-166", 0 ],
														"destination" : [ "obj-162", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-165", 0 ],
														"destination" : [ "obj-166", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-164", 0 ],
														"destination" : [ "obj-167", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-162", 0 ],
														"destination" : [ "obj-160", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-161", 0 ],
														"destination" : [ "obj-157", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-160", 0 ],
														"destination" : [ "obj-161", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-16", 0 ],
														"destination" : [ "obj-14", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-159", 0 ],
														"destination" : [ "obj-162", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-157", 0 ],
														"destination" : [ "obj-155", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-156", 0 ],
														"destination" : [ "obj-147", 0 ],
														"order" : 2
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-156", 0 ],
														"destination" : [ "obj-124", 0 ],
														"midpoints" : [ 63.5, 1566.0, 561.0, 1566.0, 561.0, 1734.0, 562.5, 1734.0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-155", 0 ],
														"destination" : [ "obj-156", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-154", 0 ],
														"destination" : [ "obj-157", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-150", 0 ],
														"destination" : [ "obj-149", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-15", 0 ],
														"destination" : [ "obj-14", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-147", 0 ],
														"destination" : [ "obj-145", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-145", 0 ],
														"destination" : [ "obj-143", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-143", 0 ],
														"destination" : [ "obj-144", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-142", 0 ],
														"destination" : [ "obj-145", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-140", 0 ],
														"destination" : [ "obj-139", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-14", 0 ],
														"destination" : [ "obj-12", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-139", 0 ],
														"destination" : [ "obj-140", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-139", 0 ],
														"destination" : [ "obj-132", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-135", 0 ],
														"destination" : [ "obj-136", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-132", 0 ],
														"destination" : [ "obj-129", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-13", 0 ],
														"destination" : [ "obj-12", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-129", 0 ],
														"destination" : [ "obj-127", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-127", 0 ],
														"destination" : [ "obj-128", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-126", 0 ],
														"destination" : [ "obj-129", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-124", 0 ],
														"destination" : [ "obj-120", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-123", 0 ],
														"destination" : [ "obj-79", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-120", 0 ],
														"destination" : [ "obj-118", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-12", 0 ],
														"destination" : [ "obj-10", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-118", 0 ],
														"destination" : [ "obj-119", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-117", 0 ],
														"destination" : [ "obj-120", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-114", 0 ],
														"destination" : [ "obj-115", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-113", 0 ],
														"destination" : [ "obj-110", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-112", 0 ],
														"destination" : [ "obj-67", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-110", 0 ],
														"destination" : [ "obj-113", 0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-110", 0 ],
														"destination" : [ "obj-107", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-11", 0 ],
														"destination" : [ "obj-10", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-107", 0 ],
														"destination" : [ "obj-104", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-104", 0 ],
														"destination" : [ "obj-102", 0 ],
														"order" : 1
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-102", 0 ],
														"destination" : [ "obj-103", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-101", 0 ],
														"destination" : [ "obj-104", 1 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-1", 0 ],
														"destination" : [ "obj-175", 2 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-383", 0 ],
														"destination" : [ "obj-200", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-384", 0 ],
														"destination" : [ "obj-45", 0 ]
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-175", 0 ],
														"destination" : [ "obj-375", 0 ],
														"midpoints" : [ 63.5, 621.0, 203.5, 621.0 ],
														"order" : 0
													}

												}
, 												{
													"patchline" : 													{
														"source" : [ "obj-371", 0 ],
														"destination" : [ "obj-461", 0 ],
														"midpoints" : [ 1164.5, 621.0, 1304.5, 621.0 ],
														"order" : 0
													}

												}
 ]
										}

									}
,
									"id" : "obj-77",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "signal", "signal" ],
									"patching_rect" : [ 436.0, 324.0, 82.0, 23.0 ],
									"rnbo_classname" : "gen~",
									"rnbo_extra_attributes" : 									{
										"exposeparams" : 0
									}
,
									"rnbo_serial" : 1,
									"rnbo_uniqueid" : "gen~_obj-77",
									"rnboinfo" : 									{
										"needsInstanceInfo" : 1,
										"argnames" : 										{
											"in1" : 											{
												"attrOrProp" : 1,
												"digest" : "in1",
												"isalias" : 0,
												"aliases" : [  ],
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"inlet" : 1,
												"type" : "number"
											}
,
											"reset" : 											{
												"attrOrProp" : 1,
												"digest" : "Reset all param and history objects to initial values",
												"isalias" : 0,
												"aliases" : [  ],
												"attachable" : 1,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "bang"
											}
,
											"expr" : 											{
												"attrOrProp" : 2,
												"digest" : "a gen expression",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"doNotShowInMaxInspector" : 1
											}
,
											"file" : 											{
												"attrOrProp" : 2,
												"digest" : "gendsp file to load",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"doNotShowInMaxInspector" : 1
											}
,
											"title" : 											{
												"attrOrProp" : 2,
												"digest" : "a title",
												"defaultarg" : 1,
												"isalias" : 0,
												"aliases" : [ "t" ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol",
												"doNotShowInMaxInspector" : 1
											}
,
											"t" : 											{
												"attrOrProp" : 2,
												"digest" : "a title",
												"defaultarg" : 1,
												"isalias" : 1,
												"aliasOf" : "title",
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "symbol"
											}
,
											"exposeparams" : 											{
												"attrOrProp" : 2,
												"digest" : "Expose gen params as RNBO params.",
												"isalias" : 0,
												"aliases" : [  ],
												"settable" : 1,
												"attachable" : 0,
												"isparam" : 0,
												"deprecated" : 0,
												"touched" : 0,
												"type" : "bool",
												"defaultValue" : "false"
											}

										}
,
										"inputs" : [ 											{
												"name" : "in1",
												"type" : "auto",
												"digest" : "in1",
												"hot" : 1,
												"docked" : 0
											}
, 											{
												"name" : "in2",
												"type" : "auto"
											}
 ],
										"outputs" : [ 											{
												"name" : "out1",
												"type" : "signal"
											}
, 											{
												"name" : "out2",
												"type" : "signal"
											}
 ],
										"helpname" : "gen~",
										"aliasOf" : "gen~",
										"classname" : "gen~",
										"operator" : 0,
										"versionId" : 179904306,
										"changesPatcherIO" : 0
									}
,
									"text" : "gen~"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 0 ],
									"midpoints" : [ 445.5, 309.0, 643.5, 309.0 ],
									"order" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 0 ],
									"order" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"midpoints" : [ 126.5, 391.0, 272.0, 391.0, 272.0, 436.0, 272.5, 436.0 ],
									"order" : 0,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"order" : 1,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-17", 1 ],
									"order" : 0,
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 1 ],
									"midpoints" : [ 536.5, 397.0, 473.5, 397.0 ],
									"order" : 1,
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"midpoints" : [ 708.5, 480.0, 508.5, 480.0 ],
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"midpoints" : [ 508.5, 309.0, 708.5, 309.0 ],
									"order" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 1 ],
									"order" : 1,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"midpoints" : [ 643.5, 480.0, 445.5, 480.0 ],
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 1 ],
									"order" : 0,
									"source" : [ "obj-21", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 1 ],
									"midpoints" : [ 736.5, 398.0, 671.5, 398.0 ],
									"order" : 1,
									"source" : [ "obj-21", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 0 ],
									"midpoints" : [ 126.5, 204.0, 423.0, 204.0, 423.0, 309.0, 445.5, 309.0 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 0 ],
									"midpoints" : [ 126.5, 309.0, 445.5, 309.0 ],
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-17", 0 ],
									"source" : [ "obj-77", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"source" : [ "obj-77", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ],
						"default_bgcolor" : [ 0.031372549019608, 0.125490196078431, 0.211764705882353, 1.0 ],
						"color" : [ 0.929412, 0.929412, 0.352941, 1.0 ],
						"elementcolor" : [ 0.357540726661682, 0.515565991401672, 0.861786782741547, 1.0 ],
						"accentcolor" : [ 0.343034118413925, 0.506230533123016, 0.86220508813858, 1.0 ],
						"stripecolor" : [ 0.258338063955307, 0.352425158023834, 0.511919498443604, 1.0 ],
						"bgfillcolor_type" : "color",
						"bgfillcolor_color" : [ 0.031372549019608, 0.125490196078431, 0.211764705882353, 1.0 ],
						"bgfillcolor_color1" : [ 0.031372549019608, 0.125490196078431, 0.211764705882353, 1.0 ],
						"bgfillcolor_color2" : [ 0.263682, 0.004541, 0.038797, 1.0 ],
						"bgfillcolor_angle" : 270.0,
						"bgfillcolor_proportion" : 0.39,
						"bgfillcolor_autogradient" : 0.0,
						"export_config" : 						{
							"vst-au-export" : 							{
								"vst-au-export-ins" : 								{
									"plugin_name" : "glitchverb",
									"plugin_manufacturer_name" : "Jonathan Higgins",
									"plugin_manufacturer_code" : "JPHi",
									"include_presets" : 0,
									"openexportdirectory" : 1
								}

							}

						}

					}
,
					"patching_rect" : [ 494.0, 482.0, 40.0, 22.0 ],
					"rnboattrcache" : 					{
						"dry_wet" : 						{
							"label" : "dry_wet",
							"isEnum" : 0,
							"parsestring" : ""
						}
,
						"decay" : 						{
							"label" : "decay",
							"isEnum" : 0,
							"parsestring" : ""
						}
,
						"clock_speed" : 						{
							"label" : "clock_speed",
							"isEnum" : 0,
							"parsestring" : ""
						}

					}
,
					"rnboversion" : "1.4.2",
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_invisible" : 1,
							"parameter_longname" : "rnbo~",
							"parameter_modmode" : 0,
							"parameter_shortname" : "rnbo~",
							"parameter_type" : 3
						}

					}
,
					"saved_object_attributes" : 					{
						"optimization" : "O1",
						"parameter_enable" : 1,
						"uuid" : "4561593f-cda6-11f1-993f-7085c2f92dc8"
					}
,
					"snapshot" : 					{
						"filetype" : "C74Snapshot",
						"version" : 2,
						"minorversion" : 0,
						"name" : "snapshotlist",
						"origin" : "rnbo~",
						"type" : "list",
						"subtype" : "Undefined",
						"embed" : 1,
						"snapshot" : 						{
							"decay" : 							{
								"value" : 0.7
							}
,
							"dry_wet" : 							{
								"value" : 1.0
							}
,
							"__presetid" : "4561593f-cda6-11f1-993f-7085c2f92dc8",
							"clock_speed" : 							{
								"value" : 0.6
							}

						}
,
						"snapshotlist" : 						{
							"current_snapshot" : 0,
							"entries" : [ 								{
									"filetype" : "C74Snapshot",
									"version" : 2,
									"minorversion" : 0,
									"name" : "Big Sparkle",
									"origin" : "4561593f-cda6-11f1-993f-7085c2f92dc8",
									"type" : "rnbo",
									"subtype" : "",
									"embed" : 0,
									"snapshot" : 									{
										"decay" : 										{
											"value" : 0.7
										}
,
										"dry_wet" : 										{
											"value" : 1.0
										}
,
										"__presetid" : "4561593f-cda6-11f1-993f-7085c2f92dc8",
										"clock_speed" : 										{
											"value" : 0.6
										}

									}
,
									"fileref" : 									{
										"name" : "Big Sparkle",
										"filename" : "untitled_20261027.maxsnap",
										"filepath" : "D:/Documents/Max 8/Snapshots",
										"filepos" : -1,
										"snapshotfileid" : "f0f5b9c5bbeb28b279d6f2b9dc13f560"
									}

								}
, 								{
									"filetype" : "C74Snapshot",
									"version" : 2,
									"minorversion" : 0,
									"name" : "Endless Glitch",
									"origin" : "4561593f-cda6-11f1-993f-7085c2f92dc8",
									"type" : "rnbo",
									"subtype" : "",
									"embed" : 0,
									"fileref" : 									{
										"name" : "Endless Glitch",
										"filename" : "Big Sparkle[1].maxsnap",
										"filepath" : "D:/Documents/Max 8/Snapshots",
										"filepos" : -1,
										"snapshotfileid" : "566cdf04f84f91e98dbdef22474204fb"
									}

								}
, 								{
									"filetype" : "C74Snapshot",
									"version" : 2,
									"minorversion" : 0,
									"name" : "Small Shimmer",
									"origin" : "4561593f-cda6-11f1-993f-7085c2f92dc8",
									"type" : "rnbo",
									"subtype" : "",
									"embed" : 0,
									"fileref" : 									{
										"name" : "Small Shimmer",
										"filename" : "Big Sparkle[1]_20261027.maxsnap",
										"filepath" : "D:/Documents/Max 8/Snapshots",
										"filepos" : -1,
										"snapshotfileid" : "d33722d1399b010481d800e9153e89e0"
									}

								}
, 								{
									"filetype" : "C74Snapshot",
									"version" : 2,
									"minorversion" : 0,
									"name" : "Completely Broken",
									"origin" : "4561593f-cda6-11f1-993f-7085c2f92dc8",
									"type" : "rnbo",
									"subtype" : "",
									"embed" : 0,
									"fileref" : 									{
										"name" : "Completely Broken",
										"filename" : "Big Sparkle[1]_20261027_1.maxsnap",
										"filepath" : "D:/Documents/Max 8/Snapshots",
										"filepos" : -1,
										"snapshotfileid" : "e61f1163f7f7da8472b02891c4ba92d9"
									}

								}
, 								{
									"filetype" : "C74Snapshot",
									"version" : 2,
									"minorversion" : 0,
									"name" : "Nearly Normal",
									"origin" : "4561593f-cda6-11f1-993f-7085c2f92dc8",
									"type" : "rnbo",
									"subtype" : "",
									"embed" : 0,
									"fileref" : 									{
										"name" : "Nearly Normal",
										"filename" : "Big Sparkle[1]_20261027_2.maxsnap",
										"filepath" : "D:/Documents/Max 8/Snapshots",
										"filepos" : -1,
										"snapshotfileid" : "857f3fa31fc48e181205a75d5d250187"
									}

								}
, 								{
									"filetype" : "C74Snapshot",
									"version" : 2,
									"minorversion" : 0,
									"name" : "Glitched Echoes",
									"origin" : "4561593f-cda6-11f1-993f-7085c2f92dc8",
									"type" : "rnbo",
									"subtype" : "",
									"embed" : 0,
									"fileref" : 									{
										"name" : "Glitched Echoes",
										"filename" : "Big Sparkle[1]_20261027_3.maxsnap",
										"filepath" : "D:/Documents/Max 8/Snapshots",
										"filepos" : -1,
										"snapshotfileid" : "5fd40883fecae22c9d16a1b29243dacb"
									}

								}
 ]
						}

					}
,
					"text" : "rnbo~",
					"varname" : "rnbo~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "gain~",
					"multichannelvariant" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 528.0, 551.0, 22.0, 140.0 ]
				}

			}
, 			{
				"box" : 				{
					"basictuning" : 440,
					"data" : 					{
						"clips" : [ 							{
								"absolutepath" : "reich2.aiff",
								"filename" : "reich2.aiff",
								"filekind" : "audiofile",
								"id" : "u085000658",
								"selection" : [ 0.0, 1.0 ],
								"loop" : 1,
								"content_state" : 								{
									"loop" : 1,
									"speed" : 0.15,
									"timestretch" : 1,
									"mode" : "extremestretch"
								}

							}
 ]
					}
,
					"followglobaltempo" : 0,
					"formantcorrection" : 0,
					"id" : "obj-32",
					"maxclass" : "playlist~",
					"mode" : "extremestretch",
					"numinlets" : 1,
					"numoutlets" : 5,
					"originallength" : [ 0.0, "ticks" ],
					"originaltempo" : 120.0,
					"outlettype" : [ "signal", "signal", "signal", "", "dictionary" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 494.0, 349.0, 150.0, 30.0 ],
					"pitchcorrection" : 0,
					"quality" : "basic",
					"timestretch" : [ 1 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "gain~",
					"multichannelvariant" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 492.0, 551.0, 22.0, 140.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 491.5, 741.0, 45.0, 45.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "speed",
					"id" : "obj-13",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 494.0, 319.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "clock_speed",
					"id" : "obj-2",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 494.0, 452.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "decay",
					"id" : "obj-3",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 647.0, 452.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "dry_wet",
					"id" : "obj-6",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 799.0, 452.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "speed",
					"id" : "obj-41",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 663.0, 319.0, 150.0, 22.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 1 ],
					"source" : [ "obj-32", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 1 ],
					"source" : [ "obj-40", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-5", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 1 ],
					"source" : [ "obj-8", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-1" : [ "rnbo~", "rnbo~", 0 ],
			"parameterbanks" : 			{
				"0" : 				{
					"index" : 0,
					"name" : "",
					"parameters" : [ "-", "-", "-", "-", "-", "-", "-", "-" ]
				}

			}
,
			"inherited_shortname" : 1
		}
,
		"dependency_cache" : [ 			{
				"name" : "Big Sparkle[1].maxsnap",
				"bootpath" : "D:/Documents/Max 8/Snapshots",
				"patcherrelativepath" : "../../../Max 8/Snapshots",
				"type" : "mx@s",
				"implicit" : 1
			}
, 			{
				"name" : "Big Sparkle[1]_20261027.maxsnap",
				"bootpath" : "D:/Documents/Max 8/Snapshots",
				"patcherrelativepath" : "../../../Max 8/Snapshots",
				"type" : "mx@s",
				"implicit" : 1
			}
, 			{
				"name" : "Big Sparkle[1]_20261027_1.maxsnap",
				"bootpath" : "D:/Documents/Max 8/Snapshots",
				"patcherrelativepath" : "../../../Max 8/Snapshots",
				"type" : "mx@s",
				"implicit" : 1
			}
, 			{
				"name" : "Big Sparkle[1]_20261027_2.maxsnap",
				"bootpath" : "D:/Documents/Max 8/Snapshots",
				"patcherrelativepath" : "../../../Max 8/Snapshots",
				"type" : "mx@s",
				"implicit" : 1
			}
, 			{
				"name" : "Big Sparkle[1]_20261027_3.maxsnap",
				"bootpath" : "D:/Documents/Max 8/Snapshots",
				"patcherrelativepath" : "../../../Max 8/Snapshots",
				"type" : "mx@s",
				"implicit" : 1
			}
, 			{
				"name" : "jongly.aif",
				"bootpath" : "C74:/media/msp",
				"type" : "AIFF",
				"implicit" : 1
			}
, 			{
				"name" : "reich2.aiff",
				"bootpath" : "D:/Documents/Max 8/Packages/MuBu For Max/media",
				"patcherrelativepath" : "../../../Max 8/Packages/MuBu For Max/media",
				"type" : "AIFF",
				"implicit" : 1
			}
, 			{
				"name" : "untitled_20261027.maxsnap",
				"bootpath" : "D:/Documents/Max 8/Snapshots",
				"patcherrelativepath" : "../../../Max 8/Snapshots",
				"type" : "mx@s",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
