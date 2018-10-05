package scuts.syntax.when;

#if macro

import haxe.macro.TypeTools;
import haxe.macro.ExprTools;
import haxe.macro.Expr;

import haxe.macro.Context as C;
import haxe.Constraints;
import scuts.macrokit.OptionApi;
import scuts.macrokit.ArrayApi as A;

class Impl {

	public static function fromDefault (e:Expr, ifThen:Expr, ifElse:Expr) {
		return switch e {
			case macro $b => $a: mkWhen(a, b, ifThen, ifElse);
			case _: C.error("invalid Expression for when `expr => expr, then, else` expected", C.currentPos());
		}
	}

	public static function mkWhen (leftExpr:Expr, rightExpr:Expr, ifThen:Expr, ifElse:Expr) {
		return macro switch ($rightExpr) {
			case $leftExpr: $ifThen;
			case _: $ifElse;
		};
	};
}


#end