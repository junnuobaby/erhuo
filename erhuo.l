%ignore skip;
%newline newline;

"[_a-zA-Z][_a-zA-Z0-9\-]*" name;
"\".*?[^\\]\"|\"\""        string;
"="                        assign;
"\{"                       brace_l;
"\}"                       brace_r;
"\("                       bracket_l;
"\)"                       bracket_r;
"\:"                       attr;
"\,"                       comma;
"\;"                       semicolon;
"\t|\ "                    skip;
"\r\n|\n"                  newline;