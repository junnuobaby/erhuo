let css(addr) = link {href: addr, rel: "stylesheet";}
let js(addr) = script {src: addr;}
let my_button(btext, color) = button {type: "button", class: color; btext}
let primary_button(pbtext) = my_button(pbtext, "btn btn-primary")
let default_button(dbtext) = my_button(dbtext, "btn btn-default")
let my_block(blktitle, blktext, b1, b2, img_src) =
div {class: "col-sm-6 col-md-4";
    div {class: "thumbnail";
        img {src: img_src, alt: "...";},
        div {class: "caption";
            h3 {; blktitle}, p {; blktext}, p{;primary_button(b1), default_button(b2)}
        }
    }
}

html {lang: "zh-cn";
    head {;
        title {; "Erhuo Language"},
        meta {http-equiv: "Content-Type", content:"text/html; charset=utf-8";},
        css("//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css"),
        js("//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"),
        js("//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js")
    },
    body {;
        div {class: "jumbotron";
            div {class: "container";
                h1 {; "Erhuo 二货"},
                p {; "Erhuo是让你的前端开发更加轻松。"}
            }
        },
        div {class: "container";
            div {class: "panel panel-primary";
                div {class: "panel-heading"; h3 {class: "panel-title"; "Erhuo前端设计语言"}},
                div {class: "panel-body"; "Erhuo语言可以让你更方便地编写html，它允许你定义可复用的函数，让前端设计更加模块化，条例更加清晰。Erhuo基于boson开发的。"}
            },
            div {class: "row";
                my_block("为什么使用Erhuo", "Erhuo让你的前端设计更加简单，更加程序化、结构化、模块化。", "了解Erhuo", "Erhuo文档", "1.png"),
                my_block("为什么叫Erhuo", "Erhuo就是二货，叫这个名字原因很简单，因为开发它的作者就是个二货。", "加入Erhuo", "开发手册", "2.png"),
                my_block("使用Boson", "Erhuo是基于Boson开发的，因此开发过程非常方便，目前仅仅只有150行代码。", "了解Boson", "Boson文档", "3.png")
            }
        }
    }
}
