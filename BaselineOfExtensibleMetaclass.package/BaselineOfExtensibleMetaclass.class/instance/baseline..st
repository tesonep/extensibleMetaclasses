baselines
baseline: spec
	<baseline>
	spec for: #common do: [ spec
		baseline: 'AtomicClassInstaller' with: [ spec
			repository: 'github://tesonep/pharo-AtomicClassInstaller/mc';
			loads: 'Shift-ClassBuilder' ];

		package: 'ExtensibleMetaclass' 					with: [ spec requires: #(AtomicClassInstaller) ];
		package: 'ExtensibleMetaclass-Tests' 			with: [ spec requires: #(core) ];
		package: 'ExtensibleMetaclass-Traits' 			with: [ spec requires: #(core) ];
		package: 'ExtensibleMetaclass-Traits-Tests' 	with: [ spec requires: #(traits core-tests) ];

		group: 'core' 				with: #('ExtensibleMetaclass');
		group: 'core-tests'		with: #('ExtensibleMetaclass-Tests');

		group: 'traits'				with: #('ExtensibleMetaclass-Traits');
		group: 'traits-tests'		with: #('ExtensibleMetaclass-Traits-Tests');

		group: 'all'					with: #(core traits);
		group: 'all-tests'			with: #(traits-tests)		
	]