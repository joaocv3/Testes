/*
 * generated by Xtext 2.14.0
 */
package org.ide

import com.google.inject.Guice
import org.AGESRuntimeModule
import org.AGESStandaloneSetup
import org.eclipse.xtext.util.Modules2

/**
 * Initialization support for running Xtext languages as language servers.
 */
class AGESIdeSetup extends AGESStandaloneSetup {

	override createInjector() {
		Guice.createInjector(Modules2.mixin(new AGESRuntimeModule, new AGESIdeModule))
	}
	
}
