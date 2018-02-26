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
TF = tf({Space}{AssignationTF}|{Space}{Variable}{EndSentence})
Num = num({Space}{AssignationNum}|{Space}{Variable}{EndSentence})
Symbol = symbol({Space}{AssignationSymbol}|{Space}{Variable}{EndSentence})
AssignationSymbol = {Variable}{Assing}(\'{Words}\'|\'{Digits}\'|\'{Operator}\'){EndSentence}
AssignationNum = {Variable}{Assing}({Digits}+){EndSentence}
AssignationTF = {Variable}{Assing}(true|false){EndSentence}
Assingnation = ({AssignationTF}|{AssignationNum}|{AssignationSymbol})
BoxAssing = {Variable}\[{Digits}+\]{Assing}
BoxAssingNum = {BoxAssing}\{(({Digits}+,{Digits}+)|(,{Digits}+))+\}
BoxAssingSymbol = {BoxAssing}\{(((\'{Words}\'|\'{Digits}\'|\'{Operator}\'),(\'{Words}\'|\'{Digits}\'|\'{Operator}\'))|(,(\'{Words}\'|\'{Digits}\'|\'{Operator}\')))+\}
BoxAssingTF = {BoxAssing}\{(((true|false),(true|false))|(,(true|false)))+\}
BoxVarAssing = {Variable}\[{Variable}\]{Assing}
BoxOr = (({Digits}+)|(true|false)|(\'{Words}\'|\'{Digits}\'|\'{Operator}\')) 
BoxUnitAssingnation = ({BoxAssing}|{BoxVarAssing}){BoxOr}{EndSentence}
BoxAssingnation = ({BoxAssingNum}|{BoxAssingSymbol}|{BoxAssingTF}){EndSentence}
IF = if
ELSE = else
FOR = for
SWAP = swap 
VALUE = value
Begin = \{
End = \}
BOX = box{Space}(tf|num|symbol){Space}{BoxAssingnation}
Space = [ ]

%%
<YYINITIAL> {
    {TF} {System.out.println("TF Correct: "+yytext());}
    {Symbol} {System.out.println("Symbol Correct: "+yytext());}
    {Num} {System.out.println("Num Correct: "+yytext());}
    {Assingnation} {System.out.println("Var Assignation Correct: "+yytext());}
    {BoxAssingnation} {System.out.println("Box Assignation Correct: "+yytext());}
    {BoxUnitAssingnation} {System.out.println("Box Unit Assignation Correct: "+yytext());}
    {BOX} {System.out.println("Box Correct: "+yytext());}
    . {}
}