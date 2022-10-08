<div class="box box-primary" style="padding: 10px">
    <div class="box-header with-border">
        <h3 class="box-title">获取关键词排名</h3>
    </div>
    <form class="form-inline padding20" role="form" method="post">
          <!-- action="{{ url('admin/keyword/python') }}"> -->
        {{ csrf_field() }}

        <div class="form-group">
            <label>选择国家：</label>
            <select name="country" id="country" class="form-control">
                <option value="US"> 美国</option>
                <option value="CA"> 加拿大</option>
            </select>
        </div>
        <div class="form-group">
            <label>输入关键词：</label>
            <input type="text" class="form-control" id="keyword" name="keyword">
        </div>
        <div class="form-group">
            <label>输入ASIN：</label>
            <input type="text" class="form-control" id="asin" name="asin">
        </div>

        <div class="form-group">
            <button type="submit" onclick="onclick()" class="btn btn-primary btn-block btn-flat">开始获取排名</button>
        </div>

        <a class="col-md-4 col-sm-6 col-12 fonticon-container" target="_blank" href="{{url('admin/keyword/python')}}">
                    <div class="fonticon-wrap">
                        <i class="feather icon-activity"></i>
                    </div>
                    <span class="fonticon-classname mt-1">领料出库汇总</span>
        </a>

    </form>
</div>

<script>
Dcat.ready(function () {
    // js代码也可以放在模板里面
    console.log('所有JS脚本都加载完了!!!');

    function onclick(){
                var is=event.currentTarget;
                console.log($(is)); //获取当前元素，类同this  返回绑定事件的元素
                console.log(event.target);  //返回触发事件的元素
                
                console.log(event.target.nodeName )　 //获取事件触发元素标签name 
                console.log(event.target.className)　  //获取事件触发元素classname
                console.log(event.target.innerHTML)　　  //获取事件触发元素的内容
                console.log(event.target.id)　//获取事件触发元素id
            
                console.log(event.currentTarget.nodeName )　 //获取事件绑定元素标签name 
                console.log(event.currentTarget.className)　  //获取事件绑定元素classname
                console.log(event.currentTarget.innerHTML)　　  //获取事件绑定元素的内容
                console.log(event.currentTarget.id)　//获取事件绑定元素id
            }
});
</script>