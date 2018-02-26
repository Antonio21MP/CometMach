%%
%class cometmach
%unicode
%line
%standalone

%{

%}

Words = [a-zA-Z]
Digits = [0-9]
Comparative = [>|<|>=|<=|==|!=]
Operator = [+|-|*|\/]
Assing = \=
EndSentence = ;
Variable = {Words}+{Digits}* 
TF = tf({Space}{Variable}{Assing}(true|false){EndSentence}|{Space}{Variable}{EndSentence})
Num = num({Space}{Variable}{Assing}({Digits}+){EndSentence}|{Space}{Variable}{EndSentence})
Symbol = symbol({Space}{Variable}{Assing}(\'{Words}\'|\'{Digits}\'|\'{Operator}\'){EndSentence}|{Space}{Variable}{EndSentence})
IF = if
ELSE = else
FOR = for
SWAP = swap 
VALUE = value
Begin = \{
End = \}
BOX = box
Space = [ ]

%%
<YYINITIAL> {
    {TF} {System.out.println("TF: "+yytext());}
    {Symbol} {System.out.println("Symbol: "+yytext());}
    {Num} {System.out.println("Var: "+yytext());}
    . {}
}