baselines
baseline: spec
	<baseline>
	spec for: #common do: [ spec
		baseline: 'AtomicClassInstaller' with: [ spec
			repository: 'github://tesonep/pharo-AtomicClassInstaller/mc';
			loads: 'shift-installer' ];

		project: 'SMark' with: [
				spec
					className: #ConfigurationOfSMark;
					version: #stable;
					repository: 'http://smalltalkhub.com/mc/StefanMarr/SMark/main' ];

		package: 'ExtensibleMetaclass' 					with: [ spec requires: #(AtomicClassInstaller) ];
		package: 'ExtensibleMetaclass-Tests' 			with: [ spec requires: #(core) ];
		package: 'ExtensibleMetaclass-Traits' 			with: [ spec requires: #(core) ];
		package: 'ExtensibleMetaclass-Traits-Tests' 	with: [ spec requires: #(traits 'core-tests') ];
		package: 'ExtensibleMetaclass-Beta' 				with: [ spec requires: #(core) ];
		package: 'ExtensibleMetaclass-Beta-Tests' 		with: [ spec requires: #(beta 'core-tests') ];
		package: 'ExtensibleMetaclass-Mixins'			with: [ spec requires: #(core) ];
		package: 'ExtensibleMetaclass-Mixins-Tests'		with: [ spec requires: #(mixins 'core-tests') ];
		package: 'ExtensibleMetaclass-Combinations-Tests'		with: [ spec requires: #(all 'core-tests') ];


		group: 'core' 				with: #('ExtensibleMetaclass');
		group: 'core-tests'		with: #('ExtensibleMetaclass-Tests');

		group: 'traits'				with: #('ExtensibleMetaclass-Traits');
		group: 'traits-tests'		with: #('ExtensibleMetaclass-Traits-Tests');

		group: 'beta'				with: #('ExtensibleMetaclass-Beta');
		group: 'beta-tests'		with: #('ExtensibleMetaclass-Beta-Tests');

		group: 'mixins'				with: #('ExtensibleMetaclass-Mixins');
		group: 'mixins-tests'		with: #('ExtensibleMetaclass-Mixins-Tests');

		group: 'all'					with: #(core traits beta mixins);
		group: 'development'		with: #('traits-tests' 'beta-tests' 'mixins-tests' 'ExtensibleMetaclass-Combinations-Tests')		
	]