import net.html
import net.http
import os

fn main() {
    res := http.get("http://www.jokeji.cn/jokehtml/bxnn/2021020621070738.htm")? 
    doc := html.parse(res.text)
    tag := doc.get_tag('h1')[0] // <h1>Hello world!</h1>
    println(tag.name) // h1
    println(tag.content) // Hello world!
    println(tag.attributes) // {'class':'title'}
    println(tag.str()) // <h1 class="title">Hello world!</h1>
    mut f := os.create("res.txt")? 
    f.write_str(tag.str())?
    f.close()
}
