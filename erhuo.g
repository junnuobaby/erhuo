%grammar_analyzer_name erhuo_grammar;
%lexical_analyzer_name erhuo_lexer;
%symbol_stack_name erhuo_stack;

start : code
      ;

code : code line
     | line
     ;

line : assign
     | block {block_list.append($1)}
     | function
     ;

assign : 'let' func_def '=' right_val {function_dict[$2[0][1]] = ($2[1], $4)}
       ;

func_def : name '(' def_arg_list ')' {$$ = ($1, $3)}
         ;

def_arg_list : def_arg_list ',' name {$$ = $1 + [$3]}
             | name {$$ = [$1]}
             | {$$ = None}
             ;

right_val : string
          | block
          | function
          | name
          ;

block : name '{' attr_list ';' sub '}' {$$ = ("block", $1, $3, $5)}
      ;

attr_list : attr_list ',' attr {$$ = $1 + [$3]}
          | attr {$$ = [$1]}
          | {$$ = None}
          ;

attr : name ':' string {$$ = ($1, $3)}
     | name ':' function {$$ = ($1, $3)}
     | name ':' name {$$ = ($1, $3)}
     ;

sub : sub ',' sub_line {$$ = $1 + [$3]}
    | sub_line {$$ = [$1]}
    | {$$ = None}
    ;

sub_line : block
         | function
         | string
         | name
         ;

function : name '(' arg_list ')' {$$ = ("function", $1, $3)}
         ;

arg_list : arg_list ',' arg {$$ = $1 + [$3]}
         | arg {$$ = [$1]}
         | {$$ = None}
         ;

arg : name
    | string
    | function
    ;

@initial
@@
function_dict = {}
block_list = []
@@

@ending
@@
return block_list, function_dict
@@

@extend
@@
indent_str = "    "
no_reverse = ["link", "input", "meta", "img"]


def gen_code(item, func_dict, arg_dict, disable_type, indent):
    if "string" not in disable_type and item[0] == "string":
        output.write(item[1][1:-1])
        multi = False
    elif "block" not in disable_type and item[0] == 'block':
        output.write("\n")
        gen_block(item, func_dict, arg_dict, indent + 1)
        multi = True
    elif "function" not in disable_type and item[0] == "function":
         multi = gen_function(item, func_dict, arg_dict, indent)
    elif "name" not in disable_type and item[0] == "name":
         multi = gen_code(arg_dict[item[1]], func_dict, arg_dict, [], indent)
    return multi


def gen_block(block, func_dict, arg_dict, indent):
    output.write(indent_str * indent + "<" + block[1][1])
    if block[2] is not None:
        for attr in block[2]:
            output.write(" " + attr[0][1] + "=\"")
            gen_code(attr[1], func_dict, arg_dict, ["block"], indent)
            output.write("\"")
    output.write(">")
    multi = False
    if block[3] is not None:
        for sub in block[3]:
             multi += gen_code(sub, func_dict, arg_dict, [], indent)
        if len(block[3]) > 1 or multi:
            output.write("\n" + indent_str * indent)
    if block[1][1] not in no_reverse:
        output.write("</%s>" % block[1][1])


def gen_function(function, func_dict, arg_dict, indent):
    arg_list, func_body = func_dict[function[1][1]]
    if arg_list is not None:
        real_arg_list = function[2]
        for i in range(len(arg_list)):
            arg_dict[arg_list[i][1]] = real_arg_list[i]
    return gen_code(func_body, func_dict, arg_dict, [], indent)

import sys
output = sys.stdout

if __name__ == "__main__":
    if len(sys.argv) in [2, 3]:
        if len(sys.argv) == 3:
            output = open(sys.argv[2], "w", encoding="utf-8")
        with open(sys.argv[1], "r", encoding="utf-8") as fp:
            s = fp.read()
            bl, fd = erhuo_grammar(erhuo_lexer(s))
            for b in bl:
                gen_block(b, fd, {}, 0)
                output.write("\n")
        if output != sys.stdout:
            output.close()
    else:
        print("Usage: %s <source_file> <html_file>" % sys.argv[0])
        exit(0)
@@