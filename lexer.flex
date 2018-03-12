%%
%class cometmach
%unicode
%line
%standalone

%{

%}

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
%state MAIN
%%
<YYINITIAL> { 
    //{Function} {System.out.println("<Main / "+yytext()+">"; yybegin(FUNCTION);} 
    {Main} {System.out.println("<Main / "+yytext()+">"); yybegin(MAIN);}
    . {}
}
<MAIN> {
    {True} {System.out.println("<True / "+yytext()+">");}
    {False} {System.out.println("<False / "+yytext()+">");}
    {If} {System.out.println("<IF / "+yytext()+">");}
    {Assign} {System.out.println("<Assign / "+yytext()+">");}
    {Or} {System.out.println("<OR / "+yytext()+">");}
    {And} {System.out.println("<AND / "+yytext()+">");}
    {Comparative} {System.out.println("<Comparative / "+yytext()+">");}
    {ElseIf} {System.out.println("<ELSEIF / "+yytext()+">");}
    {Else} {System.out.println("<ELSE / "+yytext()+">");}
    {Swap} {System.out.println("<SWAP / "+yytext()+">");}
    {Is} {System.out.println("<IS / "+yytext()+">");}
    {Number} {System.out.println("<Digits / "+yytext()+">");}
    {Char} {System.out.println("<Char / "+yytext()+">");}
    {Then} {System.out.println("<Then / "+yytext()+">");}
    {Close} {System.out.println("<Close / "+yytext()+">");}
    {Default} {System.out.println("<Default / "+yytext()+">");}
    {For} {System.out.println("<For / "+yytext()+">");}
    {ParOpen} {System.out.println("<ParOpen / "+yytext()+">");}
    {To} {System.out.println("<To / "+yytext()+">");}
    {ParClose} {System.out.println("<ParClose / "+yytext()+">");}
    {End} {System.out.println("<End / "+yytext()+">");}
    {DoCicle} {System.out.println("<DoCicle / "+yytext()+">");}
    {Cicle} {System.out.println("<Default / "+yytext()+">");}
    {Box} {System.out.println("<Box / "+yytext()+">");}
    {Boxassignation} {System.out.println("<Box.Assignation / "+yytext()+">");}
    {Function} {System.out.println("<Function / "+yytext()+">");}
    {Void} {System.out.println("<Void / "+yytext()+">");}
    {Return} {System.out.println("<Function / "+yytext()+">");}
    {Commentary} {System.out.println("<Comentary / "+yytext()+">");}
    {Init} {System.out.println("<Init / "+yytext()+">");}
    {Integer} {System.out.println("<Type / "+yytext()+">");}
    {Decimal} {System.out.println("<Type / "+yytext()+">");}
    {Word} {System.out.println("<Type / "+yytext()+">");}
    {Sentence} {System.out.println("<Sentence / "+yytext()+">");}
    {Symbol} {System.out.println("<Type / "+yytext()+">");}
    {Boolean} {System.out.println("<Type / "+yytext()+">");}
    {Space} {System.out.println("<Space / "+yytext()+">");}
    {LineEnd} {System.out.println("<LineEnd / "+yytext()+">");}
    {Tab} {System.out.println("<Tab / "+yytext()+">");}
    {Id} {System.out.println("<ID / "+yytext()+">");}
    {StapleOpen} {System.out.println("<StapleOpen / "+yytext()+">");}
    {StapleClose} {System.out.println("<StapleClose / "+yytext()+">");}
    {Comma} {System.out.println("<Comma / "+yytext()+">");}
    {Add} {System.out.println("<Operation / "+yytext()+">");}
    {Sub} {System.out.println("<Operation / "+yytext()+">");}
    {Multi} {System.out.println("<Operation / "+yytext()+">");}
    {Div} {System.out.println("<Operation / "+yytext()+">");}
    {Number} {System.out.println("<Digits / "+yytext()+">");}
    {EndSentence} {System.out.println("<EndSentence / "+yytext()+">");}
    
}