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
            return new Symbol(CometMachSymbols.tMain, yyline, yycolumn, yytext());}
    {True} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tTrue,  yyline, yycolumn, yytext());}
    {False} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tFalse, yyline, yycolumn, yytext());}
    {If} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tIf, yyline, yycolumn, yytext());}
    {Assign} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tAssign, yyline, yycolumn, yytext());}
    {Or} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tOr, yyline, yycolumn, yytext());}
    {And} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tAnd, yyline, yycolumn, yytext());}
    {Comparative} {System.out.println(yytext());
                    return new Symbol(CometMachSymbols.tComparative, yyline, yycolumn, yytext());}
    {ElseIf} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tElseif, yyline, yycolumn, yytext());}
    {Else} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tElse, yyline, yycolumn, yytext());}
    {Swap} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tSwap, yyline, yycolumn, yytext());}
    {Is} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tIs, yyline, yycolumn, yytext());}
    
    {NumberI} {System.out.println("integer: "+yytext());
                return new Symbol(CometMachSymbols.tNumberI, yyline, yycolumn, yytext());}

    {NumberD} {System.out.println("decimal: "+yytext());
                return new Symbol(CometMachSymbols.tNumberD, yyline, yycolumn, yytext());}            
    
    {Char} {System.out.println("char: "+yytext());
            return new Symbol(CometMachSymbols.tChar, yyline, yycolumn, yytext());}
    
    {Then} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tThen, yyline, yycolumn, yytext());}
    {Close} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tClose, yyline, yycolumn, yytext());}
    {Default} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tDefault, yyline, yycolumn, yytext());}
    {For} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tFor, yyline, yycolumn, yytext());}
    {ParOpen} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tParOpen, yyline, yycolumn, yytext());}
    {To} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tTo, yyline, yycolumn, yytext());}
    {ParClose} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tParClose, yyline, yycolumn, yytext());}
    {End} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tEnd, yyline, yycolumn, yytext());}
    {Cicle} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tCicle, yyline, yycolumn, yytext());}
    {Box} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tBox, yyline, yycolumn, yytext());}
    {Boxassignation} {System.out.println(yytext());
                    return new Symbol(CometMachSymbols.tBoxAssing, yyline, yycolumn, yytext());}
    {Function} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tFunction, yyline, yycolumn, yytext());}
    {Void} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tVoid, yyline, yycolumn, yytext());}
    {Return} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tReturn, yyline, yycolumn, yytext());}
    {Commentary} {System.out.println(yytext());
                    return new Symbol(CometMachSymbols.tCommentary, yyline, yycolumn, yytext());}
    {Init} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tInit, yyline, yycolumn, yytext());}

    {Integer} {System.out.println(yytext());
                 return new Symbol(CometMachSymbols.tInteger, yyline, yycolumn, yytext());}
    {Decimal} {System.out.println(yytext()); 
                return new Symbol(CometMachSymbols.tDecimal, yyline, yycolumn, yytext());}
    {Word} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tWord, yyline, yycolumn, yytext());}
    {Sentence} {System.out.println("sentence: "+yytext());
                return new Symbol(CometMachSymbols.tSentence, yyline, yycolumn, yytext());}
    {Symbol} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tSymbol, yyline, yycolumn, yytext());}
    {Boolean} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tBoolean, yyline, yycolumn, yytext());}
    {Space} {}

    {LineEnd} {}
    
    {Tab} {}
    
    {Id} {System.out.println("id: "+yytext());
            return new Symbol(CometMachSymbols.tId, yyline, yycolumn, yytext());}
    {StapleOpen} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tStapleOpen, yyline, yycolumn, yytext());}
    {StapleClose} {System.out.println(yytext());
                    return new Symbol(CometMachSymbols.tStapleClose, yyline, yycolumn, yytext());}
    {Comma} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tComma, yyline, yycolumn, yytext());}
    {Add} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tAdd, yyline, yycolumn, yytext());}
    {Sub} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tSub, yyline, yycolumn, yytext());}
    {Multi} {System.out.println(yytext());
                return new Symbol(CometMachSymbols.tMulti, yyline, yycolumn, yytext());}
    {Div} {System.out.println(yytext());
            return new Symbol(CometMachSymbols.tDiv, yyline, yycolumn, yytext());}
    
    {EndSentence} {System.out.println(yytext());
                    return new Symbol(CometMachSymbols.tEndSentence, yyline, yycolumn, yytext());}
    . {System.out.println("Lexical error line: "+yyline+" column: "+yycolumn+ " token: "+yytext()+" is not declared.");}
}