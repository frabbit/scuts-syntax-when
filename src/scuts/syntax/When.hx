package scuts.syntax;

#if macro
import haxe.macro.Expr;
#end
class When {
	macro public static function when (e:Expr, ifThen:Expr, ifElse:Expr) {
		return scuts.syntax.when.Impl.fromDefault(e, ifThen, ifElse);
	}

}


