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
    {Main} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tMain, yyline + 1, yycolumn + 1, yytext());}
    {True} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tTrue,  yyline + 1, yycolumn + 1, yytext());}
    {False} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tFalse, yyline + 1, yycolumn + 1, yytext());}
    {If} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tIf, yyline + 1, yycolumn + 1, yytext());}
    {Assign} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tAssign, yyline + 1, yycolumn + 1, yytext());}
    {Or} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tOr, yyline + 1, yycolumn + 1, yytext());}
    {And} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tAnd, yyline + 1, yycolumn + 1, yytext());}
    {Comparative} {System.out.println(yytext());
                    return new Symbol(CometMachSymbols.tComparative, yyline + 1, yycolumn + 1, yytext());}
    {ElseIf} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tElseif, yyline + 1, yycolumn + 1, yytext());}
    {Else} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tElse, yyline + 1, yycolumn + 1, yytext());}
    {Swap} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tSwap, yyline + 1, yycolumn + 1, yytext());}
    {Is} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tIs, yyline + 1, yycolumn + 1, yytext());}
    
    {NumberI} {System.out.println("integer: "+yytext());
                return new Symbol(CometMachSymbols.tNumberI, yyline + 1, yycolumn + 1, yytext());}

    {NumberD} {System.out.println("decimal: "+yytext());
                return new Symbol(CometMachSymbols.tNumberD, yyline + 1, yycolumn + 1, yytext());}            
    
    {Char} {System.out.println("char: "+yytext());
            return new Symbol(CometMachSymbols.tChar, yyline + 1, yycolumn + 1, yytext());}
    
    {Then} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tThen, yyline + 1, yycolumn + 1, yytext());}
    {Close} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tClose, yyline + 1, yycolumn + 1, yytext());}
    {Default} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tDefault, yyline + 1, yycolumn + 1, yytext());}
    {For} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tFor, yyline + 1, yycolumn + 1, yytext());}
    {ParOpen} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tParOpen, yyline + 1, yycolumn + 1, yytext());}
    {To} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tTo, yyline + 1, yycolumn + 1, yytext());}
    {ParClose} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tParClose, yyline + 1, yycolumn + 1, yytext());}
    {End} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tEnd, yyline + 1, yycolumn + 1, yytext());}
    {Cicle} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tCicle, yyline + 1, yycolumn + 1, yytext());}
    {Box} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tBox, yyline + 1, yycolumn + 1, yytext());}
    {Boxassignation} {System.out.println(yytext());
                    return new Symbol(CometMachSymbols.tBoxAssing, yyline + 1, yycolumn + 1, yytext());}
    {Function} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tFunction, yyline + 1, yycolumn + 1, yytext());}
    {Void} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tVoid, yyline + 1, yycolumn + 1, yytext());}
    {Return} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tReturn, yyline + 1, yycolumn + 1, yytext());}
    {Commentary} {System.out.println(yytext());
                    return new Symbol(CometMachSymbols.tCommentary, yyline + 1, yycolumn + 1, yytext());}
    {Init} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tInit, yyline + 1, yycolumn + 1, yytext());}

    {Integer} {System.out.println(yytext());
                 return new Symbol(CometMachSymbols.tInteger, yyline + 1, yycolumn + 1, yytext());}
    {Decimal} {System.out.println(yytext()); 
                return new Symbol(CometMachSymbols.tDecimal, yyline + 1, yycolumn + 1, yytext());}
    {Word} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tWord, yyline + 1, yycolumn + 1, yytext());}
    {Sentence} {System.out.println("sentence: "+yytext());
                return new Symbol(CometMachSymbols.tSentence, yyline + 1, yycolumn + 1, yytext());}
    {Symbol} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tSymbol, yyline + 1, yycolumn + 1, yytext());}
    {Boolean} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tBoolean, yyline + 1, yycolumn + 1, yytext());}
    {Space} {}

    {LineEnd} {}
    
    {Tab} {}
    
    {Id} {System.out.println("id: "+yytext());
            return new Symbol(CometMachSymbols.tId, yyline + 1, yycolumn + 1, yytext());}
    {StapleOpen} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tStapleOpen, yyline + 1, yycolumn + 1, yytext());}
    {StapleClose} {System.out.println(yytext());
                    return new Symbol(CometMachSymbols.tStapleClose, yyline + 1, yycolumn + 1, yytext());}
    {Comma} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tComma, yyline + 1, yycolumn + 1, yytext());}
    {Add} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tAdd, yyline + 1, yycolumn + 1, yytext());}
    {Sub} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tSub, yyline + 1, yycolumn + 1, yytext());}
    {Multi} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tMulti, yyline + 1, yycolumn + 1, yytext());}
    {Div} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tDiv, yyline + 1, yycolumn + 1, yytext());}
    
    {EndSentence} {System.out.println(yytext());
                    return new Symbol(CometMachSymbols.tEndSentence, yyline + 1, yycolumn + 1, yytext());}
    . {System.out.println("Lexical error line: "+yyline+" column: "+yycolumn+ " token: "+yytext()+" is not declared.");}
}