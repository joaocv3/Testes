/*
 * generated by Xtext 2.14.0
 */
package org.generator

import org.eclipse.emf.common.util.EList
import org.eclipse.xtext.generator.AbstractGenerator
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.IFileSystemAccess2
import org.eclipse.xtext.generator.IGeneratorContext
import org.eclipse.xtext.naming.IQualifiedNameProvider
import com.google.inject.Inject
import org.aGES.Entity
import org.aGES.Feature

/**
 * Generates code from your model files on save.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#code-generation
 */
class AGESGenerator extends AbstractGenerator {

	
	@Inject extension IQualifiedNameProvider
 
    override void doGenerate(Resource resource, IFileSystemAccess2 fsa, IGeneratorContext context) {
        for (e : resource.allContents.toIterable.filter(Entity)) {
            fsa.generateFile(
                e.fullyQualifiedName.toString("/") + ".rb",
                e.compile)
        }
    }
   
    def compile(Entity e) '''
	    class «e.name»«IF e.superType !== null » < «e.superType.fullyQualifiedName» «ENDIF»
	    
	      «FOR f : e.features»
	    	«f.compile»
	      «ENDFOR»
	    end
    '''
 
    def compile(Feature f) '''
		# type «f.type.fullyQualifiedName» 	
		def «f.name» 
		  @«f.name»
		end
		
		def «f.name»=(value)
		  @«f.name» = value
		end
    '''   
}
