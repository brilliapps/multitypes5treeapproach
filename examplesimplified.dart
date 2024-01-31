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
class NumStrict<T extends num, U extends NumStrict<num, dynamic>>
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

  /*t*/ num/*=t*/ get sign => /*cnum*/ base.sign /*c*/;

  // Methods

  /*t*/ num/*=t*/ abs() => /*cnum*/ base.abs() /*c*/;

  /*t*/ int/*=t*/ ceil() => /*cint*/ base.ceil() /*c*/;

  /*t*/ double/*=t*/ ceilToDouble() => /*cdouble*/ base.ceilToDouble() /*c*/;

  /*t*/ num/*=t*/ clamp(
          /*t*/ num/*=t*/ lowerLimit, /*t*/ num/*=t*/ upperLimit) =>
      /*cnum*/ base.clamp(lowerLimit /*b*/, upperLimit /*b*/) /*c*/;

  @override
  /*t*/ int/*=t*/ compareTo(/*t*/ num/*=t*/ other) => /*cint*/
      base.compareTo(other /*b*/) /*c*/;

  /*t*/ int/*=t*/ floor() => /*cint*/ base.floor() /*c*/;

  /*t*/ double/*=t*/ floorToDouble() => /*cdouble*/ base.floorToDouble() /*c*/;

  @override
  dynamic noSuchMethod(Invocation invocation) => base.noSuchMethod(invocation);

  /*t*/ num/*=t*/ remainder(/*t*/ num/*=t*/ other) => /*cnum*/
      base.remainder(other /*b*/) /*c*/;

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

class IntStrict
    extends NumStrict<int, IntStrict> /* implements Comparable<int>*/ {
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

class DblStrict
    extends NumStrict<double, DblStrict> /*implements Comparable<double>*/ {
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
}

class Bool extends Obj<bool, Bool> {
  const Bool(super.base);
}

/// Do understand if num is num or num is always double or int. For now let's do something like this; check int/double inheriting rules.
class Num<T extends num, U extends Num<num, dynamic>>
    extends Obj<T, U> /*implements Comparable<T>*/ {
  const Num(super.base);
}

class Int extends Num<int, Int> /* implements Comparable<int>*/ {
  const Int(super.base);

  Int operator +(Int other) => Int(base + other.base);
  String toString() => base.toString();
}

class Dbl extends Num<double, Dbl> /*implements Comparable<double>*/ {
  const Dbl(super.base);
}

sealed class SL {}

sealed class SL1 extends SL {
  SL1();
}

class SL2 extends SL implements Int {
  final int base;
  SL2(this.base);
  Int operator +(Int other) => Int(base + other.base);
  String toString() => base.toString();
  int methodUnisqSL12() => 10;
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
  if (ee is SL2) {
    Int a = Int(10);
    Int(10) + ee as Int;
    a = Int(10) + ee;
    print(a);
  }

  /// ok and Exhaustive
  switch (ee) {
    case SL1():
      // wrong as expected
      //ee.methodUnisqSL12();
      break;
    case SL2():
      // good as expected no need to cast
      print('in switch of rwewrwerwwrreSL2');
      ee.methodUnisqSL12();
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

void main() {
  print('Ok, let\'s begin');
  Int a = Int(10);
  Int(10) + a;
  a = Int(10) + a;
  print(a);

  /// No - this is what i hoped for:
  //rwewrwerwwrreSL2(Int(15));

  /// No - runtime time exception - this is what i hoped for:
  ///rwewrwerwwrreSL2(Int(16) as SL2);
  rwewrwerwwrreSL2(SL2(17));
  // not allowed rwewrwerwwrreSL2(Int(55) as SL2);

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