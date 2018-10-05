import scuts.syntax.When.when;

import Expect.match as m;
import Expect.error;

enum Person {
	Person(name:String, age:Int);
}

enum Child {
	Child(attr:{ name : String });
}

enum Parent {
	Parent(name:String, child:Child);
}

class Test {
	public static function main () {

		var p = Person("tim", 18);

		var name = when( p => Person(name, _), name, "frank");

		m(name, "tim");



		Expect.reportAndExit();
	}
}