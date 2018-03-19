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
Number = {Digits}+|({Digits}+\.{Digits}+)
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
DoCicle = "do"
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
            return new Symbol(CometMachSymbols.tMain, yychar, yyline);}
    {True} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tTrue,  yychar, yyline);}
    {False} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tFalse, yychar, yyline);}
    {If} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tIf, yychar, yyline);}
    {Assign} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tAssign, yychar, yyline);}
    {Or} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tOr, yychar, yyline);}
    {And} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tAnd, yychar, yyline);}
    {Comparative} {System.out.println(yytext());
                    return new Symbol(CometMachSymbols.tComparative, yychar, yyline);}
    {ElseIf} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tElseif, yychar, yyline);}
    {Else} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tElse, yychar, yyline);}
    {Swap} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tSwap, yychar, yyline);}
    {Is} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tIs, yychar, yyline);}
    
    {Number} {System.out.println("number: "+yytext());
                return new Symbol(CometMachSymbols.tNumber, yychar, yyline, new String(yytext()));}
    {Char} {System.out.println("char: "+yytext());
            return new Symbol(CometMachSymbols.tChar, yychar, yyline, new String(yytext()));}
    
    {Then} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tThen, yychar, yyline);}
    {Close} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tClose, yychar, yyline);}
    {Default} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tDefault, yychar, yyline);}
    {For} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tFor, yychar, yyline);}
    {ParOpen} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tParOpen, yychar, yyline);}
    {To} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tTo, yychar, yyline);}
    {ParClose} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tParClose, yychar, yyline);}
    {End} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tEnd, yychar, yyline);}
    {DoCicle} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tDoCicle, yychar, yyline);}
    {Cicle} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tCicle, yychar, yyline);}
    {Box} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tBox, yychar, yyline);}
    {Boxassignation} {System.out.println(yytext());
                    return new Symbol(CometMachSymbols.tBoxAssing, yychar, yyline);}
    {Function} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tFunction, yychar, yyline);}
    {Void} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tVoid, yychar, yyline);}
    {Return} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tReturn, yychar, yyline);}
    {Commentary} {System.out.println(yytext());
                    return new Symbol(CometMachSymbols.tCommentary, yychar, yyline);}
    {Init} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tInit, yychar, yyline);}

    {Integer} {System.out.println(yytext());
                 return new Symbol(CometMachSymbols.tInteger, yychar, yyline);}
    {Decimal} {System.out.println(yytext()); 
                return new Symbol(CometMachSymbols.tDecimal, yychar, yyline);}
    {Word} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tWord, yychar, yyline);}
    {Sentence} {System.out.println("sentence: "+yytext());
                return new Symbol(CometMachSymbols.tSentence, yychar, yyline, new String(yytext()));}
    {Symbol} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tSymbol, yychar, yyline);}
    {Boolean} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tBoolean, yychar, yyline);}
    
    {Space} {System.out.println("space");
             return new Symbol(CometMachSymbols.tSpace, yychar, yyline);}
    {LineEnd} {return new Symbol(CometMachSymbols.tLineEnd, yychar, yyline);}
    {Tab} {return new Symbol(CometMachSymbols.tTab, yychar, yyline);}
    
    {Id} {System.out.println("id: "+yytext());
            return new Symbol(CometMachSymbols.tId, yychar, yyline, new String(yytext()));}
    {StapleOpen} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tStapleOpen, yychar, yyline);}
    {StapleClose} {System.out.println(yytext());
                    return new Symbol(CometMachSymbols.tStapleOpen, yychar, yyline);}
    {Comma} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tComma, yychar, yyline);}
    {Add} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tAdd, yychar, yyline);}
    {Sub} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tSub, yychar, yyline);}
    {Multi} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tMulti, yychar, yyline);}
    {Div} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tDiv, yychar, yyline);}
    
    {EndSentence} {System.out.println(yytext());
                    return new Symbol(CometMachSymbols.tEndSentence, yychar, yyline);}
    . {System.out.println("Lexical error line: "+yyline+" column: "+yycolumn+ " token: "+yytext()+" is not declared.");}
}