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
Space = [ \t\n]
/*Commentary options*/
BlockComment = "$*" [^*] ~"*$"
InputCharacter = [^\r\n]
LineEnd = \r|\n|\r\n
Commentary = {BlockComment}|{}
EndOfLineComment     = "$"{InputCharacter}*{LineEnd}?
/*Operators*/
Comparative = [>|<|>=|<=|==|!=]
/*Operations*/
Add = \+
Sub = \-
Multi = \*
Div = \/
Assing = \=
/*Types*/
Symbol = symbol
Integer = int
Decimal = dec
Word = word
Boolean = bool
/*Array Options*/
Box = box
BoxAssingnation = \.assing
/*Conditions*/
If = if
Else = else
ElseIf = elseif
For = for
Swap = swap
Is = is
Cicle = cicle
DoCicle = do
/*Blocks*/
Init = {
End = }
ParOpen = (
ParClose = )
EndSentence = ;
/*Functions*/
Function = func
Return = return
Void = void
/*Main*/
Main = main
%TYPES
%MAIN
%WORD
%FUNCTION
%FUNC
%VOID
%BOX
%FOR
%IF
%SWAP
%CICLE
%DOCICLE
%ELSE
%ELSEIF
%%
<YYINITIAL> { 
    //{Function} {System.out.println("<Main / "+yytext()+">"; yybegin(FUNCTION);} 
    {Main} {System.out.println("<Main / "+yytext()+">"); yybegin(MAIN);}
    . {}
}
<MAIN> {
    {Integer} {System.out.println("<Type / "+yytext()+">");}
    {Decimal} {System.out.println("<Type / "+yytext()+">");}
    {Word} {System.out.println("<Type / "+yytext()+">");}
    {Symbol} {System.out.println("<Type / "+yytext()+">");}
    {Boolean} {System.out.println("<Type / "+yytext()+">");}
    {Id} {System.out.println("<Id / "+yytext()+">");}
    {Assing} {System.out.println("<Assign / "+yytext()+">"); yybegin(OPERATIONS);}
    
}
<OPERATIONS>{
    
}
/*
<FUNCTIONS> {

}
<FUNC> {

}
<VOID> {

}
<BOX> {

}
<IF> {

}
<ELSEIF> {

}
<ELSE> {

}
<CICLE> {

}
<DOCICLE> {

}
<SWAP> {

}
<IS> {

}
<FOR>{
*/
}