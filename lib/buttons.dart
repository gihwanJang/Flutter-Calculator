import 'package:flutter/material.dart';

const _regExpUnexpectCharCombining = "(^(×|÷)\\d)|([\\+\\-×÷]{2})";
const _regExpSpecialNumber = "(^0\\d)|(\\D0\\d)";
const _regExpCharMDFormula = "(^\\-|^\\+)?\\d+(\\.\\d+)?[×÷]\\d+(\\.\\d+)?";
const _regExpCharASFormula = "(^\\-|^\\+)?\\d+(\\.\\d+)?[\\+\\-]\\d+(\\.\\d+)?";
const _regExpCharMD = "(?<=\\d)[×÷]";
const _regExpCharAS = "(?<=\\d)[\\+\\-]";

enum Buttons {
  zero,
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  equal,
  add,
  substract,
  multiply,
  divide,
  delete,
  cancel
}

const buttonTips = {
  Buttons.zero: '0',
  Buttons.one: '1',
  Buttons.two: '2',
  Buttons.three: '3',
  Buttons.four: '4',
  Buttons.five: '5',
  Buttons.six: '6',
  Buttons.seven: '7',
  Buttons.eight: '8',
  Buttons.nine: '9',
  Buttons.equal: '=',
  Buttons.add: '+',
  Buttons.substract: '-',
  Buttons.multiply: '×',
  Buttons.divide: '÷',
  Buttons.delete: '←',
  Buttons.cancel: 'c',
};
//['0','1','2','3','4','5','6','7','8','9','=','+','-','×','÷','←','c'];