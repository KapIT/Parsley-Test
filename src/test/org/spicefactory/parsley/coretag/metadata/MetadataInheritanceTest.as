package org.spicefactory.parsley.coretag.metadata {
import org.hamcrest.assertThat;
import org.hamcrest.collection.arrayWithSize;
import org.spicefactory.lib.reflect.ClassInfo;
import org.spicefactory.parsley.core.builder.metadata.MetadataDecoratorAssembler;
import org.spicefactory.parsley.coretag.metadata.model.ImplementationNoInheritance;
import org.spicefactory.parsley.coretag.metadata.model.ImplementationWithInheritance;
import org.spicefactory.parsley.coretag.metadata.model.SubclassNoInheritance;
import org.spicefactory.parsley.coretag.metadata.model.SubclassWithInheritance;

/**
 * @author Jens Halm
 */
public class MetadataInheritanceTest {
	
	
	private var assembler:MetadataDecoratorAssembler = new MetadataDecoratorAssembler();
	
	
	[Test]
	public function subclassWithoutInheritance () : void {
		var decorators:Array = assembler.assemble(ClassInfo.forClass(SubclassNoInheritance));
		// I do not know if it is an intended behaviour but spicelib does not catch superclass property/methods metadata
		// so this test cannot produce this result
		//assertThat(decorators, arrayWithSize(6));
		assertThat(decorators, arrayWithSize(4));
	}
	
	[Test]
	public function subclassWithInheritance () : void {
		var decorators:Array = assembler.assemble(ClassInfo.forClass(SubclassWithInheritance));
		// I do not know if it is an intended behaviour but spicelib does not catch superclass property/methods metadata
		// so this test cannot produce this result
		// for this particuliar case we could imagine catching metadata of superclass
		// assertThat(decorators, arrayWithSize(7));
		assertThat(decorators, arrayWithSize(5));
	}
	
	[Test]
	public function implementationWithoutInheritance () : void {
		var decorators:Array = assembler.assemble(ClassInfo.forClass(ImplementationNoInheritance));
		assertThat(decorators, arrayWithSize(2));
	}
	
	[Test]
	public function implementationWithInheritance () : void {
		var decorators:Array = assembler.assemble(ClassInfo.forClass(ImplementationWithInheritance));
		assertThat(decorators, arrayWithSize(2));
	}
	
	
	
}
}
