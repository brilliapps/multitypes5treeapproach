# multitypes5treeapproach

//import 'package:flutter/material.dart';

////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
/// Bool version of bool is not used it spares much trouble and basically fulfills it's function
/// Bool version of bool is not used it spares much trouble and basically fulfills it's function
/// Bool version of bool is not used it spares much trouble and basically fulfills it's function
/// Bool version of bool is not used it spares much trouble and basically fulfills it's function
/// Bool version of bool is not used it spares much trouble and basically fulfills it's function
/// Bool version of bool is not used it spares much trouble and basically fulfills it's function
/// Bool version of bool is not used it spares much trouble and basically fulfills it's function
/// TODO: ? not StringWhatever - i don't see it would work though, it's night now so it should be a tip for the next time.
/// TODO: ?  now test match operations on Int and those classes like class b extends sealed a implements Int but class c extends a - just extends and we have a union type using wrapper Int.
/// this is the real closest solution, should work with switch and no casting if (a IS someclass)
/// FIXME: initially classes like Obj, Num were sealed for exhaustive checking however they were required to be instandialble
/// so the solution might be another set of corresponding classes that implement or mix and they would be the real Int, String
/// FIXME: not fixme, just to turn attention, read carefully:
/// BELOW THE SOURCE "Strict" SUFFIXED CLASS NAMES IS CHANGED VERSION - IT WAS INITIAL FIRSTS REGEX CHANGED WITH CORRECTION BY HAND IN SOURCE AND THE RESULT HERE IS THE RESULT\;
/// SO THE SECOND CHANGE ACCORDING TO REGEX PATTERNS BELOW SHOULD PRODUCE NO ERRORS BUT FOR NOW I DON'T TEST IT THE SECOND TIME
/// BELOW REGEX PATTERNS
/// This is experimental feature so there are two maintained versions
/// 1. the desired non-strict and strict one, both maintained for necessary decision changes.
/// Strict means f.e. when a method of int returns int so f.e IntStrict returns Int.
/// But nor -Strict-suffixed version for Int will return no originall int but Int instead, and other wrapper types similarly.
///
/// LEGEND FOR REPLACING:
///   Str may mean StrStrict, Int - IntStrict, etc.
///   /*t*/int/*=t*/ Change into Int - bool for now not implemented
///   U (probably a method/getter return Type only), W (a probably method param only) is used by NumStrict in relation to Int(...Strict), Dbl(...Strict) classes which require specific params for overriden methods and return f.e. U=Int if object is Int, but accepts a param W=Int, f.e. usually, Dbl however returns U, and accepts W correspondingly which means that W=Dbl or W=Int bugt W!=Num,
///   /*u*/ num/*=u*/ /*w*/ num/*=w*/ - used in NumStrict - this should be changed to generic type letters U, and W correspondingly - Dbl class will accept no Num
///   /*numasu*/ it casts as U the return type most probably related to /*u*/ num/*=u*/.
///   !!! Important for the below: before changing cstring first change nested cstring2 like /*cstring2*/ nmatch /*c2*/: probably only one case
///   /*cstring*/'some string or String variable or return method call'/*c*/ Str('some string or String variable or return method call')
///    other/*b*/ ; change to other.base for original simple type value num, int, String, possibly more
///   /*remove*/ replace/*=remove*/ - with such a tag you remove all inside
///   /*insert*/ /*(Match match) => replace(match).base*/ /*=insert*/  - but you insert instead (regular expressions below)
///
///
/// Relevant analysis_options.yaml
///     inconsistent_inheritance: warning
///     invalid_override: warning
/// example o mine yaml (analyzer part):
/// analyzer:
/// #  exclude: [build/**]
/// #  language:
/// #    strict-casts: true
/// #    strict-raw-types: true
///   errors:
///     inconsistent_inheritance: warning
///     invalid_override: warning
///     invalid_use_of_protected_member: error
///     missing_override_of_must_be_overridden: error
///     must_call_super: error
///     #non_constant_identifier_names: error
///
/// ==========================================================================
/// ============ REGEX PATTERNS WITH DESCRIPTOIN =============================
///
/// Vscode replace - turn regular expression icon in the from top text field:
/// bool, 		String, 	num,	int,	double, 	Object
/// Bool		Str		Num,	Int,	Dbl,		Obj
///
/// ///   /*t*/int/*=t*/ Change into Int - bool for now not implemented
/// /// working patterns (VSCode Windows 11) and destination results:
///
/// As of now don't use Bool replacement, it causes more trouble and errors, the code is not ready for it.
/// \/\*t\*\/[\s\t\n\r]*bool[\s\t\n\r]*\/\*[=]t\*\/
/// Bool - no, don't use
/// \/\*t\*\/[\s\t\n\r]*String[\s\t\n\r]*\/\*[=]t\*\/
/// Str
/// \/\*t\*\/[\s\t\n\r]*num[\s\t\n\r]*\/\*[=]t\*\/
/// Num
/// \/\*t\*\/[\s\t\n\r]*int[\s\t\n\r]*\/\*[=]t\*\/
/// Int
/// \/\*t\*\/[\s\t\n\r]*double[\s\t\n\r]*\/\*[=]t\*\/
/// Dbl
/// \/\*t\*\/[\s\t\n\r]*Object[\s\t\n\r]*\/\*[=]t\*\/
/// Obj
///
/// /*u*/ num/*=u*/ \/\*u\*\/[\s\t\n\r]*num[\s\t\n\r]*\/\*[=]u\*\/
/// U
///
/// /*w*/ num/*=w*/ \/\*u\*\/[\s\t\n\r]*num[\s\t\n\r]*\/\*[=]w\*\/
/// W
///
/// \/\*numasu\*\/
/// as U
///
///
///
///
/// ///    other/*b*/ ; change to other.base for original simple type value num, int, String, possibly more
/// [\s\t\r\n]*\/\*b\*\/
/// .base
///
/// ///   !!! Important for the below: before changing cstring first change nested cstring2 like /*cstring2*/ nmatch /*c2*/: probably only one case
/// ///   /*cstring*/'some string or String variable or return method call'/*c*/ Str('some string or String variable or return method call')
///
/// \/\*cstring2\*\/(([\t\s\n\r]|.)*?)\/\*c\*\/
/// Str($1)
/// As of now don't use Bool replacement, it causes more trouble and errors, the code is not ready for it.
/// \/\*cbool\*\/(([\t\s\n\r]|.)*?)\/\*c\*\/
/// Bool($1) - no, don't use
/// \/\*cstring\*\/(([\t\s\n\r]|.)*?)\/\*c\*\/
/// Str($1)
/// \/\*cnum\*\/(([\t\s\n\r]|.)*?)\/\*c\*\/
/// Num($1)
/// \/\*cint\*\/(([\t\s\n\r]|.)*?)\/\*c\*\/
/// Int($1)
/// \/\*cdouble\*\/(([\t\s\n\r]|.)*?)\/\*c\*\/
/// Dbl($1)
/// \/\*cobject\*\/(([\t\s\n\r]|.)*?)\/\*c\*\/
/// Obj($1)
///
/// /// some static calls
/// !!! This time Bool can be used - this is related to class names, not methods
/// (Str|Bool|Str|Num|Int|Dbl|Obj)Strict\.
/// $1
///
/// /// it happened:
/// /*const*/
/// const
///
/// // We remove - replace this patter with empty string
/// \/\*remove\*\/(([\t\s\n\r]|.)*?)\/\*=remove\*\/
///
/// // but following (or just before?) the remove is insert, we replace it with string below
/// \/\*insert\*\/[\t\s\n\r]*\/\*(([\t\s\n\r]|.)*?)\*\/[\t\s\n\r]*\/\*=insert\*\/
/// $1
///
///
class ObjStrict<T extends Object, U extends ObjStrict<Object, dynamic>> {
  final T base;
  const ObjStrict(this.base);

  /*problematic*/ /*cantoverride*/
  @override
  /*pt*/ int/*=pt*/ get hashCode => /*pcint*/
      base.hashCode /*pc*/ /*problematic*/;

  @override
  Type get runtimeType => base.runtimeType;

  // Methods

  @override
  dynamic noSuchMethod(Invocation invocation) => base.noSuchMethod(invocation);

  /*problematic*/ /*cantoverride*/
  @override
  /*pt*/ String/*=pt*/ toString() => /*pcstring*/
      base.toString() /*pc*/ /*=problematic*/;

  // Operators

  /*problematic*/ /*cantoverride*/
  //@override
  // /*pt*/ bool/*=pt*/ operator ==(/*pt*/ Object/*=pt*/ other) => /*pcbool*/
  //    base == other /*pb*/ /*pc*/ ;
  /*=problematic*/

  @override
  bool operator ==(Object other) =>
      base == (other is Obj ? (other as U).base : other);

  //static const sentinelValue  = 'cust>?om_un!iquE_sEN!tinel7Value10398hwQxm*&^ogoNeverA3535435Use#OnCeUp234onAti*#MeBe345ReasonableNooneCanMakeexactlythe444444samesentineLtext';

  // TODO: do replace and ssave replacement patterns
  // if it works do 2 simple tests
  // if adding Int + Int works IntStrict + IntStrict - later think if it is possible to Int inherit from Strict versio - and why
  // And int + IntStrict when you turn of lint errors if possible

  ///  Don't remove!!! non-formated version of the below method as a source for modifications
  ///  static int hash(/*t*/ Object/*=t*/? object1, /*t*/ Object/*=t*/? object2, [/*t*/ Object/*=t*/? object3 = ObjStrict.sentinelValue, /*t*/ Object/*=t*/? object4 = ObjStrict.sentinelValue, /*t*/ Object/*=t*/? object5 = ObjStrict.sentinelValue, /*t*/ Object/*=t*/? object6 = ObjStrict.sentinelValue, /*t*/ Object/*=t*/? object7 = ObjStrict.sentinelValue, /*t*/ Object/*=t*/? object8 = ObjStrict.sentinelValue, /*t*/ Object/*=t*/? object9 = ObjStrict.sentinelValue, /*t*/ Object/*=t*/? object10 = ObjStrict.sentinelValue, /*t*/ Object/*=t*/? object11 = ObjStrict.sentinelValue, /*t*/ Object/*=t*/? object12 = ObjStrict.sentinelValue, /*t*/ Object/*=t*/? object13 = ObjStrict.sentinelValue, /*t*/ Object/*=t*/? object14 = ObjStrict.sentinelValue, /*t*/ Object/*=t*/? object15 = ObjStrict.sentinelValue, /*t*/ Object/*=t*/? object16 = ObjStrict.sentinelValue, /*t*/ Object/*=t*/? object17 = ObjStrict.sentinelValue, /*t*/ Object/*=t*/? object18 = ObjStrict.sentinelValue, /*t*/ Object/*=t*/? object19 = ObjStrict.sentinelValue, /*t*/ Object/*=t*/? object20 = ObjStrict.sentinelValue]) =>
  ///  object20 == ObjStrict.sentinelValue?/*cint*/Object.hash (object1/*b*/,object2/*b*/,object3/*b*/,object4/*b*/,object5/*b*/,object6/*b*/,object7/*b*/,object8/*b*/,object9/*b*/,object10/*b*/,object11/*b*/,object12/*b*/,object13/*b*/,object14/*b*/,object15/*b*/,object16/*b*/,object17/*b*/,object18/*b*/,object19/*b*/,object20/*b*/)/*c*/
  ///  :object19 == ObjStrict.sentinelValue?/*cint*/Object.hash(object1/*b*/,object2/*b*/,object3/*b*/,object4/*b*/,object5/*b*/,object6/*b*/,object7/*b*/,object8/*b*/,object9/*b*/,object10/*b*/,object11/*b*/,object12/*b*/,object13/*b*/,object14/*b*/,object15/*b*/,object16/*b*/,object17/*b*/,object18/*b*/,object19/*b*/)/*c*/
  ///  :object18 == ObjStrict.sentinelValue?/*cint*/Object.hash(object1/*b*/,object2/*b*/,object3/*b*/,object4/*b*/,object5/*b*/,object6/*b*/,object7/*b*/,object8/*b*/,object9/*b*/,object10/*b*/,object11/*b*/,object12/*b*/,object13/*b*/,object14/*b*/,object15/*b*/,object16/*b*/,object17/*b*/,object18/*b*/)/*c*/
  ///  :object17 == ObjStrict.sentinelValue?/*cint*/Object.hash(object1/*b*/,object2/*b*/,object3/*b*/,object4/*b*/,object5/*b*/,object6/*b*/,object7/*b*/,object8/*b*/,object9/*b*/,object10/*b*/,object11/*b*/,object12/*b*/,object13/*b*/,object14/*b*/,object15/*b*/,object16/*b*/,object17/*b*/)/*c*/
  ///  :object16 == ObjStrict.sentinelValue?/*cint*/Object.hash(object1/*b*/,object2/*b*/,object3/*b*/,object4/*b*/,object5/*b*/,object6/*b*/,object7/*b*/,object8/*b*/,object9/*b*/,object10/*b*/,object11/*b*/,object12/*b*/,object13/*b*/,object14/*b*/,object15/*b*/,object16/*b*/)/*c*/
  ///  :object15 == ObjStrict.sentinelValue?/*cint*/Object.hash(object1/*b*/,object2/*b*/,object3/*b*/,object4/*b*/,object5/*b*/,object6/*b*/,object7/*b*/,object8/*b*/,object9/*b*/,object10/*b*/,object11/*b*/,object12/*b*/,object13/*b*/,object14/*b*/,object15/*b*/)/*c*/
  ///  :object14 == ObjStrict.sentinelValue?/*cint*/Object.hash(object1/*b*/,object2/*b*/,object3/*b*/,object4/*b*/,object5/*b*/,object6/*b*/,object7/*b*/,object8/*b*/,object9/*b*/,object10/*b*/,object11/*b*/,object12/*b*/,object13/*b*/,object14/*b*/)/*c*/
  ///  :object13 == ObjStrict.sentinelValue?/*cint*/Object.hash(object1/*b*/,object2/*b*/,object3/*b*/,object4/*b*/,object5/*b*/,object6/*b*/,object7/*b*/,object8/*b*/,object9/*b*/,object10/*b*/,object11/*b*/,object12/*b*/,object13/*b*/)/*c*/
  ///  :object12 == ObjStrict.sentinelValue?/*cint*/Object.hash(object1/*b*/,object2/*b*/,object3/*b*/,object4/*b*/,object5/*b*/,object6/*b*/,object7/*b*/,object8/*b*/,object9/*b*/,object10/*b*/,object11/*b*/,object12/*b*/)/*c*/
  ///  :object11 == ObjStrict.sentinelValue?/*cint*/Object.hash(object1/*b*/,object2/*b*/,object3/*b*/,object4/*b*/,object5/*b*/,object6/*b*/,object7/*b*/,object8/*b*/,object9/*b*/,object10/*b*/,object11/*b*/)/*c*/
  ///  :object10 == ObjStrict.sentinelValue?/*cint*/Object.hash(object1/*b*/,object2/*b*/,object3/*b*/,object4/*b*/,object5/*b*/,object6/*b*/,object7/*b*/,object8/*b*/,object9/*b*/,object10/*b*/)/*c*/
  ///  :object9 == ObjStrict.sentinelValue?/*cint*/Object.hash (object1/*b*/,object2/*b*/,object3/*b*/,object4/*b*/,object5/*b*/,object6/*b*/,object7/*b*/,object8/*b*/,object9/*b*/)/*c*/
  ///  :object8 == ObjStrict.sentinelValue?/*cint*/Object.hash (object1/*b*/,object2/*b*/,object3/*b*/,object4/*b*/,object5/*b*/,object6/*b*/,object7/*b*/,object8/*b*/)/*c*/
  ///  :object7 == ObjStrict.sentinelValue?/*cint*/Object.hash (object1/*b*/,object2/*b*/,object3/*b*/,object4/*b*/,object5/*b*/,object6/*b*/,object7/*b*/)/*c*/
  ///  :object6 == ObjStrict.sentinelValue?/*cint*/Object.hash (object1/*b*/,object2/*b*/,object3/*b*/,object4/*b*/,object5/*b*/,object6/*b*/)/*c*/
  ///  :object5 == ObjStrict.sentinelValue?/*cint*/Object.hash (object1/*b*/,object2/*b*/,object3/*b*/,object4/*b*/,object5/*b*/)/*c*/
  ///  :object4 == ObjStrict.sentinelValue?/*cint*/Object.hash (object1/*b*/,object2/*b*/,object3/*b*/,object4/*b*/)/*c*/
  ///  :object3 == ObjStrict.sentinelValue?/*cint*/Object.hash (object1/*b*/,object2/*b*/,object3/*b*/)/*c*/
  ///  :/*cint*/Object.hash(object1/*b*/,object2/*b*/)/*c*/    ;
  ///
  static /*t*/ int/*=t*/ hash(
          /*t*/ Object/*=t*/ object1, /*t*/ Object/*=t*/ object2,
          [/*t*/ Object/*=t*/ ? object3,
          /*t*/ Object/*=t*/ ? object4,
          /*t*/ Object/*=t*/ ? object5,
          /*t*/ Object/*=t*/ ? object6,
          /*t*/ Object/*=t*/ ? object7,
          /*t*/ Object/*=t*/ ? object8,
          /*t*/ Object/*=t*/ ? object9,
          /*t*/ Object/*=t*/ ? object10,
          /*t*/ Object/*=t*/ ? object11,
          /*t*/ Object/*=t*/ ? object12,
          /*t*/ Object/*=t*/ ? object13,
          /*t*/ Object/*=t*/ ? object14,
          /*t*/ Object/*=t*/ ? object15,
          /*t*/ Object/*=t*/ ? object16,
          /*t*/ Object/*=t*/ ? object17,
          /*t*/ Object/*=t*/ ? object18,
          /*t*/ Object/*=t*/ ? object19,
          /*t*/ Object/*=t*/ ? object20]) =>
      /*cint*/ Object.hash(
          object1 /*b*/,
          object2 /*b*/,
          object3 /*b*/,
          object4 /*b*/,
          object5 /*b*/,
          object6 /*b*/,
          object7 /*b*/,
          object8 /*b*/,
          object9 /*b*/,
          object10 /*b*/,
          object11 /*b*/,
          object12 /*b*/,
          object13 /*b*/,
          object14 /*b*/,
          object15 /*b*/,
          object16 /*b*/,
          object17 /*b*/,
          object18 /*b*/,
          object19 /*b*/,
          object20 /*b*/) /*c*/;

  // TODO: can be optimised but need to get info runtimeType is Exactly iterable with "Object?" not ObjStrict for example;
  static /*t*/ int/*=t*/ hashAll(
          Iterable< /*t*/ Object/*=t*/ ?> objects) => /*cint*/
      Object.hashAll([
        for (/*t*/ Object/*=t*/ ? object in objects)
          object == null ? null : object /*b*/
      ]) /*c*/;

  // TODO: can be optimised but need to get info runtimeType is Exactly iterable with "Object?" not ObjStrict for example;
  static /*t*/ int/*=t*/ hashAllUnordered(
          Iterable< /*t*/ Object/*=t*/ ?> objects) => /*cint*/
      Object.hashAllUnordered([
        for (/*t*/ Object/*=t*/ ? object in objects)
          object == null ? null : object /*b*/
      ]) /*c*/;
}

/// As of now when Strict is changed into non-Strict version Bool is dropped, only native bool is to be used which spares much trouble String, num, int, double are much more practical used not recommended to be used.
class BoolStrict extends ObjStrict<bool, BoolStrict> {
  const BoolStrict(super.base);

  // Operators

  /*t*/ bool/*=t*/ operator &(/*t*/ bool/*=t*/ other) => /*cbool*/
      base & other /*b*/ /*c*/;

  /*t*/ bool/*=t*/ operator ^(/*t*/ bool/*=t*/ other) => /*cbool*/
      base ^ other /*b*/ /*c*/;

  /*t*/ bool/*=t*/ operator |(/*t*/ bool/*=t*/ other) => /*cbool*/
      base | other /*b*/ /*c*/;

  // static methods

  static /*t*/ bool/*=t*/ parse(/*t*/ String/*=t*/ source,
          {/*t*/ bool/*=t*/ caseSensitive = /*const*/ /*cbool*/ true /*c*/}) =>
      /*cbool*/ bool.parse(source /*b*/,
          caseSensitive: caseSensitive /*b*/) /*c*/;

  static /*t*/ bool/*=t*/ ? tryParse(/*t*/ String/*=t*/ source,
      {/*t*/ bool/*=t*/ caseSensitive = /*const*/ /*cbool*/ true /*c*/}) {
    bool? result =
        bool.tryParse(source /*b*/, caseSensitive: caseSensitive /*b*/);

    return result == null ? null : /*cbool*/ result /*c*/;
  }
}

/// Do understand if num is num or num is always double or int. For now let's do something like this; check int/double inheriting rules.
class NumStrict<T extends num, U extends NumStrict<num, dynamic, dynamic>,
        W extends NumStrict<num, dynamic, dynamic>>
    extends ObjStrict<T, U> /* implements Comparable<T>*/ {
  const NumStrict(super.base);

  /*problematic*/ /*cantoverride*/
  @override
  /*pt*/ int/*=pt*/ get hashCode => /*pcint*/
      base.hashCode /*pc*/ /*problematic*/;

  /*t*/ bool/*=t*/ get isFinite => /*cbool*/ base.isFinite /*c*/;

  /*t*/ bool/*=t*/ get isInfinite => /*cbool*/ base.isInfinite /*c*/;

  /*t*/ bool/*=t*/ get isNaN => /*cbool*/ base.isNaN /*c*/;

  /*t*/ bool/*=t*/ get isNegative => /*cbool*/ base.isNegative /*c*/;

  @override
  Type get runtimeType => base.runtimeType;

  /*u*/ num/*=u*/ get sign => /*cnum*/ base.sign /*c*/ /*numasu*/;

  // Methods

  /*u*/ num/*=u*/ abs() => /*cnum*/ base.abs() /*c*/ /*numasu*/;

  /*t*/ int/*=t*/ ceil() => /*cint*/ base.ceil() /*c*/;

  /*t*/ double/*=t*/ ceilToDouble() => /*cdouble*/ base.ceilToDouble() /*c*/;

  /// FIXME: Copy all here to github repo with tips
  /// // The bottom line - int accepts int returns int, double accepts int or double but not num!!! and returns double
  /// // num is default and allowed - no int or double required:
  /// class Fq<T extends num> {
  ///         final T base;
  ///         const Fq(this.base);
  ///         // Implementation goes here...
  ///         String toString() => "Instance of 'Foo<$T>'";
  ///       }
  ///
  ///
  /// void main() {
  ///   num werwrerte=5.5;
  ///   // default bottom type num and also can be passed num, so not int or double is required
  ///   Fq<num>(werwrerte);
  /// }
  ///
  /// however we need to accept Num for Dbl because it couldn't be overriden, yet thinking
  /// SO WE [Edit: don't have to] HAVE TO OVERRITE clamp for double but here it must return U so that there is no error.
  /// TODO: [Edit: ] we need to add a third fourth W, X generic params instead for being strict or now and for int W, X will be bound to int, Int, but for double W, X will be bound to Num
  /// FIXME: to the Edit just above: notice that double does't accept num, but here Dbl will accept Num as param, but the returned value will be correct type.
  ///
  /// below IntStrict accepts int only in some cases,
  /// class IntStrict
  ///  extends IntOrDoubleStrict<int, IntStrict, IntStrict>
  ///
  /// /// Now double can accept ints but not nums also for methods like clamp that have num as param but are overriden in double class also won't allow num while officially num is allowed
  /// /// To copy the behaviour or not accepting the null itself we now have a class That is before double and num so is not num:
  /// /// DblStrict is to accept num but it throws if num is passed, to copy the normal behaviour
  /// /// See the part num, IntOrDoubleStrict - it is not "num, NumStrict"
  /// class DblStrict
  ///  extends IntOrDoubleStrict<double, DblStrict, IntOrDoubleStrict>
  ///
  /// end of FIXME:
  ///
  ///
  ///
  /// // exhaustiveness below calling examples all num, int, double pass the function
  /// sdfgdgsdfg(num abc) {
  ///   // only this is good
  ///   switch(abc) {
  ///     case int(): break;
  ///     case double(): break;
  ///   }
  ///   // only this is good
  ///   switch(abc) {
  ///     case num(): break;
  ///   }
  ///   // good but int must be first
  ///   switch(abc) {
  ///     case int(): break;
  ///     case num(): break;
  ///   }
  ///   // good but int never reached
  ///   switch(abc) {
  ///     case num(): break;
  ///     case int(): break;
  ///   }
  /// }
  /// gdgfhdfhgfh(){
  ///   sdfgdgsdfg(2.2 as num);
  ///   sdfgdgsdfg(2.2);
  ///   sdfgdgsdfg(10);
  ///
  /// }
  ///
  ///
  ///
  ///
  /// // yes:
  /// num werwer = 0; // not cast into int or something - it is still null
  /// // yes:
  /// num werwer2 = werwer * 12.2;
  /// // no: int wer=10.clamp(5, 8.7);
  /// // no: int wer=5.5.clamp(5, 10);
  /// // yes
  /// int wer = 10.clamp(5, 10);
  /// // also no:
  /// // int wer2 = 4.clamp(5, 8.7);
  /// // so clamp for int must be accept int, double num
  /// double wer4 = 2.2.clamp(5, 8.7);
  /// // no: double wer33 = 2 as num;
  /// // no like previous: double wer5 = 1.1.clamp(2, wer3);
  ///
  ///
  /// // Let's repeat it (+1 extra) for Num, Dbl, Int
  ///
  /// // no: Int werRR=Int(10).clamp(Int(5), Dbl(8.7));
  /// // no: Int werwww=Dbl(5.5).clamp(Int(5), Int(10));
  /// // yes
  /// Int werR = Int(10).clamp(Int(5), Int(10));
  /// // also no:
  /// // Int wer2=Int(4).clamp(Int(5), Dbl(8.7));
  /// // so clamp for int must be accept int, double num
  /// Dbl wer4R = Dbl(2.2).clamp(Int(5), Dbl(8.7));
  /// // no: Dbl wer33 = Int(2) as Num; // also no as Int, only as Dbl works
  /// // nolike previous (wer33 must have been Num for a while): Dbl wer5 = Dbl(1.1).clamp(Int(2), wer3);
  /// // But this extra one more unique not copied works as wanted:
  /// Dbl wer5 = Dbl(1.1).clamp(Int(2), (Int(2) as Num) as Dbl);
  ///
  ///
  ///
  ///
  /*u*/ num/*=u*/ clamp(
          /*w*/ num/*=w*/ lowerLimit, /*w*/ num/*=w*/ upperLimit) =>
      /*cnum*/ base.clamp(lowerLimit /*b*/, upperLimit /*b*/) /*c*/ /*numasu*/;

  @override
  /*t*/ int/*=t*/ compareTo(/*w*/ num/*=w*/ other) => /*cint*/

      base.compareTo(other /*b*/) /*c*/;

  /*t*/ int/*=t*/ floor() => /*cint*/ base.floor() /*c*/;

  /*t*/ double/*=t*/ floorToDouble() => /*cdouble*/ base.floorToDouble() /*c*/;

  @override
  dynamic noSuchMethod(Invocation invocation) => base.noSuchMethod(invocation);

  /*u*/ num/*=u*/ remainder(/*w*/ num/*=w*/ other) => /*cnum*/
      base.remainder(other /*b*/) /*c*/ /*numasu*/;

  /*t*/ int/*=t*/ round() => /*cint*/ base.round() /*c*/;

  /*t*/ double/*=t*/ roundToDouble() => /*cdouble*/ base.roundToDouble() /*c*/;

  /*t*/ double/*=t*/ toDouble() => /*cdouble*/ base.toDouble() /*c*/;

  /*t*/ int/*=t*/ toInt() => /*cint*/ base.toInt() /*c*/;

  /*t*/ String/*=t*/ toStringAsExponential(
          [/*t*/ int/*=t*/ ? fractionDigits]) =>
      /*cstring*/ base.toStringAsExponential(
          fractionDigits != null ? fractionDigits /*b*/ : null) /*c*/;

  /*t*/ String/*=t*/ toStringAsFixed(/*t*/ int/*=t*/ fractionDigits) =>
      /*cstring*/ base.toStringAsFixed(fractionDigits /*b*/) /*c*/;

  /*t*/ String/*=t*/ toStringAsPrecision(/*t*/ int/*=t*/ precision) =>
      /*cstring*/ base.toStringAsPrecision(precision /*b*/) /*c*/;

  /*t*/ int/*=t*/ truncate() => /*cint*/ base.truncate() /*c*/;

  /*t*/ double/*=t*/ truncateToDouble() => /*cdouble*/
      base.truncateToDouble() /*c*/;

  // Operators

  /*t*/ num/*=t*/ operator %(/*t*/ num/*=t*/ other) => /*cnum*/
      base % other /*b*/ /*c*/;

  /*t*/ num/*=t*/ operator *(/*t*/ num/*=t*/ other) => /*cnum*/
      base * other /*b*/ /*c*/;

  /*t*/ num/*=t*/ operator +(/*t*/ num/*=t*/ other) => /*cnum*/
      base + other /*b*/ /*c*/;

  /*t*/ num/*=t*/ operator -(/*t*/ num/*=t*/ other) => /*cnum*/
      base - other /*b*/ /*c*/;

  /*t*/ double/*=t*/ operator /(/*t*/ num/*=t*/ other) => /*cdouble*/
      base / other /*b*/ /*c*/;

  /*t*/ bool/*=t*/ operator <(/*t*/ num/*=t*/ other) => /*cbool*/
      base < other /*b*/ /*c*/;

  /*t*/ bool/*=t*/ operator <=(/*t*/ num/*=t*/ other) => /*cbool*/
      base <= other /*b*/ /*c*/;

  //@override
  ///*t*/ bool/*=t*/ operator ==(/*t*/ Object/*=t*/ other) => /*cbool*/
  //    base == other /*b*/ /*c*/;

  /*t*/ bool/*=t*/ operator >(/*t*/ num/*=t*/ other) => /*cbool*/
      base > other /*b*/ /*c*/;

  /*t*/ bool/*=t*/ operator >=(/*t*/ num/*=t*/ other) => /*cbool*/
      base >= other /*b*/ /*c*/;

  /// Int or IntStrict has more info on this operator unary-();
  /*t*/ num/*=t*/ operator -() => /*cnum*/ -base /*c*/;

  /*t*/ int/*=t*/ operator ~/(/*t*/ num/*=t*/ other) => /*cint*/
      base ~/ other /*b*/ /*c*/;

  // Static Methods

  static /*t*/ num/*=t*/ parse(/*t*/ String/*=t*/ input,
      [/*t*/ num/*=t*/ onError(/*t*/ String/*=t*/ input)?]) {
    Type type = /*t*/ int/*=t*/;
    //if (type is int) {
    //  return num.parse(input, onError);
    //} else {
    // the second param is deprecated - not implemented see the num.parse docs
    return /*cnum*/ num.parse(input /*b*/) /*c*/;
    //}

    //num.parse(input /*b*/, onError) /*c*/;
  }

  static /*t*/ num/*=t*/ ? tryParse(/*t*/ String/*=t*/ input) {
    // no /*t*/ num/*=t*/ now:
    num? result = num.tryParse(input /*b*/);
    return result == null ? null : /*cnum*/ result /*c*/;
  }
}

sealed class IntOrDoubleStrict<
        T extends num,
        U extends NumStrict<num, dynamic, dynamic>,
        W extends NumStrict<num, dynamic, dynamic>>
    extends NumStrict<T, U, W> /* implements Comparable<T>*/ {
  const IntOrDoubleStrict(super.base);
}

class IntStrict extends IntOrDoubleStrict<int, IntStrict,
    IntStrict> /* implements Comparable<int>*/ {
  const IntStrict(super.base);

  /*t*/ int/*=t*/ get bitLength => /*cint*/ base.bitLength /*c*/;
  //int get hashCode => base.hashCode;
  /*t*/ bool/*=t*/ get isEven => /*cbool*/ base.isEven /*c*/;
  //bool get isFinite => base.isFinite;
  //bool get isInfinite => base.isInfinite;
  //bool get isNaN => base.isNaN;

  //bool get isNegative => base.isNegative;

  /*t*/ bool/*=t*/ get isOdd => /*cbool*/ base.isOdd /*c*/;

  //Type get runtimeType => base.runtimeType;

  //int get sign => base.sign;

  // methods

  @override
  /*t*/ int/*=t*/ abs() => /*cint*/ base.abs() /*c*/;

  @override
  /*t*/ int/*=t*/ ceil() => /*cint*/ base.ceil() /*c*/;

  @override
  /*t*/ double/*=t*/ ceilToDouble() => /*cdouble*/ base.ceilToDouble() /*c*/;

  //num clamp(num lowerLimit, num upperLimit) =>
  //    base.clamp(lowerLimit, upperLimit);
  //
  //int compareTo(num other) => base.compareTo(other);

  @override
  /*t*/ int/*=t*/ floor() => /*cint*/ base.floor() /*c*/;

  @override
  /*t*/ double/*=t*/ floorToDouble() => /*cdouble*/ base.floorToDouble() /*c*/;

  /*t*/ int/*=t*/ gcd(/*t*/ int/*=t*/ other) => /*cint*/
      base.gcd(other /*b*/) /*c*/;

  /*t*/ int/*=t*/ modInverse(/*t*/ int/*=t*/ modulus) =>
      /*cint*/ base.modInverse(modulus /*b*/) /*c*/;

  /*t*/ int/*=t*/ modPow(/*t*/ int/*=t*/ exponent, /*t*/ int/*=t*/ modulus) =>
      /*cint*/ base.modPow(exponent /*b*/, modulus /*b*/) /*c*/;

  //dynamic noSuchMethod(Invocation invocation) => base.noSuchMethod(invocation);

  //num remainder(num other) => base.remainder(other);

  @override
  /*t*/ int/*=t*/ round() => /*cint*/ base.round() /*c*/;

  @override
  /*t*/ double/*=t*/ roundToDouble() => /*cdouble*/ base.roundToDouble() /*c*/;

  //double toDouble() => base.toDouble();

  //int toInt() => base.toInt();

  /*t*/ String/*=t*/ toRadixString(/*t*/ int/*=t*/ radix) =>
      /*cstring*/ base.toRadixString(radix /*b*/) /*c*/;

  /*t*/ int/*=t*/ toSigned(/*t*/ int/*=t*/ width) => /*cint*/
      base.toSigned(width /*b*/) /*c*/;

  //String toStringAsExponential([int? fractionDigits]) =>
  //    base.toStringAsExponential(fractionDigits);
  //
  //String toStringAsFixed(int fractionDigits) =>
  //    base.toStringAsFixed(fractionDigits);
  //
  //String toStringAsPrecision(int precision) => base.toStringAsFixed(precision);

  /*t*/ int/*=t*/ toUnsigned(/*t*/ int/*=t*/ width) => /*cint*/
      base.toUnsigned(width /*b*/) /*c*/;

  @override
  /*t*/ int/*=t*/ truncate() => /*cint*/ base.truncate() /*c*/;

  @override
  /*t*/ double/*=t*/ truncateToDouble() => /*cdouble*/
      base.truncateToDouble() /*c*/;

  // Operators

  //num operator %(num other) => base % other;

  /*t*/ int/*=t*/ operator &(/*t*/ int/*=t*/ other) => /*cint*/
      base & other /*b*/ /*c*/;

  //num operator *(num other) => base * other;

  //num operator +(num other) => base + other;

  //num operator -(num other) => base - other;

  //double operator /(num other) => base / other;

  //bool operator <(num other) => base < other;

  /*t*/ int/*=t*/ operator <<(/*t*/ int/*=t*/ shiftAmount) =>
      /*cint*/ base << shiftAmount /*b*/ /*c*/;

  //bool operator <=(num other) => base <= other;
  //
  //bool operator ==(Object other) => base == other;
  //
  //bool operator >(num other) => base > other;
  //
  //bool operator >=(num other) => base >= other;

  /*t*/ int/*=t*/ operator >>(/*t*/ int/*=t*/ shiftAmount) =>
      /*cint*/ base >> shiftAmount /*b*/ /*c*/;

  /*t*/ int/*=t*/ operator >>>(/*t*/ int/*=t*/ shiftAmount) =>
      /*cint*/ base >>> shiftAmount /*b*/ /*c*/;

  /*t*/ int/*=t*/ operator ^(/*t*/ int/*=t*/ other) => /*cint*/
      base ^ other /*b*/ /*c*/;

  /// FIXME: correct? It was int operator unary-() => -base; it is like -(num other) but without params so accepted
  //int operator -() => -base;

  /*t*/ int/*=t*/ operator |(/*t*/ int/*=t*/ other) => /*cint*/
      base | other /*b*/ /*c*/;

  /// FIXME: correct?
  /*t*/ int/*=t*/ operator ~() => /*cint*/ ~base /*c*/;

  //int operator ~/(num other) => base ~/ other;

  //// Static Methods
  //@override
  static /*t*/ int/*=t*/ parse(/*t*/ String/*=t*/ source,
          {/*t*/ int/*=t*/ ? radix}) => /*cint*/
      int.parse(source /*b*/, radix: radix == null ? null : radix /*b*/) /*c*/;

  //@override
  static /*t*/ int/*=t*/ ? tryParse(/*t*/ String/*=t*/ source,
      {/*t*/ int/*=t*/ ? radix}) {
    int? result =
        int.tryParse(source /*b*/, radix: radix == null ? null : radix /*b*/);
    return result is int ? /*cint*/ result /*c*/ : null;

    ///*t*/ int/*=t*/.tryParse(source, radix: radix);
  }
}

class DblStrict extends IntOrDoubleStrict<double, DblStrict,
    IntOrDoubleStrict> /*implements Comparable<double>*/ {
  const DblStrict(super.base);

  @override

  ///*t*/ int/*=t*/ get hashCode => /*c*/ base.hashCode/*=c*/;

  ///*t*/bool/*=t*/ get isFinite => /*c*/ base.isFinite/*=c*/;
  ///*t*/bool/*=t*/ get isInfinite => /*c*/ base.isInfinite/*=c*/;
  ///*t*/bool/*=t*/ get isNaN => /*c*/ base.isNaN/*=c*/;
  ///*t*/bool/*=t*/ get isNegative => /*c*/ base.isNegative/*=c*/;
  @override
  Type get runtimeType => base.runtimeType;

  ///*t*/double/*=t*/ get sign => /*c*/base.sign/*=c*/;

  // Methods

  @override
  /*t*/ double/*=t*/ abs() => /*cdouble*/ base.abs() /*c*/;

  @override
  /*t*/ int/*=t*/ ceil() => /*cint*/ base.ceil() /*c*/;

  @override
  /*t*/ double/*=t*/ ceilToDouble() => /*cdouble*/ base.ceilToDouble() /*c*/;
  //
  //num clamp(num lowerLimit, num upperLimit) =>
  //    base.clamp(lowerLimit, upperLimit);
  //
  //int compareTo(num other) => compareTo(other);
  //
  @override
  /*t*/ int/*=t*/ floor() => /*cint*/ base.floor() /*c*/;

  @override
  /*t*/ double/*=t*/ floorToDouble() => /*cdouble*/ base.floorToDouble() /*c*/;

  //dynamic noSuchMethod(Invocation invocation) => base.noSuchMethod(invocation);

  @override
  /*t*/ double/*=t*/ remainder(/*t*/ num/*=t*/ other) => /*cdouble*/
      base.remainder(other /*b*/) /*c*/;

  @override
  /*t*/ int/*=t*/ round() => /*cint*/ base.round() /*c*/;

  @override
  /*t*/ double/*=t*/ roundToDouble() => /*cdouble*/ base.roundToDouble() /*c*/;

  //double toDouble() => base.toDouble();

  ///*t*/int/*=t*/ toInt() => base.toInt();

  //String toStringAsExponential([int? fractionDigits]) =>
  //    base.toStringAsExponential(fractionDigits);
  //
  //String toStringAsFixed(int fractionDigits) =>
  //    base.toStringAsFixed(fractionDigits);
  //
  //String toStringAsPrecision(int precision) =>
  //    base.toStringAsPrecision(precision);

  @override
  /*t*/ int/*=t*/ truncate() => /*cint*/ base.truncate() /*c*/;

  @override
  /*t*/ double/*=t*/ truncateToDouble() => /*cdouble*/
      base.truncateToDouble() /*c*/;

  // Operators

  @override
  /*t*/ double/*=t*/ operator %(/*t*/ num/*=t*/ other) => /*cdouble*/
      base % other /*b*/ /*c*/;

  @override
  /*t*/ double/*=t*/ operator *(/*t*/ num/*=t*/ other) => /*cdouble*/
      base * other /*b*/ /*c*/;

  @override
  /*t*/ double/*=t*/ operator +(/*t*/ num/*=t*/ other) => /*cdouble*/
      base + other /*b*/ /*c*/;

  @override
  /*t*/ double/*=t*/ operator -(/*t*/ num/*=t*/ other) => /*cdouble*/
      base - other /*b*/ /*c*/;

  @override
  /*t*/ double/*=t*/ operator /(/*t*/ num/*=t*/ other) => /*cdouble*/
      base / other /*b*/ /*c*/;

  //bool operator <(num other) => base < other;
  //
  //bool operator <=(num other) => base <= other;
  //
  //bool operator ==(Object other) => base == other;
  //
  //bool operator >(num other) => base > other;
  //
  //bool operator >=(num other) => base >= other;

  /// Int or IntStrict had similar situation and see comment there
  @override
  /*t*/ double/*=t*/ operator -() => /*cdouble*/ base /*c*/;

  @override
  /*t*/ int/*=t*/ operator ~/(/*t*/ num/*=t*/ other) => /*cint*/
      base ~/ other /*b*/ /*c*/;

  // Static Methods

  //@override
  static /*t*/ double/*=t*/ parse(/*t*/ String/*=t*/ source) => /*cdouble*/
      double.parse(source /*b*/) /*c*/;

  //@override
  static /*t*/ double/*=t*/ ? tryParse(/*t*/ String/*=t*/ source) {
    double? result = double.tryParse(source /*b*/);
    return result == null ? null : /*cdouble*/ result /*c*/;
  }
  // Constants

  static const /*t*/ double/*=t*/ infinity = /*cdouble*/ double.infinity /*c*/;

  static const /*t*/ double/*=t*/ maxFinite = /*cdouble*/
      double.maxFinite /*c*/;

  static const /*t*/ double/*=t*/ minPositive = /*cdouble*/
      double.minPositive /*c*/;

  static const /*t*/ double/*=t*/ nan = /*cdouble*/
      double.nan /*c*/;

  static const /*t*/ double/*=t*/ negativeInfinity = /*cdouble*/
      double.negativeInfinity /*c*/;
}

class StrStrict extends ObjStrict<String, StrStrict>
    implements /*Comparable<String>,*/ Pattern {
  const StrStrict(super.base);

  // properties

  /*t*/ List/*=t*/ < /*t*/ int/*=t*/ > get codeUnits {
    Type type = /*t*/ int/*=t*/;
    //if (type == int) {
    //  return base.codeUnits;
    //} else {
    List< /*t*/ int/*=t*/ > results = [];
    for (int unit in base.codeUnits) {
      results.add(/*cint*/ unit /*c*/);
    }
    return results;
    //}
  }

  /*t*/ bool/*=t*/ get isEmpty => /*cbool*/ base.isEmpty /*c*/;

  /*t*/ bool/*=t*/ get isNotEmpty => /*cbool*/ base.isNotEmpty /*c*/;

  /*t*/ int/*=t*/ get length => /*cint*/ base.length /*c*/;

  Runes get runes => base.runes;

  //Type get runtimeType => base.runtimeType;

  // Methods

  //Iterable<Match> allMatches(String string, [int start = 0]) =>
  //    base.allMatches(string, start);

  /*t*/ int/*=t*/ codeUnitAt(/*t*/ int/*=t*/ index) => /*cint*/
      base.codeUnitAt(index /*b*/) /*c*/;

  @override
  /*t*/ int/*=t*/ compareTo(/*t*/ String/*=t*/ other) => /*cint*/
      base.compareTo(other /*b*/) /*c*/;

  /*t*/ bool/*=t*/ contains(Pattern other,
          [/*t*/ int/*=t*/ startIndex = /*const*/ /*cint*/ 0 /*c*/]) =>
      /*cbool*/ base.contains(other, startIndex /*b*/) /*c*/;

  /*t*/ bool/*=t*/ endsWith(/*t*/ String/*=t*/ other) => /*cbool*/
      base.endsWith(other /*b*/) /*c*/;

  /*t*/ int/*=t*/ indexOf(Pattern pattern,
          [/*t*/ int/*=t*/ start = /*const*/ /*cint*/ 0 /*c*/]) =>
      /*cint*/ base.indexOf(pattern, start /*b*/) /*c*/;

  /*t*/ int/*=t*/ lastIndexOf(Pattern pattern, [/*t*/ int/*=t*/ ? start]) =>
      /*cint*/ base.lastIndexOf(
          pattern, start == null ? null : start /*b*/) /*c*/;

  //Match? matchAsPrefix(String string, [int start = 0]) =>
  //    base.matchAsPrefix(string, start);
  //
  //dynamic noSuchMethod(Invocation invocation) => base.noSuchMethod(invocation);
  //
  /*t*/ String/*=t*/ padLeft(/*t*/ int/*=t*/ width,
          [/*t*/ String/*=t*/ padding = /*const*/ /*cstring*/ ' ' /*c*/]) =>
      /*cstring*/ base.padLeft(width /*b*/, padding /*b*/) /*c*/;

  /*t*/ String/*=t*/ padRight(/*t*/ int/*=t*/ width,
          [/*t*/ String/*=t*/ padding = /*const*/ /*cstring*/ ' ' /*c*/]) =>
      /*cstring*/ base.padRight(width /*b*/, padding /*b*/) /*c*/;

  /*t*/ String/*=t*/ replaceAll(Pattern from, /*t*/ String/*=t*/ replace) =>
      /*cstring*/ base.replaceAll(from, replace /*b*/) /*c*/;

  /*t*/ String/*=t*/ replaceAllMapped(
          Pattern from, /*t*/ String/*=t*/ replace(Match match)) =>
      /*cstring*/ base.replaceAllMapped(from, /*remove*/ replace/*=remove*/
          /*insert*/ /*(Match match) => replace(match).base*/ /*=insert*/
          ) /*cstring*/;

  ///*cstring*/ base.replaceAllMapped(from, replace) /*c*/;

  /*t*/ String/*=t*/ replaceFirst(Pattern from, /*t*/ String/*=t*/ to,
          [/*t*/ int/*=t*/ startIndex = /*const*/ /*cint*/ 0 /*c*/]) =>
      /*cstring*/ base.replaceFirst(from, to /*b*/, startIndex /*b*/) /*c*/;

  /*t*/ String/*=t*/ replaceFirstMapped(
          Pattern from, /*t*/ String/*=t*/ replace(Match match),
          [/*t*/ int/*=t*/ startIndex = /*const*/ /*cint*/ 0 /*c*/]) =>
      /*cstring*/ base.replaceFirstMapped(
          from,
          /*remove*/ replace/*=remove*/
          /*insert*/ /*(Match match) => replace(match).base*/ /*=insert*/,
          startIndex /*b*/) /*c*/;

  /*t*/ String/*=t*/ replaceRange(/*t*/ int/*=t*/ start, /*t*/ int/*=t*/ ? end,
          /*t*/ String/*=t*/ replacement) =>
      /*cstring*/ base.replaceRange(
          start /*b*/, end == null ? null : end /*b*/, replacement /*b*/) /*c*/;

  /*t*/ List/*=t*/ < /*t*/ String/*=t*/ > split(Pattern pattern) {
    //Type type = /*t*/ String/*=t*/;
    //if (type == String) {
    //  return base.split(pattern);
    //} else {
    List< /*t*/ String/*=t*/ > results = [];
    for (String unit in base.split(pattern)) {
      results.add(/*cstring*/ unit /*c*/);
    }
    return results;
    //}

    ///base.split(pattern);
  }

  // FIXME:
  /*t*/ String/*=t*/ splitMapJoin(Pattern pattern,
          {/*t*/ String/*=t*/ onMatch(Match)?,
          /*t*/ String/*=t*/ onNonMatch(/*t*/ String/*=t*/)?}) =>
      /*cstring*/ base.splitMapJoin(pattern,
          onMatch: /*remove*/ onMatch/*=remove*/

/*insert*/ /*
          onMatch == null
              ? null
              : (Match match) => onMatch(match).base


*/ /*=insert*/
          ,
          onNonMatch: /*remove*/ onNonMatch/*=remove*/

/*insert*/ /*
          onNonMatch == null
              ? null
              : (String nmatch) =>
                      onNonMatch(
                        
                        /*cstring2*/
                          
                           nmatch 
                           
                           /*c*/
                           
                           
                           ).base
          
*/ /*=insert*/

          ) /*c*/;

  /*t*/ bool/*=t*/ startsWith(Pattern pattern,
          [/*t*/ int/*=t*/ index = /*const*/ /*cint*/ 0 /*c*/]) =>
      /*cbool*/ base.startsWith(pattern, index /*b*/) /*c*/;

  /*t*/ String/*=t*/ substring(/*t*/ int/*=t*/ start,
          [/*t*/ int/*=t*/ ? end]) =>
      /*cstring*/ base.substring(
          start /*b*/, end == null ? null : end /*b*/) /*c*/;

  /*t*/ String/*=t*/ toLowerCase() => /*cstring*/ base.toLowerCase() /*c*/;

  //String toString() => base.toString();

  /*t*/ String/*=t*/ toUpperCase() => /*cstring*/ base.toUpperCase() /*c*/;

  /*t*/ String/*=t*/ trim() => /*cstring*/ base.trim() /*c*/;

  /*t*/ String/*=t*/ trimLeft() => /*cstring*/ base.trimLeft() /*c*/;

  /*t*/ String/*=t*/ trimRight() => /*cstring*/ base.trimRight() /*c*/;

  // Operators

  /*t*/ String/*=t*/ operator *(/*t*/ int/*=t*/ times) => /*cstring*/
      base * times /*b*/ /*c*/;

  /*t*/ String/*=t*/ operator +(/*t*/ String/*=t*/ other) => /*cstring*/
      base + other /*b*/ /*c*/;

  @override
  /*t*/ bool/*=t*/ operator ==(/*t*/ Object/*=t*/ other) => /*cbool*/
      base == other /*b*/ /*c*/;

  /*t*/ String/*=t*/ operator [](/*t*/ int/*=t*/ index) => /*cstring*/
      base[index /*b*/] /*c*/;
}

// FIXME - YOU CAN REDEFINA Map interface with the same name, but it is detected to be incompatible
abstract class MpStrict<K, V> extends ObjStrict<Map<K, V>, MpStrict<K, V>>
    implements Map<K, V> {
  MpStrict(super.base);
}

///// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
///// THE BELOW WAS INITIAL FIRSTS REGEX CHANGED WITH CORRECTION BY HAND IN SOURCE AND THE RESULT HERE IS THE RESULT\;
///// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
///// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
///// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

class Obj<T extends Object, U extends Obj<Object, dynamic>> {
  final T base;
  const Obj(this.base);

  @override
  int get hashCode => base.hashCode;

  @override
  Type get runtimeType => base.runtimeType;

  // Methods

  @override
  dynamic noSuchMethod(Invocation invocation) => base.noSuchMethod(invocation);

  @override
  String toString() => base.toString();

  // Operators

  @override
  bool operator ==(Object other) =>
      base == (other is Obj ? (other as U).base : other);

  static const sentinelValue =
      'cust>?om_un!iquE_sEN!tinel7Value10398hwQxm*&^ogoNeverA3535435Use#OnCeUp234onAti*#MeBe345ReasonableNooneCanMakeexactlythe444444samesentineLtext';

  // TODO: do replace and ssave replacement patterns
  // if it works do 2 simple tests
  // if adding Int + Int works IntStrict + IntStrict - later think if it is possible to Int inherit from Strict versio - and why
  // And int + IntStrict when you turn of lint errors if possible

  ///  Don't remove!!! non-formated version of the below method as a source for modifications
  ///  static int hash(Obj? object1, Obj? object2, [Obj? object3 = Obj.sentinelValue, Obj? object4 = Obj.sentinelValue, Obj? object5 = Obj.sentinelValue, Obj? object6 = Obj.sentinelValue, Obj? object7 = Obj.sentinelValue, Obj? object8 = Obj.sentinelValue, Obj? object9 = Obj.sentinelValue, Obj? object10 = Obj.sentinelValue, Obj? object11 = Obj.sentinelValue, Obj? object12 = Obj.sentinelValue, Obj? object13 = Obj.sentinelValue, Obj? object14 = Obj.sentinelValue, Obj? object15 = Obj.sentinelValue, Obj? object16 = Obj.sentinelValue, Obj? object17 = Obj.sentinelValue, Obj? object18 = Obj.sentinelValue, Obj? object19 = Obj.sentinelValue, Obj? object20 = Obj.sentinelValue]) =>
  ///  object20 == Obj.sentinelValue?Int(Object.hash (object1.base,object2.base,object3.base,object4.base,object5.base,object6.base,object7.base,object8.base,object9.base,object10.base,object11.base,object12.base,object13.base,object14.base,object15.base,object16.base,object17.base,object18.base,object19.base,object20.base))
  ///  :object19 == Obj.sentinelValue?Int(Object.hash(object1.base,object2.base,object3.base,object4.base,object5.base,object6.base,object7.base,object8.base,object9.base,object10.base,object11.base,object12.base,object13.base,object14.base,object15.base,object16.base,object17.base,object18.base,object19.base))
  ///  :object18 == Obj.sentinelValue?Int(Object.hash(object1.base,object2.base,object3.base,object4.base,object5.base,object6.base,object7.base,object8.base,object9.base,object10.base,object11.base,object12.base,object13.base,object14.base,object15.base,object16.base,object17.base,object18.base))
  ///  :object17 == Obj.sentinelValue?Int(Object.hash(object1.base,object2.base,object3.base,object4.base,object5.base,object6.base,object7.base,object8.base,object9.base,object10.base,object11.base,object12.base,object13.base,object14.base,object15.base,object16.base,object17.base))
  ///  :object16 == Obj.sentinelValue?Int(Object.hash(object1.base,object2.base,object3.base,object4.base,object5.base,object6.base,object7.base,object8.base,object9.base,object10.base,object11.base,object12.base,object13.base,object14.base,object15.base,object16.base))
  ///  :object15 == Obj.sentinelValue?Int(Object.hash(object1.base,object2.base,object3.base,object4.base,object5.base,object6.base,object7.base,object8.base,object9.base,object10.base,object11.base,object12.base,object13.base,object14.base,object15.base))
  ///  :object14 == Obj.sentinelValue?Int(Object.hash(object1.base,object2.base,object3.base,object4.base,object5.base,object6.base,object7.base,object8.base,object9.base,object10.base,object11.base,object12.base,object13.base,object14.base))
  ///  :object13 == Obj.sentinelValue?Int(Object.hash(object1.base,object2.base,object3.base,object4.base,object5.base,object6.base,object7.base,object8.base,object9.base,object10.base,object11.base,object12.base,object13.base))
  ///  :object12 == Obj.sentinelValue?Int(Object.hash(object1.base,object2.base,object3.base,object4.base,object5.base,object6.base,object7.base,object8.base,object9.base,object10.base,object11.base,object12.base))
  ///  :object11 == Obj.sentinelValue?Int(Object.hash(object1.base,object2.base,object3.base,object4.base,object5.base,object6.base,object7.base,object8.base,object9.base,object10.base,object11.base))
  ///  :object10 == Obj.sentinelValue?Int(Object.hash(object1.base,object2.base,object3.base,object4.base,object5.base,object6.base,object7.base,object8.base,object9.base,object10.base))
  ///  :object9 == Obj.sentinelValue?Int(Object.hash (object1.base,object2.base,object3.base,object4.base,object5.base,object6.base,object7.base,object8.base,object9.base))
  ///  :object8 == Obj.sentinelValue?Int(Object.hash (object1.base,object2.base,object3.base,object4.base,object5.base,object6.base,object7.base,object8.base))
  ///  :object7 == Obj.sentinelValue?Int(Object.hash (object1.base,object2.base,object3.base,object4.base,object5.base,object6.base,object7.base))
  ///  :object6 == Obj.sentinelValue?Int(Object.hash (object1.base,object2.base,object3.base,object4.base,object5.base,object6.base))
  ///  :object5 == Obj.sentinelValue?Int(Object.hash (object1.base,object2.base,object3.base,object4.base,object5.base))
  ///  :object4 == Obj.sentinelValue?Int(Object.hash (object1.base,object2.base,object3.base,object4.base))
  ///  :object3 == Obj.sentinelValue?Int(Object.hash (object1.base,object2.base,object3.base))
  ///  :Int(Object.hash(object1.base,object2.base))    ;
  ///
  static Int hash(Obj object1, Obj object2,
          [Obj? object3,
          Obj? object4,
          Obj? object5,
          Obj? object6,
          Obj? object7,
          Obj? object8,
          Obj? object9,
          Obj? object10,
          Obj? object11,
          Obj? object12,
          Obj? object13,
          Obj? object14,
          Obj? object15,
          Obj? object16,
          Obj? object17,
          Obj? object18,
          Obj? object19,
          Obj? object20]) =>
      Int(Object.hash(
          object1.base,
          object2.base,
          object3?.base,
          object4?.base,
          object5?.base,
          object6?.base,
          object7?.base,
          object8?.base,
          object9?.base,
          object10?.base,
          object11?.base,
          object12?.base,
          object13?.base,
          object14?.base,
          object15?.base,
          object16?.base,
          object17?.base,
          object18?.base,
          object19?.base,
          object20?.base));

  // TODO: can be optimised but need to get info runtimeType is Exactly iterable with "Object?" not ObjStrict for example;
  static Int hashAll(Iterable<Obj?> objects) => Int(Object.hashAll(
      [for (Obj? object in objects) object == null ? null : object.base]));

  // TODO: can be optimised but need to get info runtimeType is Exactly iterable with "Object?" not ObjStrict for example;
  static Int hashAllUnordered(Iterable<Obj?> objects) =>
      Int(Object.hashAllUnordered([for (Obj? object in objects) object?.base]));
}

class Bool extends Obj<bool, Bool> {
  const Bool(super.base);

  // Operators

  bool operator &(bool other) => base & other;

  bool operator ^(bool other) => base ^ other;

  bool operator |(bool other) => base | other;

  // static methods

  static bool parse(Str source, {bool caseSensitive = true}) =>
      bool.parse(source.base, caseSensitive: caseSensitive);

  static bool? tryParse(Str source, {bool caseSensitive = true}) {
    bool? result = bool.tryParse(source.base, caseSensitive: caseSensitive);
    return result;
  }
}

/// Do understand if num is num or num is always double or int. For now let's do something like this; check int/double inheriting rules.
final class Num<T extends num, U extends Num<num, dynamic, dynamic>,
        W extends Num<num, dynamic, dynamic>>
    extends Obj<T, U> /*implements Comparable<T>*/ {
  const Num(super.base);

  @override
  int get hashCode => base.hashCode;

  bool get isFinite => base.isFinite;

  bool get isInfinite => base.isInfinite;

  bool get isNaN => base.isNaN;

  bool get isNegative => base.isNegative;

  @override
  Type get runtimeType => base.runtimeType;

  Num get sign => Num(base.sign);

  // Methods

  Num abs() => Num(base.abs());

  Int ceil() => Int(base.ceil());

  Dbl ceilToDouble() => Dbl(base.ceilToDouble());

  U clamp(W lowerLimit, W upperLimit) =>
      Num(base.clamp(lowerLimit.base, upperLimit.base)) as U;

  @override
  Int compareTo(W other) => Int(base.compareTo(other.base));

  Int floor() => Int(base.floor());

  Dbl floorToDouble() => Dbl(base.floorToDouble());

  @override
  dynamic noSuchMethod(Invocation invocation) => base.noSuchMethod(invocation);

  U remainder(W other) => Num(base.remainder(other.base)) as U;

  Int round() => Int(base.round());

  Dbl roundToDouble() => Dbl(base.roundToDouble());

  Dbl toDouble() => Dbl(base.toDouble());

  Int toInt() => Int(base.toInt());

  Str toStringAsExponential([Int? fractionDigits]) =>
      Str(base.toStringAsExponential(
          fractionDigits != null ? fractionDigits.base : null));

  Str toStringAsFixed(Int fractionDigits) =>
      Str(base.toStringAsFixed(fractionDigits.base));

  Str toStringAsPrecision(Int precision) =>
      Str(base.toStringAsPrecision(precision.base));

  Int truncate() => Int(base.truncate());

  Dbl truncateToDouble() => Dbl(base.truncateToDouble());

// Operators

  Num operator %(Num other) => Num(base % other.base);

  Num operator *(Num other) => Num(base * other.base);

  U operator +(U other) => (Num(base)) as U;

  Num operator -(Num other) => Num(base - other.base);

  Dbl operator /(Num other) => Dbl(base / other.base);

  bool operator <(Num other) => base < other.base;

  bool operator <=(Num other) => base <= other.base;

  //@override
  //Bool operator ==(Obj other) => Bool(base == other.base);

  bool operator >(Num other) => base > other.base;

  bool operator >=(Num other) => base >= other.base;

  /// Int or IntStrict has more info on this operator unary-();
  Num operator -() => Num(-base);

  Int operator ~/(Num other) => Int(base ~/ other.base);

  // Static Methods

  static Num parse(Str input, [Num onError(Str input)?]) {
    //Type type = Int;
    //if (type is int) {
    //  return num.parse(input, onError);
    //} else {
    // the second param is deprecated - not implemented see the num.parse docs
    return Num(num.parse(input.base));
    //}

    //num.parse(input.base, onError) /*c*/;
  }

  static Num? tryParse(Str input) {
    // no Num now:
    num? result = num.tryParse(input.base);
    return result is num ? Num(result) : null;
  }
}

final class IntOrDouble<T extends num, U extends Num<num, dynamic, dynamic>,
        W extends Num<num, dynamic, dynamic>>
    extends Num<T, U, W> /* implements Comparable<T>*/ {
  const IntOrDouble(super.base);
}

final class Int extends IntOrDouble<int, Int, Int>
    implements SL2 /* implements Comparable<int>*/ {
  const Int(super.base);

  Int get bitLength => Int(base.bitLength);
  //int get hashCode => base.hashCode;
  bool get isEven => base.isEven;
  //bool get isFinite => base.isFinite;
  //bool get isInfinite => base.isInfinite;
  //bool get isNaN => base.isNaN;

  //bool get isNegative => base.isNegative;

  bool get isOdd => base.isOdd;

  //Type get runtimeType => base.runtimeType;

  //int get sign => base.sign;

  // methods

  @override
  Int abs() => Int(base.abs());

  @override
  Int ceil() => Int(base.ceil());

  @override
  Dbl ceilToDouble() => Dbl(base.ceilToDouble());

  //num clamp(num lowerLimit, num upperLimit) =>
  //    base.clamp(lowerLimit, upperLimit);
  //
  //int compareTo(num other) => base.compareTo(other);

  @override
  Int floor() => Int(base.floor());

  @override
  Dbl floorToDouble() => Dbl(base.floorToDouble());

  Int gcd(Int other) => Int(base.gcd(other.base));

  Int modInverse(Int modulus) => Int(base.modInverse(modulus.base));

  Int modPow(Int exponent, Int modulus) =>
      Int(base.modPow(exponent.base, modulus.base));

  //dynamic noSuchMethod(Invocation invocation) => base.noSuchMethod(invocation);

  //num remainder(num other) => base.remainder(other);

  @override
  Int round() => Int(base.round());

  @override
  Dbl roundToDouble() => Dbl(base.roundToDouble());

  //double toDouble() => base.toDouble();

  //int toInt() => base.toInt();

  Str toRadixString(Int radix) => Str(base.toRadixString(radix.base));

  Int toSigned(Int width) => Int(base.toSigned(width.base));

  //String toStringAsExponential([int? fractionDigits]) =>
  //    base.toStringAsExponential(fractionDigits);
  //
  //String toStringAsFixed(int fractionDigits) =>
  //    base.toStringAsFixed(fractionDigits);
  //
  //String toStringAsPrecision(int precision) => base.toStringAsFixed(precision);

  Int toUnsigned(Int width) => Int(base.toUnsigned(width.base));

  @override
  Int truncate() => Int(base.truncate());

  @override
  Dbl truncateToDouble() => Dbl(base.truncateToDouble());

  // Operators

  //num operator %(num other) => base % other;

  Int operator &(Int other) => Int(base & other.base);

  //num operator *(num other) => base * other;

  Int operator +(Int other) => Int(base + other.base);

  //num operator -(num other) => base - other;

  //double operator /(num other) => base / other;

  //bool operator <(num other) => base < other;

  Int operator <<(Int shiftAmount) => Int(base << shiftAmount.base);

  //bool operator <=(num other) => base <= other;
  //
  //bool operator ==(Object other) => base == other;
  //
  //bool operator >(num other) => base > other;
  //
  //bool operator >=(num other) => base >= other;

  Int operator >>(Int shiftAmount) => Int(base >> shiftAmount.base);

  Int operator >>>(Int shiftAmount) => Int(base >>> shiftAmount.base);

  Int operator ^(Int other) => Int(base ^ other.base);

  /// FIXME: correct? It was int operator unary-() => -base; it is like -(num other) but without params so accepted
  //int operator -() => -base;

  Int operator |(Int other) => Int(base | other.base);

  /// FIXME: correct?
  Int operator ~() => Int(~base);

  //int operator ~/(num other) => base ~/ other;

  //// Static Methods
  //@override
  static Int parse(Str source, {Int? radix}) =>
      Int(int.parse(source.base, radix: radix == null ? null : radix.base));

  //@override
  static Int? tryParse(Str source, {Int? radix}) {
    int? result =
        int.tryParse(source.base, radix: radix == null ? null : radix.base);
    return result is int ? Int(result) : null;

    //Int.tryParse(source, radix: radix);
  }
}

final class Dbl extends IntOrDouble<double, Dbl,
    IntOrDouble> /*implements Comparable<double>*/ {
  const Dbl(super.base);

  @override

  //Int get hashCode => /*c*/ base.hashCode/*=c*/;

  //Bool get isFinite => /*c*/ base.isFinite/*=c*/;
  //Bool get isInfinite => /*c*/ base.isInfinite/*=c*/;
  //Bool get isNaN => /*c*/ base.isNaN/*=c*/;
  //Bool get isNegative => /*c*/ base.isNegative/*=c*/;
  @override
  Type get runtimeType => base.runtimeType;

  //Dbl get sign => /*c*/base.sign/*=c*/;

  // Methods

  @override
  Dbl abs() => Dbl(base.abs());

  @override
  Int ceil() => Int(base.ceil());

  @override
  Dbl ceilToDouble() => Dbl(base.ceilToDouble());
  //
  //num clamp(num lowerLimit, num upperLimit) =>
  //    base.clamp(lowerLimit, upperLimit);
  //
  //int compareTo(num other) => compareTo(other);
  //
  @override
  Int floor() => Int(base.floor());

  @override
  Dbl floorToDouble() => Dbl(base.floorToDouble());

  //dynamic noSuchMethod(Invocation invocation) => base.noSuchMethod(invocation);

  @override
  Dbl remainder(Num other) => Dbl(base.remainder(other.base));

  @override
  Int round() => Int(base.round());

  @override
  Dbl roundToDouble() => Dbl(base.roundToDouble());

  //double toDouble() => base.toDouble();

  //Int toInt() => base.toInt();

  //String toStringAsExponential([int? fractionDigits]) =>
  //    base.toStringAsExponential(fractionDigits);
  //
  //String toStringAsFixed(int fractionDigits) =>
  //    base.toStringAsFixed(fractionDigits);
  //
  //String toStringAsPrecision(int precision) =>
  //    base.toStringAsPrecision(precision);

  @override
  Int truncate() => Int(base.truncate());

  @override
  Dbl truncateToDouble() => Dbl(base.truncateToDouble());

  // Operators

  @override
  Dbl operator %(Num other) => Dbl(base % other.base);

  @override
  Dbl operator *(Num other) => Dbl(base * other.base);

  @override
  Dbl operator +(Num other) => Dbl(base + other.base);

  @override
  Dbl operator -(Num other) => Dbl(base - other.base);

  @override
  Dbl operator /(Num other) => Dbl(base / other.base);

  //bool operator <(num other) => base < other;
  //
  //bool operator <=(num other) => base <= other;
  //
  //bool operator ==(Object other) => base == other;
  //
  //bool operator >(num other) => base > other;
  //
  //bool operator >=(num other) => base >= other;

  /// Int or IntStrict had similar situation and see comment there
  @override
  Dbl operator -() => Dbl(base);

  @override
  Int operator ~/(Num other) => Int(base ~/ other.base);

  // Static Methods

  //@override
  static Dbl parse(Str source) => Dbl(double.parse(source.base));

  //@override
  static Dbl? tryParse(Str source) {
    double? result = double.tryParse(source.base);
    return result == null ? null : Dbl(result);
  }
  // Constants

  static const Dbl infinity = Dbl(double.infinity);

  static const Dbl maxFinite = Dbl(double.maxFinite);

  static const Dbl minPositive = Dbl(double.minPositive);

  static const Dbl nan = Dbl(double.nan);

  static const Dbl negativeInfinity = Dbl(double.negativeInfinity);
}

class Str extends Obj<String, Str> implements /*Comparable<String>, */ Pattern {
  const Str(super.base);

  // properties

  /*t*/ List/*=t*/ <Int> get codeUnits {
    Type type = Int;
    //if (type == int) {
    //  return base.codeUnits;
    //} else {
    List<Int> results = [];
    for (int unit in base.codeUnits) {
      results.add(Int(unit));
    }
    return results;
    //}
  }

  bool get isEmpty => base.isEmpty;

  bool get isNotEmpty => base.isNotEmpty;

  Int get length => Int(base.length);

  Runes get runes => base.runes;

  //Type get runtimeType => base.runtimeType;

  // Methods

  //Iterable<Match> allMatches(String string, [int start = 0]) =>
  //    base.allMatches(string, start);

  Int codeUnitAt(Int index) => Int(base.codeUnitAt(index.base));

  @override
  Int compareTo(Str other) => Int(base.compareTo(other.base));

  bool contains(Pattern other, [Int startIndex = const Int(0)]) =>
      base.contains(other, startIndex.base);

  bool endsWith(Str other) => base.endsWith(other.base);

  Int indexOf(Pattern pattern, [Int start = const Int(0)]) =>
      Int(base.indexOf(pattern, start.base));

  Int lastIndexOf(Pattern pattern, [Int? start]) =>
      Int(base.lastIndexOf(pattern, start == null ? null : start.base));

  //Match? matchAsPrefix(String string, [int start = 0]) =>
  //    base.matchAsPrefix(string, start);
  //
  //dynamic noSuchMethod(Invocation invocation) => base.noSuchMethod(invocation);
  //
  Str padLeft(Int width, [Str padding = const Str(' ')]) =>
      Str(base.padLeft(width.base, padding.base));

  Str padRight(Int width, [Str padding = const Str(' ')]) =>
      Str(base.padRight(width.base, padding.base));

  Str replaceAll(Pattern from, Str replace) =>
      Str(base.replaceAll(from, replace.base));

  Str replaceAllMapped(Pattern from, Str replace(Match match)) =>
      Str(base.replaceAllMapped(from, (Match match) => replace(match).base));

  //Str( base.replaceAllMapped(from, replace) );

  Str replaceFirst(Pattern from, Str to, [Int startIndex = const Int(0)]) =>
      Str(base.replaceFirst(from, to.base, startIndex.base));

  Str replaceFirstMapped(Pattern from, Str replace(Match match),
          [Int startIndex = const Int(0)]) =>
      Str(base.replaceFirstMapped(
          from, (Match match) => replace(match).base, startIndex.base));

  Str replaceRange(Int start, Int? end, Str replacement) =>
      Str(base.replaceRange(
          start.base, end == null ? null : end.base, replacement.base));

  /*t*/ List/*=t*/ <Str> split(Pattern pattern) {
    //Type type = Str;
    //if (type == String) {
    //  return base.split(pattern);
    //} else {
    List<Str> results = [];
    for (String unit in base.split(pattern)) {
      results.add(Str(unit));
    }
    return results;
    //}

    ///base.split(pattern);
  }

  // FIXME:
  Str splitMapJoin(Pattern pattern,
          {Str onMatch(Match)?, Str onNonMatch(Str)?}) =>
      Str(base.splitMapJoin(pattern,
          onMatch:
              onMatch == null ? null : (Match match) => onMatch(match).base,
          onNonMatch: onNonMatch == null
              ? null
              : (String nmatch) => onNonMatch(

                      /*cstring2*/

                      nmatch

                      /*c*/

                      )
                  .base));

  bool startsWith(Pattern pattern, [Int index = const Int(0)]) =>
      base.startsWith(pattern, index.base);

  Str substring(Int start, [Int? end]) =>
      Str(base.substring(start.base, end == null ? null : end.base));

  Str toLowerCase() => Str(base.toLowerCase());

  //String toString() => base.toString();

  Str toUpperCase() => Str(base.toUpperCase());

  Str trim() => Str(base.trim());

  Str trimLeft() => Str(base.trimLeft());

  Str trimRight() => Str(base.trimRight());

  // Operators

  Str operator *(Int times) => Str(base * times.base);

  Str operator +(Str other) => Str(base + other.base);

  Str operator [](Int index) => Str(base[index.base]);
}

sealed class SL {}

sealed class SL1 extends SL {
  SL1();
}

sealed class SL2 extends SL implements Num<int, Int, Int> {
  final int base;
  SL2(this.base);
}

final class SL22 extends SL2 implements Int {
  SL22(super.base);
  methodUnisqSL12() {}
}

final class SL11 extends SL1 {
  SL11();
}

final class SL12 extends SL1 {
  SL12();
  int methodUnisqSL12() => 10;
}

rwewrwerwwrre(SL1 ee) {
  if (ee is SL12) {
    // good as expected no need to cast
    ee.methodUnisqSL12();
  } else {
    //wrong as expected
    //ee.methodUnisqSL12();
  }
  if (ee is SL11) {
    // wrong as expected
    // ee.methodUnisqSL12();
  } else {
    // wrong, it is exhaustive but if is not able to do it
    //ee.methodUnisqSL12();
  }
  switch (ee) {
    case SL11():
      // wrong as expected
      //ee.methodUnisqSL12();
      break;
    case SL12():
      // good as expected no need to cast
      ee.methodUnisqSL12();
      break;
  }
}

rwewrwerwwrreSL2(SL ee) {
  if (ee is Int) {
    Int a = Int(10);
    Int(10) + ee as Int;
    a = Int(10) + ee;
    ee = ee + Int(10);
    print(a);
  }

  /// ok and Exhaustive
  switch (ee) {
    case SL1():
      // wrong as expected
      //ee.methodUnisqSL12();
      break;
    case Int():
      // good as expected no need to cast
      print('in switch of rwewrwerwwrreSL2');
      // this cannot be used: case is not SL22 BUT IF IT WAS SWITCH WOULDN'T BE EXHAUSTED
      //ee.methodUnisqSL12();
      Int a = Int(10);
      Int(10) + ee;
      a = Int(10) + ee;
      print(a);

      break;
  }

  switch (ee) {
    case SL1():
      // wrong as expected
      //ee.methodUnisqSL12();
      break;
    case Int():
      // good as expected no need to cast
      print('in switch of rwewrwerwwrreSL2');
      //If it was case SL() it would be all fine but now is commented the: ee.methodUnisqSL12();
      //ee.methodUnisqSL12();
      Int a = Int(10);
      // not allowed if it was SL2 it would
      // Int(10) + ee;
      // a = Int(10) + ee;
      print(a);

      break;
  }

  if (ee is SL12) {
    // good as expected no need to cast
    ee.methodUnisqSL12();
  } else {
    //wrong as expected
    //ee.methodUnisqSL12();
  }
  if (ee is SL11) {
    // wrong as expected
    // ee.methodUnisqSL12();
  } else {
    // wrong, it is exhaustive but if is not able to do it
    //ee.methodUnisqSL12();
  }
}

///
///

ewrwrewrewewrewwer(double q) {}
ewrwrewrewewrewwer2() {
  int eeew = 10;
  // int is not accepted as function param:
  // ewrwrewrewewrewwer(eeew);
  // but accepts int:
  double rtrtr = 10.5 + 5;
  rtrtr = rtrtr + 2;
  // but not num
  // rtrtr = rtrtr + 2 as num;
}

//class Fq<T extends num> {
//  final T base;
//  const Fq(this.base);
//}
//
//sealed class Fqintermediate<T extends num> extends Fq<num> {
//  const Fqintermediate(super.base);
//}
//
//class Fqint extends Fq<int> {
//  const Fqint(super.base);
//}
//
//class Fqdouble extends Fq<double> {
//  const Fqdouble(super.base);
//}

// exhaustiveness
sdfgdgsdfg(num abc) {
  // only this is good
  switch (abc) {
    case int():
      break;
    case double():
      break;
  }
  // only this is good
  switch (abc) {
    case num():
      break;
  }
  // good but int must be first
  switch (abc) {
    case int():
      break;
    case num():
      break;
  }
  // good but int never reached
  switch (abc) {
    case num():
      break;
    case int():
      break;
  }
}

gdgfhdfhgfh() {
  sdfgdgsdfg(2.2 as num);
  sdfgdgsdfg(2.2);
  sdfgdgsdfg(10);
}

asdfasdsadf(Num abc) {
  switch (abc) {
    case Int():
  }
}

final class A {}

sealed class B extends A {}

final class C extends A {}

// Error: the switch is not exhaustive because there is no case for A()
void test(A a) => switch (a) {
      B() => print("B"),
      C() => print("C"),
    };

void main() {
  //num werwrerte=5.5;
  //Fq<num>(werwrerte);

  // The bottom line - int accepts int returns int, double accepts int or double but not num!!! and returns double
  // no: int wer=10.clamp(5, 8.7);
  // no: int wer=5.5.clamp(5, 10);
  // yes
  int wer = 10.clamp(5, 10);
  // also no:
  // int wer2 = 4.clamp(5, 8.7);
  // so clamp for int must be accept int, double num
  double wer4 = 2.2.clamp(5, 8.7);
  // no: double wer33 = 2 as num;
  // nolike previous: double wer5 = 1.1.clamp(2, wer3);

  // Let's repeat it (+1 extra) for Num, Dbl, Int

  // no: Int werRR=Int(10).clamp(Int(5), Dbl(8.7));
  // no: Int werwww=Dbl(5.5).clamp(Int(5), Int(10));
  // yes
  Int werR = Int(10).clamp(Int(5), Int(10));
  // also no:
  // Int wer2=Int(4).clamp(Int(5), Dbl(8.7));
  // so clamp for int must be accept int, double num
  Dbl wer4R = Dbl(2.2).clamp(Int(5), Dbl(8.7));
  // no: Dbl wer33 = Int(2) as Num; // also no as Int, only as Dbl works
  // nolike previous (wer33 must have been Num for a while): Dbl wer5 = Dbl(1.1).clamp(Int(2), wer3);
  // But this unique not copied works:
  Dbl wer5 = Dbl(1.1).clamp(Int(2), (Int(2) as Num) as Dbl);

  int qqqwer = 10 % 10 /*b*/ /*c*/;

  /// ok but runtime error probably
  int bbxcvcvc = 10 % 22 /*b*/ /*c*/;
  // no: int bbxcvcvc=    10 % 10.5 /*b*/ /*c*/;

  double qqqwer3 = 10 % 10 /*b*/ /*c*/;

  /// ok but runtime error probably
  double bbxcvcvc3 = 10 % 22 /*b*/ /*c*/;
  double bbxcvcvcw3 = 10 % 10.5 /*b*/ /*c*/;
  num werwrw = 3;

  /// this wa not taken into account but is ok num is compatible with double:
  double qqqwer32 = werwrw % 10 /*b*/ /*c*/;

  /// So for dome reason not accepted as param but accepted in operations, hhhmmmmmmmmmmmmmmmmmmmmmmmm
  //here // READ!!!!! OPERATORS ARE GETTERS SO DIFFERENT TYPES ARE INVOLVED IN double different in num so maybe no ned to override but test?
  double qqqwer325 = 10.4 % werwrw /*b*/ /*c*/;
  int jhjgfjjghj = 9 % werwrw; // but num here is not accepted

  Num<num, Num, Num>(21.4);

  // yes:
  num werwer = 0; // not cast into int or something - it is still null
  // yes:
  num werwer2 = werwer * 12.2;

  print('Ok, let\'s begin');
  Int a = Int(10);
  Int(10) + a;
  a = Int(10) + a;
  print(a);

  /// No - this is what i hoped for:
  //rwewrwerwwrreSL2(Int(15));

  /// ALL ALLOWED:
  /// FIXME: NOT TESTED RUNTIME ERRORS PREVIOUSLY WERE
  rwewrwerwwrreSL2(Int(16));
  rwewrwerwwrreSL2(SL22(17));
  rwewrwerwwrreSL2(Int(55) as SL2);
  rwewrwerwwrreSL2(SL22(19) as Int);

//  runApp(const MyApp());
}

//class MyApp extends StatelessWidget {
//  const MyApp({super.key});
//
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        // This is the theme of your application.
//        //
//        // TRY THIS: Try running your application with "flutter run". You'll see
//        // the application has a purple toolbar. Then, without quitting the app,
//        // try changing the seedColor in the colorScheme below to Colors.green
//        // and then invoke "hot reload" (save your changes or press the "hot
//        // reload" button in a Flutter-supported IDE, or press "r" if you used
//        // the command line to start the app).
//        //
//        // Notice that the counter didn't reset back to zero; the application
//        // state is not lost during the reload. To reset the state, use hot
//        // restart instead.
//        //
//        // This works for code too, not just values: Most code changes can be
//        // tested with just a hot reload.
//        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//        useMaterial3: true,
//      ),
//      home: const MyHomePage(title: 'Flutter Demo Home Page'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  const MyHomePage({super.key, required this.title});
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  State<MyHomePage> createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return Scaffold(
//      appBar: AppBar(
//        // TRY THIS: Try changing the color here to a specific color (to
//        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//        // change color while the other colors stay the same.
//        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Column(
//          // Column is also a layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          //
//          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//          // action in the IDE, or press "p" in the console), to see the
//          // wireframe for each widget.
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            const Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.headlineMedium,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: const Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}
//
