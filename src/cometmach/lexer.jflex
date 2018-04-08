package cometmach;
import java_cup.runtime.Symbol;

%%
%class CometMachLexical
%unicode
%public
%cupsym CometMachSymbols
%cup
%line
%column
%char
%ignorecase

Words = [a-zA-Z]
Digits = [0-9]
Id = {Words}+{Digits}* 
NumberI = {Digits}+
NumberD = ({Digits}+\.{Digits}+)
Char = \'{Words}\'
Sentence = \"({Words}|[ ])*\"
Space = [ ]
Tab = [\t]
True = "true"
False = "false" 
/*Commentary options*/
BlockComment = "$*" [^*] ~"*$"
InputCharacter = [^\r\n]
LineEnd = \r|\n|\r\n
Commentary = {BlockComment}|{EndOfLineComment}
EndOfLineComment = "$"{InputCharacter}*{LineEnd}?
/*Operators*/
Higher = ">"
Less = "<"
HigherEqual = ">="
LessEqual = "<="
Equal = "=="
NotEqual = "!="
Comparative = ({Higher}|{Less}|{LessEqual}|{HigherEqual}|{Equal}|{NotEqual})
And = "&&"
Or = "||"
/*Operations*/
Add = "+"
Sub = "-"
Multi = "*"
Div = "/"
Assign = "="
/*Types*/
Symbol = "symbol"
Integer = "int"
Decimal = "dec"
Word = "word"
Boolean = "bool"
/*Array Options*/
Box = "box"
Boxassignation = ".assign"
StapleOpen = "["
StapleClose = "]"
Comma = ","
/*Conditions*/
If = "if"
Else = "else"
ElseIf = "elseif"
For = "for"
Swap = "swap"
Is = "is"
Default = "default"
Cicle = "cicle"
To = "to"
/*Blocks*/
Init = "{"
End = "}"
ParOpen = "("
ParClose = ")"
EndSentence = ";"
Close = "close"
Then = :
/*Functions*/
Function = "func"
Return = "return"
Void = "void"
/*Main*/
Main = "main"
%%
<YYINITIAL> { 
    {Main} {
            return new Symbol(CometMachSymbols.tMain, yyline + 1, yycolumn + 1, yytext());}
    {True} {
            return new Symbol(CometMachSymbols.tTrue,  yyline + 1, yycolumn + 1, yytext());}
    {False} {
                return new Symbol(CometMachSymbols.tFalse, yyline + 1, yycolumn + 1, yytext());}
    {If} {
            return new Symbol(CometMachSymbols.tIf, yyline + 1, yycolumn + 1, yytext());}
    {Assign} {
                return new Symbol(CometMachSymbols.tAssign, yyline + 1, yycolumn + 1, yytext());}
    {Or} {
            return new Symbol(CometMachSymbols.tOr, yyline + 1, yycolumn + 1, yytext());}
    {And} {
            return new Symbol(CometMachSymbols.tAnd, yyline + 1, yycolumn + 1, yytext());}
    {Comparative} {
                    return new Symbol(CometMachSymbols.tComparative, yyline + 1, yycolumn + 1, yytext());}
    {ElseIf} {
                return new Symbol(CometMachSymbols.tElseif, yyline + 1, yycolumn + 1, yytext());}
    {Else} {
            return new Symbol(CometMachSymbols.tElse, yyline + 1, yycolumn + 1, yytext());}
    {Swap} {
            return new Symbol(CometMachSymbols.tSwap, yyline + 1, yycolumn + 1, yytext());}
    {Is} {
            return new Symbol(CometMachSymbols.tIs, yyline + 1, yycolumn + 1, yytext());}
    
    {NumberI} {
                return new Symbol(CometMachSymbols.tNumberI, yyline + 1, yycolumn + 1, yytext());}

    {NumberD} {
                return new Symbol(CometMachSymbols.tNumberD, yyline + 1, yycolumn + 1, yytext());}            
    
    {Char} {
            return new Symbol(CometMachSymbols.tChar, yyline + 1, yycolumn + 1, yytext());}
    
    {Then} {
            return new Symbol(CometMachSymbols.tThen, yyline + 1, yycolumn + 1, yytext());}
    {Close} {
                return new Symbol(CometMachSymbols.tClose, yyline + 1, yycolumn + 1, yytext());}
    {Default} {
                return new Symbol(CometMachSymbols.tDefault, yyline + 1, yycolumn + 1, yytext());}
    {For} {
            return new Symbol(CometMachSymbols.tFor, yyline + 1, yycolumn + 1, yytext());}
    {ParOpen} {
                return new Symbol(CometMachSymbols.tParOpen, yyline + 1, yycolumn + 1, yytext());}
    {To} {
            return new Symbol(CometMachSymbols.tTo, yyline + 1, yycolumn + 1, yytext());}
    {ParClose} {
                return new Symbol(CometMachSymbols.tParClose, yyline + 1, yycolumn + 1, yytext());}
    {End} {
            return new Symbol(CometMachSymbols.tEnd, yyline + 1, yycolumn + 1, yytext());}
    {Cicle} {
                return new Symbol(CometMachSymbols.tCicle, yyline + 1, yycolumn + 1, yytext());}
    {Box} {
            return new Symbol(CometMachSymbols.tBox, yyline + 1, yycolumn + 1, yytext());}
    {Boxassignation} {
                    return new Symbol(CometMachSymbols.tBoxAssing, yyline + 1, yycolumn + 1, yytext());}
    {Function} {
                return new Symbol(CometMachSymbols.tFunction, yyline + 1, yycolumn + 1, yytext());}
    {Void} {
            return new Symbol(CometMachSymbols.tVoid, yyline + 1, yycolumn + 1, yytext());}
    {Return} {
                return new Symbol(CometMachSymbols.tReturn, yyline + 1, yycolumn + 1, yytext());}
    {Commentary} {}
    {Init} {
            return new Symbol(CometMachSymbols.tInit, yyline + 1, yycolumn + 1, yytext());}

    {Integer} {
                 return new Symbol(CometMachSymbols.tInteger, yyline + 1, yycolumn + 1, yytext());}
    {Decimal} { 
                return new Symbol(CometMachSymbols.tDecimal, yyline + 1, yycolumn + 1, yytext());}
    {Word} {
            return new Symbol(CometMachSymbols.tWord, yyline + 1, yycolumn + 1, yytext());}
    {Sentence} {
                return new Symbol(CometMachSymbols.tSentence, yyline + 1, yycolumn + 1, yytext());}
    {Symbol} {
                return new Symbol(CometMachSymbols.tSymbol, yyline + 1, yycolumn + 1, yytext());}
    {Boolean} {
                return new Symbol(CometMachSymbols.tBoolean, yyline + 1, yycolumn + 1, yytext());}
    {Space} {}

    {LineEnd} {}
    
    {Tab} {}
    
    {Id} {
            return new Symbol(CometMachSymbols.tId, yyline + 1, yycolumn + 1, yytext());}
    {StapleOpen} {
                return new Symbol(CometMachSymbols.tStapleOpen, yyline + 1, yycolumn + 1, yytext());}
    {StapleClose} {
                    return new Symbol(CometMachSymbols.tStapleClose, yyline + 1, yycolumn + 1, yytext());}
    {Comma} {
            return new Symbol(CometMachSymbols.tComma, yyline + 1, yycolumn + 1, yytext());}
    {Add} {
            return new Symbol(CometMachSymbols.tAdd, yyline + 1, yycolumn + 1, yytext());}
    {Sub} {
            return new Symbol(CometMachSymbols.tSub, yyline + 1, yycolumn + 1, yytext());}
    {Multi} {
                return new Symbol(CometMachSymbols.tMulti, yyline + 1, yycolumn + 1, yytext());}
    {Div} {
            return new Symbol(CometMachSymbols.tDiv, yyline + 1, yycolumn + 1, yytext());}
    
    {EndSentence} {
                    return new Symbol(CometMachSymbols.tEndSentence, yyline + 1, yycolumn + 1, yytext());}
    . {System.out.println("Lexical error line: "+yyline+" column: "+yycolumn+ " token: "+yytext()+" is not declared.");}
}