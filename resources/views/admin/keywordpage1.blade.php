<div style="background-image:divbackground.jpg;">
    <div id="header">
        <h1>Python获取亚马逊关键词排名</h1>
    </div>

        <div id="input">
            <p>
                <a style="display: block;">请输入国家(US/CA):</a>
                <input id="country" type="text" value="CA" style="text-align:left;width:300px;"/>
            </p>
            <p>
                <a style="display: block;">请输入查询的关键词:</a>
                <input id="keyword" type="text" value="Solar Watering Can Lights" style="width:300px;"/>
            </p>
            <p>
                <a style="display: block;">请输入ASIN:</a>
                <input id="asin" type="text" value="B0B2922DGL" style="width:300px;"/>
            </p>
            <p>
                <input id="inputBtn" type="submit" value="输入完毕" class="btn btn-primary btn-flat" />
            </p>
            <!-- onclick="inputSave()" -->
        </div>
    <p></p>
     点击运行Python按钮，将本地执行test4.py程序
    <div id="program1">
        执行test3程序（方式1）
        <button onclick="exec1('python test4.py')" class="btn btn-primary btn-flat">运行 python</button>
    </div>
    <div id="program2">
        执行test3程序（方式2）
        <input type="button" value="运行 python" onclick="exec1('python test4.py')" class="btn btn-primary btn-flat" />
    </div>
     点击结果, 将在框内显示出计算的结果
    <div id="result">
        <a>显示结果:</a>
        <span id="form_result"></span>
         <iframe name="result" width="100" height="30" scrolling="no" frameborder="3"></iframe>
    </div>
    <p></p>
    <div id="result">
        使用说明：文本框输入一个数字，然后依次点击 [输入完毕] [运行python] [显示结果]
    </div> 
</div>
<script>
document.getElementById("inputBtn").onclick = function() 
{
    // 设置在此处单击#button时要发生的事件
    var country = document.getElementById("country").value; //获得网页文本框的值
    var keyword = document.getElementById("keyword").value;
    var asin = document.getElementById("asin").value;
    var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');

    var param1 = {
            "country":country,
            "keyword" : keyword,
            "asin" : asin,
            _token: CSRF_TOKEN
        };
    
    // window.alert(param1["country"]);
    // window.alert(country);
    $.ajax({
        type:'POST',
        url:'keywordtool/input',
        data:JSON.stringify(param1),
        // dataType: 'JSON',
        contentType: 'application/json; charset=utf-8',

        success: function(data) {
            // console.log(data.msg);
            window.alert(data.msg);

            // alert(data.code);


            $("#form_result").text(data.msg);
        }
    });
}

</script>
