
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <title>场地预约</title>
    

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta content="always" name="referrer">

<meta http-equiv="Cache-Control" content="no-siteapp"/>
<meta name="keywords" content="湖南大学,体育场,体育场馆管理与预约系统,体育场馆预约,体育场馆管理,运动相册">
<meta name="description" content="湖南大学体育场馆管理与预约系统">

<script>
    var $ctx = "/gym";
    var $ctxStatic = "/gym/static";
    
    window.console = window.console || (function () {
            var c = {};
            c.log = c.warn = c.debug = c.info = c.error = c.time = c.dir = c.profile
                = c.clear = c.exception = c.trace = c.assert = function () {
            };
            return c;
        })();
</script>
<!--添加浏览器icon图标-->
<link type="image/x-icon" rel="icon" href="<%=path %>/resource/images/favicon.ico">
<!--style start-->
<link href="<%=path %>/resource/timePlanJs/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="<%=path %>/resource/timePlanJs/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="<%=path %>/resource/timePlanJs/animate.min.css" rel="stylesheet">
<link href="<%=path %>/resource/timePlanJs/style.min862f.css?v=4.1.0" rel="stylesheet">
<link href="<%=path %>/resource/timePlanJs/iconfont.css" rel="stylesheet">
<!-- 字体图标 -->
<!--style end-->

<!--[if lt IE 9]>
<script src="/gym/static/plugins/html5.min.js"></script>
<![endif]-->

<!--[if lt IE 9]>
<script src="/gym/static/plugins/json2.js"></script>
<![endif]-->

<!--[if (gte IE 9)|(!IE)]> -->
<script src="<%=path %>/resource/timePlanJs/jquery.min.js"></script>
<!-- <![endif]-->

<!--[if lt IE 9]>
<script src="/gym/static/plugins/jquery/jquery-1.12.4.min.js"></script>
<![endif]-->

<script src="<%=path %>/resource/timePlanJs/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=path %>/resource/timePlanJs/layer.js"></script>
<script src="<%=path %>/resource/timePlanJs/template.js"></script>
<script src="<%=path %>/resource/timePlanJs/moment-with-locales.js"></script>
<script src="<%=path %>/resource/timePlanJs/laypage.js"></script>
<script src="<%=path %>/resource/timePlanJs/jquery.qrcode.min.js"></script>



<!--jquery validate begin-->
<script src="<%=path %>/resource/timePlanJs/jquery.validate.min.js"></script>
<script src="<%=path %>/resource/timePlanJs/messages_zh.min.js"></script>
<script src="<%=path %>/resource/timePlanJs/jquery.validate.extend.js"></script>
<!--jquery validate end-->


<script src="<%=path %>/resource/timePlanJs/utils.js"></script>

    <!--style start-->
    <link href="<%=path %>/resource/timePlanJs/common.css" rel="stylesheet">  <!--my公共样式-->
    <link href="<%=path %>/resource/timePlanJs/venue_reservation.css" rel="stylesheet">
    <link href="<%=path %>/resource/timePlanJs/session.css" rel="stylesheet"/>
    <!--style end-->
</head>

<body>
<div class="article_box">
    <!-- header开始 -->


<!-- header开始 -->
<!-- 顶部标题和注册登录 -->
<div class="index_title">
    <div class="title_left" >
        <span id="activeUser" style="color:#fba979">戴志强&nbsp;</span>
        您好，欢迎访问湖南大学体育场馆管理与预约系统
        <span style="margin-left:5px; color:orangered;">目前系统正在试运行期间，如有问题，请将截图和问题描述，发送到cgzx@hnu.edu.cn邮箱进行反馈，谢谢大家！</span>
    </div>
    <div class="title_right" style="display:none;" id="noLoginDiv"><!-- 退出登录显示 -->
        <a href="/gym/login">登录</a>
        <span> | </span>
        <a href="/gym/register">注册</a>
    </div>
    <div class="title_right2" id="loginDiv"><!-- 登录后显示 -->
        <a href="/gym/order">我的预约</a>
        <span> | </span>
        <a class="_exit" href="#" onclick="loginout()">退出</a>
    </div>
</div>
<!-- 顶部标题部分结束 -->
<!-- logo -->
<div class="_logo">
    <div class="imgbox"></div>
</div>
<!-- logo结束 -->
<!-- 导航栏开始 -->
<nav class="index_nav">
    <ul>
        <li><a style="font-size: 16px;" id="index" href="/gym/index">首页</a></li>
        <li><a style="font-size: 16px;" id="intro" href="/gym/intro">场馆介绍</a></li>
        <li><a style="font-size: 16px;" id="book" href="/gym/book">场地预约</a></li>
        <li><a style="font-size: 16px;" id="info" href="/gym/info?type=1">新闻中心</a></li>
        <li><a style="font-size: 16px;" id="album" href="/gym/album">运动相册</a></li>
        <li><a style="font-size: 16px;" id="publicity" href="/gym/publicity">免费服务公示</a></li>
        
    </ul>
</nav>
<!-- /header结束 -->

<script type="text/javascript">
    /**
     * 根据页面导航的显示效果
     * @type {string}
     */
    var page = 'book';
    console.log('page='+page);
    $('.index_nav > li').removeClass('this_nav');
    $('#' + page).addClass('this_nav');

    $(function () {
        if (("" == null) || ("" == "")) {
            $("#loginDiv").hide();
            $("#noLoginDiv").show();
        } else {
            $("#noLoginDiv").hide();
            $("#loginDiv").show();
        }

        checkBrowser();
    });

    function loginout(){
   		window.location.href = $ctx + "/loginout";
    	/* U.ajax({
    		type:"GET",
            url: $ctx + "/loginout",//请求URL
            loading: true,//是否显示loading加载框
            success: function (data, status) {
            	 window.location.href = $ctx + "/login";
            }
        }); */
    }

    /**
     * 检测浏览器版本
     */
    function checkBrowser() {
        var isCompatible = true;//兼容

        var ua = navigator.userAgent.toLowerCase().toString();
        if (ua.indexOf("msie") > 0) {//IE内核
            if (ua.indexOf("msie 10.0") > -1) {//IE10
                isCompatible = true;
            } else if (ua.indexOf("msie 9.0") > -1) {//IE9
                isCompatible = true;
            } else if (ua.indexOf("msie 8.0") > -1) {//IE8
                isCompatible = false;
            } else if (ua.indexOf("msie 7.0") > -1) {//IE7
                isCompatible = false;
            } else if (ua.indexOf("msie 6.0") > -1) {//IE6
                isCompatible = false;
            }
        } else if (ua.indexOf("firefox") > 0) {//firefox
            isCompatible = true;
        } else if (ua.indexOf("chrome") > 0) {//Chrome
            isCompatible = true;
        } else if (ua.indexOf("safari") > 0 && ua.indexOf("chrome") < 0) {//Safari
            isCompatible = true;
        }else{
            isCompatible = true;
        }

        if (!isCompatible) {//若不兼容
            layer.alert('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本网站不支持IE9以下的浏览器访问，如果是360等双核浏览器，请选择切换到极速模式，!!!!推荐大家使用360极速模式或谷歌浏览器进行访问，可获得最佳体验哦！(*＾-＾*)', {icon: 6,title:'温馨提示'});

            /*layer.open({
                type: 1
                ,title: false //不显示标题栏
                ,closeBtn: false
                ,area: '300px;'
                ,shade: 0.8
                ,id: 'bs-layer-dialog' //设定一个id，防止重复弹出
                ,resize: false
                ,btn: ['我知道了']
                ,btnAlign: 'c'
                ,moveType: 1 //拖拽模式，0或者1
                ,content: '<div style="padding: 20px; line-height: 30px; background-color: #393D49; font-size:14px; color: #fff; font-weight: 300;"><h3 style="text-align:center; font-size:16px;margin-bottom: 10px; ">温馨提示</h3><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本网站不支持IE9以下的浏览器访问，如果是360等双核浏览器，请选择切换到极速模式，推荐大家使用360极速模式或谷歌浏览器进行访问，可获得最佳体验哦！(*＾-＾*)<span></div>'
                ,success: function(layero){
                    //设置按钮居中显示
                    var btn = layero.find('.layui-layer-btn');
                    btn.css('text-align', 'center');
                }
            });*/
        }
    }

    /*function getBrowserInfo() {
        var ua = navigator.userAgent.toLowerCase().toString();

        var regStr_ie = /msie [\d.]+;/gi;
        var regStr_ff = /firefox\/[\d.]+/gi
        var regStr_chrome = /chrome\/[\d.]+/gi;
        var regStr_saf = /safari\/[\d.]+/gi;

        //IE内核
        if (ua.indexOf("msie") > 0) {
            return ua.match(regStr_ie);
        }

        //firefox
        if (ua.indexOf("firefox") > 0) {
            return ua.match(regStr_ff);
        }

        //Chrome
        if (ua.indexOf("chrome") > 0) {
            return ua.match(regStr_chrome);
        }

        //Safari
        if (ua.indexOf("safari") > 0 && ua.indexOf("chrome") < 0) {
            return ua.match(regStr_saf);
        }
    }*/

</script>
    <!-- /header结束 -->

    <!-- 当前位置开始 -->
    <div id="position">
        当前位置：首页>场地预约
    </div>
    <!-- 当前位置结束 -->

    <!-- 内容部分 -->
    <article>
        <div class="yuyueBox"><!-- 预约内容块开始 -->
            <div class="venue_first">
                <div class="apply">

                    <div class="img_l"><img src="<%=path %>/resource/images/left.gif"/></div>

                    <div class="apply_nav">
                        <div class="apply_w" id="venues_container">

                            <script id="venues_tmpl" type="text/html">
                                {{each content as item i}}
                                <div id="{{item.id}}" class="apply_array" style="cursor: pointer;"
                                     data-id="{{item.id}}"
                                     data-name="{{item.name}}"
                                     onclick="onSelectVenues(this)">
                                    <div class="apply_img">
                                        <img src="{{item.picture}}"
                                             onerror="javascript:this.src='<%=path %>/resource/images/ic_default_circle.png'"/>
                                    </div>
                                    <div class="apply_info">
                                        <a href="javascript:void(0);">{{item.name}}</a>
                                    </div>
                                </div>
                                {{/each}}
                            </script>
                        </div>
                    </div>
                    <div class="img_r"><img src="<%=path %>/resource/images/right.gif"/></div>
                </div>
            </div>
            <div class="venue_infor" style="height: 170px;"><!-- 第二大块 -->
                <div class="infor_left">
                    <img id="venue_picture"
                         style="height: 112px; width: 112px;"
                         src="<%=path %>/resource/images/ic_default_circle.png"
                         onerror="javascript:this.src='<%=path %>/resource/images/ic_default_circle.png'">
                    <div class="leftText" style="width: 900px;">
                        <h3 id="venue_name"></h3>
                        <p>开放时间：<span id="venue_open_time"></span></p>
                        <p>场馆地址：<span id="venue_address"></span></p>
                        <p>联系电话：<span id="venue_phone"></span></p>
                        <p id="venue_description">
                        </p>
                    </div>
                </div>
            </div>
            <div class="kuailai_yd" id="activity-container" style="margin-top: 10px; display: none;"><!-- 第三块 -->
                <img src="<%=path %>/resource/images/sale.jpg" alt="">
                <span id="activity-title"></span>
            </div>
            <div style="width: 100%; height: auto; border: 1px solid #ebebeb; margin-top: 5px; padding-left: 20px;">
                <img src="<%=path %>/resource/images/placeholder.png" style="position: absolute;z-index:100;width: auto;width: 800px;height: 70px;opacity: 0;filter:alpha(opacity=0);">
                <!-- 天气块 -->
             <!--    <iframe name="tianqi-iframe" id="tianqi-iframe" width="100%" scrolling="no" height="60" frameborder="0"
                        allowtransparency="true"
                        src="http://i.tianqi.com/index.php?c=code&id=12&icon=3&py=yueluqu&num=7">
                </iframe> -->

                
            </div>
            
            <!-- 预约操作模块开始 -->
            <div class="yuyuecaozuo" style="margin-top: 10px;overflow:hidden;">
                <div class="ibox float-e-margins" style="margin-bottom: 0px;">
                    <div class="ibox-content white-bg">
                        <div class="l-detail">
                            <div class="border">
                                <div class="col-col-12">
                                    <div class="tabs-container">
                                        <div style="background-color: #efeded; overflow: hidden;"
                                             id="dataLine_container">
                                            <script id="dataLine_tmpl" type="text/html">
                                                <ul class="nav nav-tabs"
                                                    style="float: left;">
                                                    {{each content as item i}}
                                                    <li onclick="onSelectDate(this)" data-date="{{item.date}}">
                                                        <a class="text-center" data-toggle="tab" href="#"
                                                           aria-expanded="false">
                                                            {{if item.isToday}}
                                                            <p class="text-font16 m-n text-block">今天</p>
                                                            {{else if item.week ==1}}
                                                            <p class="text-font16 m-n text-block">周一</p>
                                                            {{else if item.week ==2}}
                                                            <p class="text-font16 m-n text-block">周二</p>
                                                            {{else if item.week ==3}}
                                                            <p class="text-font16 m-n text-block">周三</p>
                                                            {{else if item.week ==4}}
                                                            <p class="text-font16 m-n text-block">周四</p>
                                                            {{else if item.week ==5}}
                                                            <p class="text-font16 m-n text-block">周五</p>
                                                            {{else if item.week ==6}}
                                                            <p class="text-font16 m-n text-info">周六</p>
                                                            {{else if item.week ==7}}
                                                            <p class="text-font16 m-n text-info">周日</p>
                                                            {{/if}}
                                                            <p class="m-n text-muted">{{item.date}}</p>
                                                        </a>
                                                    </li>
                                                    {{/each}}
                                                </ul>
                                                
                                            </script>
                                        </div>
                                        <div class="tab-content" style="clear: both;">
                                            <div id="tab-1" class="tab-pane active">
                                                <div class="panel-body">
                                                    <div class="p-tb-xs overflow" id="juzhong">
                                                        <div class="col-xs-5 text-danger text-font12 p-n">
                                                            温馨提示：预订前请先关注预约时间的天气
                                                        </div>
                                                        <div class="col-xs-7 p-n">
                                                            <ul class="unstyled overflow text-right m-n p-n pull-right">
                                                                <li class="pull-left text-right m-r-md">
                                                                    <img class="m-r-xs"
                                                                         src="<%=path %>/resource/images/scene-chooes.png">
                                                                    可选
                                                                </li>
                                                                <li class="pull-left text-right m-r-md">
                                                                    <img class="m-r-xs"
                                                                         src="<%=path %>/resource/images/xuanzhong.png">已选
                                                                </li>
                                                                <li class="pull-left text-right m-r-md">
                                                                    <img class="m-r-xs"
                                                                         src="<%=path %>/resource/images/yuding.png">已预订
                                                                </li>
                                                                <li class="pull-left text-right">
                                                                    <img class="m-r-xs"
                                                                         src="<%=path %>/resource/images/no.png">已锁
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <!-- 中间表格开始 -->
                                                    <div class="article_2"><!-- 方框 -->
                                                        <div class="scrollBox"><!-- 方框开始 -->
                                                            <div class="box-scroll" id="session_container">
                                                                <script id="session_tmpl" type="text/html">
                                                                    <div class="box-title bgColor">
                                                                        <div></div>
                                                                        {{each content.sites as site i}}
                                                                        <div title="{{site.name}}">
                                                                            {{site.name}}
                                                                        </div>
                                                                        {{/each}}
                                                                    </div>
                                                                    <div class="box-time">
                                                                        <div class="box-list bgColor" id="box-list">
                                                                            {{each content.timeLines as item i}}
                                                                            <div title="{{item.startTime}}-{{item.endTime}}"
                                                                                 style="line-height: 10px;padding-top: 5px;">
                                                                                {{item.startTime}}<br/>-<br/>{{item.endTime}}
                                                                            </div>
                                                                            {{/each}}
                                                                        </div>

                                                                        {{each content.sites as site i}}
                                                                        <div class="box-list">
                                                                            {{each site.sessions as session j}}
                                                                            {{if isSelected(session.uid)}}
                                                                            <div data-sid="{{session.uid}}"
                                                                                 data-venuesid="{{session.venuesId}}"
                                                                                 data-siteid="{{session.siteId}}"
                                                                                 data-starttime="{{session.startTime}}"
                                                                                 data-endtime="{{session.endTime}}"
                                                                                 data-venuesname="{{site.venues.name}}"
                                                                                 data-sitename="{{site.name}}"
                                                                                 data-price="{{session.price}}"
                                                                                 data-originalPrice="{{session.originalPrice}}"
                                                                                 class="selectTrue selected">
                                                                                
                                                                            </div>
                                                                            {{else if session.state == 0}}
                                                                            <div data-sid="{{session.uid}}"
                                                                                 data-venuesid="{{session.venuesId}}"
                                                                                 data-siteid="{{session.siteId}}"
                                                                                 data-starttime="{{session.startTime}}"
                                                                                 data-endtime="{{session.endTime}}"
                                                                                 data-venuesname="{{site.venues.name}}"
                                                                                 data-sitename="{{site.name}}"
                                                                                 data-price="{{session.price}}"
                                                                                 data-originalPrice="{{session.originalPrice}}"
                                                                                 class="selectTrue">
                                                                                
                                                                            </div>
                                                                            {{else if session.state == 2}}
                                                                            <div data-sid="{{session.uid}}"
                                                                                 data-venuesid="{{session.venuesId}}"
                                                                                 data-siteid="{{session.siteId}}"
                                                                                 data-starttime="{{session.startTime}}"
                                                                                 data-endtime="{{session.endTime}}"
                                                                                 data-venuesname="{{site.venues.name}}"
                                                                                 data-sitename="{{site.name}}"
                                                                                 data-price="{{session.price}}"
                                                                                 data-originalPrice="{{session.originalPrice}}"
                                                                                 style="color: white;font-size: 11px;"
                                                                                 class="selectYuding block-booking">
                                                                                
                                                                                {{if session.booking != null}}
                                                                                {{if session.booking.state ==1}}
                                                                                <span
                                                                                        data-name="{{session.booking.userName}}"
                                                                                        data-code="{{session.booking.memberCode}}"
                                                                                        data-phone="{{session.booking.phone}}"
                                                                                        style="line-height: 40px;">
                                                                                        支付中
                                                                                    </span>
                                                                                {{else if session.booking.state ==2}}
                                                                                <span
                                                                                        data-name="{{session.booking.userName}}"
                                                                                        data-code="{{session.booking.memberCode}}"
                                                                                        data-phone="{{session.booking.phone}}">
                                                                                        {{session.booking.userName}}<br/>
                                                                                        {{session.booking.memberCode}}
                                                                                    </span>
                                                                                {{/if}}
                                                                                {{/if}}
                                                                            </div>
                                                                            {{else if session.state == 1}}
                                                                            <div data-venuesid="{{session.venuesId}}"
                                                                                 data-siteid="{{session.siteId}}"
                                                                                 data-starttime="{{session.startTime}}"
                                                                                 data-endtime="{{session.endTime}}"
                                                                                 style="color: orangered;font-size: 12px;cursor: not-allowed;"
                                                                                 class="selectFalse block-locked">
                                                                                
                                                                                {{if session.lockInfo != null}}
                                                                                <span
                                                                                        data-description="{{session.lockInfo.description}}"
                                                                                        data-startdate="{{session.lockInfo.startDate}}"
                                                                                        data-enddate="{{session.lockInfo.endDate}}"
                                                                                        data-weeks="{{session.lockInfo.weeks}}"
                                                                                        style="line-height: 40px;"
                                                                                        onclick="venue_unlock('{{session.uid}}' )">
                                                                                </span>
                                                                                    {{session.lockInfo.typeName}}
                                                                                    
                                                                                     
                                                                                          
                                                                                    

                                                                                        
                                                                                    

                                                                                {{/if}}
                                                                            </div>
                                                                            {{else if session.state ==3 || session.state
                                                                            ==4 }}
                                                                            <div data-sid="{{session.uid}}"
                                                                                 data-venuesid="{{session.venuesId}}"
                                                                                 data-siteid="{{session.siteId}}"
                                                                                 data-starttime="{{session.startTime}}"
                                                                                 data-endtime="{{session.endTime}}"
                                                                                 data-venuesname="{{site.venues.name}}"
                                                                                 data-sitename="{{site.name}}"
                                                                                 data-price="{{session.price}}"
                                                                                 style="color: black;font-size: 12px;cursor: not-allowed;"
                                                                                 class="selectFalse block-disabled">
                                                                                {{if session.disableReason != null &&
                                                                                session.disableReason.length>0}}
                                                                                <span data-disablereason="{{session.disableReason}}"
                                                                                      style="line-height: 40px;">
                                                                                    {{session.disableReason}}
                                                                                </span>
                                                                                {{/if}}
                                                                            </div>
                                                                            {{else}}
                                                                            <div data-sid="{{session.uid}}"
                                                                                 data-venuesid="{{session.venuesId}}"
                                                                                 data-siteid="{{session.siteId}}"
                                                                                 data-starttime="{{session.startTime}}"
                                                                                 data-endtime="{{session.endTime}}"
                                                                                 data-venuesname="{{site.venues.name}}"
                                                                                 data-sitename="{{site.name}}"
                                                                                 data-price="{{session.price}}"
                                                                                 data-originalPrice="{{session.originalPrice}}"
                                                                                 class="selectFalse">
                                                                                
                                                                            </div>
                                                                            {{/if}}
                                                                            {{/each}}
                                                                        </div>
                                                                        {{/each}}

                                                                    </div>
                                                                </script>
                                                            </div>
                                                        </div>
                                                        <!-- 更改后的方框 -->

                                                  <!--       <div class="p-tb-xs">
                                                            <div class="border-l-primary p-xxs">
                                                                <h4 class="inline m-n">服务设施</h4>
                                                                <span class="text-warning">（点击下面的图标选择购买相应的服务）</span>
                                                            </div>
                                                            <div class="p-xxs m-t overflow position-relative"
                                                                 id="service_container">

                                                            </div>
                                                            <script id="service_tmpl" type="text/html">
                                                                {{each rows as item i}}
                                                                <div class="pull-left m-r m-b"
                                                                     style="width: 70px;text-align: center"
                                                                     title="{{item.name}}"
                                                                     data-goodsid="{{item.id}}"
                                                                     data-goodsname="{{item.name}}"
                                                                     data-goodsunit="{{item.unit}}"
                                                                     data-goodsprice="{{item.price}}">
                                                                    <div class="icon-serve"
                                                                         title="{{item.name}}"
                                                                         style="margin: 0 auto;"></div>
                                                                    <div class="m-t-sm text-center"
                                                                         title="{{item.name}}"
                                                                         style="overflow: hidden;white-space:nowrap;text-overflow:ellipsis;">
                                                                        {{item.name}}
                                                                    </div>
                                                                </div>
                                                                {{/each}}
                                                            </script>
                                                       </div> -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="r-detail">
                                    <div class="gray-bg overflow">
                                        <h4 class="p-xs m-n border-bottom">已选场次</h4>
                                        <div class="p-xs zuoce">
                                            点击左侧<img
                                                src="<%=path %>/resource/images/scene-chooes.png"
                                                alt=""
                                                style="display:inline-block;width:32px;background-color:#fff;">选择场次，再次点击取消选择，所有场次预订成功后不予退还。
                                        </div>
                                    </div>
                                    <div class="m-t gray-bg overflow">
                                        <div class="p-lr-sm overflow" id="orderContent">

                                        </div><!--  //这个是右边的框选，就是说当在左边选择了 ，就会自动显示在右边 -->
                                        <script id="order_session_tmpl" type="text/html">
                                            <div id="{{uid}}"
                                                 class="order-session col-xs-12 white-bg p-n m-t animated fadeInDown"
                                                 data-uid="{{uid}}"
                                                 data-venuesid="{{venuesId}}"
                                                 data-siteid="{{siteId}}"
                                                 data-starttime="{{startTime}}"
                                                 data-endtime="{{endTime}}"
                                                 data-venuesname="{{venuesName}}"
                                                 data-sitename="{{siteName}}"
                                                 data-price="{{price}}"
                                                 data-type="session">
                                                <div class="col-xs-12 p-xxs">
                                                    <label class="col-xs-3 p-n m-b-n text-right">时间：</label>
                                                    <div class="col-xs-9 word-wrap">{{sessionTime}}</div>
                                                </div>
                                                <div class="col-xs-12 p-xxs">
                                                    <label class="col-xs-3 p-n m-b-n text-right">场地：</label>
                                                    <div class="col-xs-9 word-wrap">{{siteName}}</div>
                                                </div>
                                                <i class="iconfont icon-shanchu text-danger" data-id="{{uid}}"
                                                   onclick="onRemoveSession(this)"></i>
                                            </div>
                                        </script>

                                        <script id="order_service_tmpl" type="text/html">//这个我完全用不到，这个地方是服务的选择
                                            <div class="order-goods col-xs-12 white-bg p-n m-t animated fadeInDown"
                                                 id="gid{{goodsId}}"
                                                 data-goodsid="{{goodsId}}"
                                                 data-goodsname="{{goodsName}}"
                                                 data-goodsunit="{{goodsUnit}}"
                                                 data-goodsprice="{{goodsPrice}}"
                                                 data-type="goods">
                                                <div class="col-xs-12 p-xxs" title="{{goodsName}}">
                                                    <label title="{{goodsName}}"
                                                           class="col-xs-3 p-n m-b-n text-right m-t-xs"
                                                           style="text-overflow: clip;overflow: hidden;white-space: nowrap;">{{goodsName}}：</label>
                                                    <div class="col-xs-9 word-wrap">
                                                        <span class="num">
                                                            <button type="button" class="minus"
                                                                    onclick="onMinusGoodsQuantity(this)">-</button>
                                                            <input type="text" class="inputBorder" value="1"/>
                                                            <button type="button" class="add"
                                                                    onclick="onAddGoodsQuantity(this)">+</button>
                                                        </span>
                                                        <span class="span-control m-l-sm">{{goodsUnit}}</span>
                                                    </div>
                                                </div>
                                                <i class="iconfont icon-shanchu text-danger" data-goodsid="{{goodsId}}"
                                                   onclick="onRemoveService(this)"></i>
                                            </div>
                                        </script>
                                        <div class="col-xs-12 p-lr-sm m-t m-b">
                                            已选<span style="font-weight: bold;" class="text-warning"
                                                    id="session_size">0</span>个场地
                                        </div>
                                        <div class="col-xs-12 p-n m-t-md m-b-md text-center">
                                            <button onclick="confirmBook()" type="button"
                                                    class="btn btn-primary m-t-sm">确定预订
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 预约操作模块结束 -->
        <!-- 预约内容块开始 -->
    </article>
    <!-- 内容部分结束 -->

    <form id="order-form" name="order-form" action="/gym/order/submit" method="post" style="display: none;">
        <input id="temp_order_content" name="order" type="hidden"/>
    </form>
</div>



<footer>
    <p>湖南大学&copy;版权所有&nbsp;&nbsp;&nbsp;Email: cgzx@hnu.edu.cn&nbsp;&nbsp;&nbsp;
        <a href="http://www.szyangda.com/index.html" target="_blank">技术支持:湖南洋达信息科技有限公司</a>
    </p>
    <p>
        本网站不支持360浏览器兼容模式以及IE9以下的浏览器访问，推荐大家使用谷歌浏览器或使用360浏览器极速模式进行访问
    </p>
</footer>

<div class="hover-booking"><!-- 鼠标右边的tips -->
    <p>姓名：<span id="user-name"></span></p>
    <p>账号：<span id="user-code"></span></p>
    <p>手机：<span id="user-phone"></span></p>
</div>

<div class="hover-locked"><!-- 鼠标右边的tips -->
    <div>开始日期：<span id="lock-start"></span></div>
    <div>结束日期：<span id="lock-end"></span></div>
    <div>锁场周期：<span id="lock-weeks"></span></div>
    <div style="display: none;">锁场原因：<span id="lock-description"></span></div>
</div>

<div class="hover-disabled"><!-- 鼠标右边的tips -->
    <div>禁用原因：<span id="disable-reason"></span></div>
</div>

<!-- empty view -->
<script id="empty-view-tmpl" type="text/html">
    <div style="padding: 20px; text-align: left;">
        <img src="/gym/static/images/ic-empty-view.png" style="width: 50px; height: 50px; margin-left: 20px;"/>
        <span>{{text}}</span>
    </div>
</script>
<!-- empty view -->

<script src="<%=path %>/resource/timePlanJs/venue_reservation.js"></script>
<script src="<%=path %>/resource/timePlanJs/constant.js"></script>



<script>
    var curVenuesId;//当前选中的场馆ID
    var curVenuesName;
    var allVenues;//所有场馆
    var userTypeId = U.transfer('1');
    console.log("user type=" + userTypeId);

    $(function () {//1默认打开网页就会开是的函数，同时调用初始化函数
        curVenuesId = U.getUrlParam('vid');//获取首页传过来的场馆ID

        initAllVenues();

        bindListener();//调用一些绑定监听器，类似就是鼠标事件，或者选择事件，
    });

    function bindListener() {
        onSelectSession();

      //  bindServiceGoodsListener();

        bindHoverListener();
    }


    /**
     * 选择场次事件，具体的场次事件，选择与取消！！！！！！
     */
    function onSelectSession() {
        $('.selectTrue').on('click', function (e) {
            var uid = $(this).data('sid');
            var venuesId = $(this).data('venuesid');
            var siteId = $(this).data('siteid');
            var startTime = $(this).data('starttime');
            var endTime = $(this).data('endtime');
            var siteName = $(this).data('sitename');
            var venuesName = $(this).data('venuesname');
            var price = $(this).data('price');

            var sessionTime = startTime + '-' + moment(endTime, "YYYY-MM-DD HH:mm").format('HH:mm');

            if ($(this).hasClass('selected')) {//取消选择
                $(this).removeClass("selected");

                $('#' + uid).slideUp(300, function () {
                    $('#' + uid).remove();//移除右侧已选的场次
                    //更新显示数量
                    refreshOrderSize();
                });
            } else {//选择场次
                $(this).addClass("selected");
                var session = {
                    uid: uid,
                    venuesId: venuesId,
                    siteId: siteId,
                    startTime: startTime,
                    endTime: endTime,
                    sessionTime: sessionTime,
                    venuesName: venuesName,
                    siteName: siteName,
                    price: price
                };

                var html = template("order_session_tmpl", session);
                $("#orderContent").append(html);

                //更新显示数量
                refreshOrderSize();
            }
        });
    }

    /**
     * 移除场次事件
     */
    function onRemoveSession(obj) {
        $(obj).parent().slideUp(300, function () {
            //移除父级div
            $(obj).parent().remove();
            //更新显示数量
            refreshOrderSize();
        });

        $("div[data-sid='" + $(obj).data('id') + "']").removeClass("selected");
    }

    /**
     * 选择场馆事件
     */
    function onSelectVenues(obj) {
        $('.apply_w').find('a').removeClass('info');
        $(obj).find('a').addClass('info');
        //场馆ID
        var id = $(obj).data('id');
        var name = $(obj).data('name');
        curVenuesId = id;
        curVenuesName = name;
        resetOrder();//重置清空订单信息

        initVenuesDetails(id);
        initDateLines(id);
        //initServiceGoods(id);
       // initPromotionInfo(id);
    }


    var date = "";
    /**
     * 选择日期事件
     */
    function onSelectDate(obj) {
        $('#dataLine_container').find('a').removeClass('active');
        $(obj).find('a').addClass('active');
        $(obj).removeClass('active');

        date = $(obj).data('date');
        initSessions(date);
    }

    /**
     * 获取所有场馆，这个地方是获取所有的场馆，并不是加载下面的详细的数据的，然后后面如果会选择某一歌场馆就会触发加载详细数据的
     */
    function initAllVenues() {
        U.ajax({
            url: "/testYu/resource/list.txt",// 请求URL
            data: {},
            loading: true,
            success: function (data, status) {
                if (data.no == 2000) {
                    allVenues = data.content;

                    var html = template("venues_tmpl", data);
                    $("#venues_container").html(html);

                    initCoverFlow();//加载场馆的同时，就是增加流动效果

                    if (U.isEmpty(curVenuesId)) {
                        //默认选中第一个场馆
                        $('.apply_w').find('a:first').trigger('click');
                    } else {
                        $('#' + curVenuesId).trigger('click');
                    }
                } else {
                    U.msg("获取场馆失败");
                }
            }
        });
    }

    /**
     * 获取场馆信息
     */
    function getVenuesInfo(id) {
        if (allVenues != null) {
            for (var i = 0; i < allVenues.length; i++) {
                var venues = allVenues[i];
                if (id == venues.id) {
                    return venues;
                }
            }
        }
        return null;
    }

    function initVenuesDetails(id) {
        var venues = getVenuesInfo(id);

        $('#venue_name').html(venues.name);
        $('#venue_open_time').html(venues.openingTimeStart + ' - ' + venues.openingTimeEnd);
        $('#venue_address').html(venues.address);
        $('#venue_phone').html(venues.phone);
        $('#venue_description').html(venues.description);
        $('#venue_picture').attr('src', venues.picture);
    }

    function initDateLines(id) {
    	
    	 $.ajax({
             type: "GET",
             url: "dateLInes",
             data: {id: id,
                 userTypeId: userTypeId //用户身份类型
                 },
             dataType: "json",
             success: function(data){
            	 if (data.no == 2000) {
                     var html = template("dataLine_tmpl", data);
                     $("#dataLine_container").html(html);

                     $('#dataLine_container').find('a:first').trigger('click');
                 } else {
                     U.msg("获取场馆可选日期失败");
                 }
                      }
         });
       <%--  U.ajax({
            url: "dateLInes",// 请求URL<%=path %>/resource/datelines.txt
            data: {
                id: id,
                userTypeId: userTypeId //用户身份类型
            },
            loading: true,
            success: function (data, status) {
                if (data.no == 2000) {
                    var html = template("dataLine_tmpl", data);
                    $("#dataLine_container").html(html);

                    $('#dataLine_container').find('a:first').trigger('click');
                } else {
                    U.msg("获取场馆可选日期失败");
                }
            }
        }); --%>
    }

    /**
     * 初始化场次
     */
    function initSessions(date) {
        U.ajax({
            url: "<%=path %>/resource/load.txt",// 请求URL
            data: {
                id: curVenuesId,
                date: date,
                userTypeId: userTypeId //用户身份类型
            },
            loading: true,
            success: function (data, status) {
                if (data.no == 2000) {
                    var html = template("session_tmpl", data);
//                    console.log(JSON.stringify(data));
                    $("#session_container").html(html);

                    setGridBoxSize();

                    bindListener();
                } else {
                    U.msg("获取场次失败");
                }
            }
        });
    }

    /**
     * 初始化服务设施/商品
     */
   /*  function initServiceGoods(id) {
        U.ajax({
            url: "/testYu/resource/list2.txt",// 请求URL
            data: {
                "pageParam": {
                    "pageSize": 1000,
                    "currentPage": 1,
                    "order": "asc"
                },
                "gymVenuesId": id,
                "isDiscount": -1,
                "isDeleted": 0
            },
            loading: true,
            success: function (data, status) {
                if (data != null && data.rows != null) {

                    if (data.total > 0) {//服务数量
                        var html = template("service_tmpl", data);
                        $("#service_container").html(html);
                    } else {
                        var html = template("empty-view-tmpl", {text: '暂时没有服务哦！'});
                        $("#service_container").html(html);
                    }

                    bindServiceGoodsListener();
                } else {
                    U.msg("获取场馆服务设施失败");

                    var html = template("empty-view-tmpl", {text: '暂时没有服务哦！'});
                    $("#service_container").html(html);
                }
            }
        });
    } */

    /**
     * 获取促销活动信息
     */
  /*   function initPromotionInfo(id) {
        U.ajax({
            url: "/testYu/resource/latest.txt",// 请求URL
            data: {
                venuesId: id,//场馆id
                gymUserTypeId: userTypeId//身份类型ID
            },
            success: function (data, status) {
                if (data != null && data.no == 2000 && data.content != null && data.content.id != null) {//活动不为空
                    $('#activity-title').html(data.content.title);
                    $('#activity-container').show();
                } else {
                    $('#activity-container').hide();
//                    U.msg("获取促销活动信息失败");
                }
            }
        });
    } */
//这个地方是初始化上面的图片流动的额，就是点击右就会向右转
    function initCoverFlow() {
        $li1 = $(".apply_nav .apply_array");
        $window1 = $(".apply .apply_w");
        $left1 = $(".apply .img_l");
        $right1 = $(".apply .img_r");

        $window1.css("width", $li1.length * 104);

        var lc1 = 0;
        var rc1 = $li1.length - 10;

        $left1.click(function () {
            if (lc1 < 1) {
                console.log("已经是第一张图片");
                return;
            }
            lc1--;
            rc1++;
            $window1.animate({left: '+=104px'}, 500);
        });

        $right1.click(function () {
            if (rc1 < 1) {
                console.log("已经是最后一张图片");
                return;
            }
            lc1++;
            rc1--;
            $window1.animate({left: '-=104px'}, 500);
        });
    }

    /**
     *设置网格大小
     **/
    function setGridBoxSize() {
        var gridWid = $(".box-list div").outerWidth();
        var count = $("#box-list").children().length;
        $(".box-list").width(count * gridWid);
    }

    function bindServiceGoodsListener() {
        $(".icon-serve").mouseover(function () {//移入
            $(this).addClass("serve-jia").parent().siblings().children().removeClass("serve-jia");
        }).mouseout(function () {//移出
            $(this).removeClass("serve-jia").parent().siblings().children().removeClass("serve-jia");
        }).unbind('click').click(function () {//点击
            if ($(this).hasClass("serve-shooes")) {//取消服务
                $(this).removeClass("serve-shooes");

                var orderGoods = $('#orderContent').find("div[data-goodsid='" + $(this).parent().data('goodsid') + "']");
                $(orderGoods).slideUp(300, function () {
                    $(orderGoods).remove();
                });

            } else {//添加服务
                $(this).addClass("serve-shooes");

                var goodsId = $(this).parent().data('goodsid');
                var goodsUnit = $(this).parent().data('goodsunit');
                var goodsName = $(this).parent().data('goodsname');
                var goodsPrice = $(this).parent().data('goodsprice');

                var goods = {
                    goodsId: goodsId,
                    goodsUnit: goodsUnit,
                    goodsName: goodsName,
                    goodsPrice: goodsPrice
                }

                var html = template("order_service_tmpl", goods);
                $("#orderContent").append(html);
            }
        });
    }
//服务相关，用不到
    function onRemoveService(obj) {
        $(obj).parent().slideUp(300, function () {
            //移除父级div
            $(obj).parent().remove();
        });

        $("div[data-goodsid='" + $(obj).data('goodsid') + "']").children().removeClass("serve-shooes");
    }
//下面这个就是关于服务相关的，目前也用不到！
    function onAddGoodsQuantity(obj) {
        //加号
        var $parent = $(obj).parent(".num");
        var $num = window.Number($(".inputBorder", $parent).val());
        $(".inputBorder", $parent).val($num + 1);

        //设置减号是否可用
        $num = window.Number($(".inputBorder", $parent).val());
        if ($num <= 1) {
            $(obj).parent().find('.minus').attr("disabled", true);
            $(obj).parent().find('.minus').css("cursor", "not-allowed");
        } else {
            $(obj).parent().find('.minus').attr("disabled", false);
            $(obj).parent().find('.minus').css("cursor", "pointer");
        }
    }
//这个服务相关的函数，目前我也用不到
    function onMinusGoodsQuantity(obj) {
        //减号
        var $parent = $(obj).parent(".num");
        var $num = window.Number($(".inputBorder", $parent).val());

        if ($num > 1) {
            $(".inputBorder", $parent).val($num - 1);
        }

        //设置减号是否可用
        $num = window.Number($(".inputBorder", $parent).val());
        if ($num <= 1) {
            $(obj).attr("disabled", true);
            $(obj).css("cursor", "not-allowed");
        } else {
            $(obj).attr("disabled", false);
            $(obj).css("cursor", "pointer");
        }
    }

    /**
     * 更新数量
     */
    function refreshOrderSize() {
        //更新显示数量
        $('#session_size').html(' ' + $('.order-session').size() + ' ');
    }

    /**
     * 重置清空订单，切换场馆需清空订单，不支持同时预约不同的场馆
     */
    function resetOrder() {
        $("#orderContent").empty();//切换场馆需清空订单，不支持同时预约不同的场馆

        //更新显示数量
        refreshOrderSize();
    }

    /**
     * 确定预约
     */
    function confirmBook() {
        /*if (U.isEmpty(userTypeId)) {
         U.msg('请先登录');
         return;
         }*/
        if ($('.order-session').size() > 0 || $('.order-goods').size() > 0) {
            var sessionArr = new Array();
            var goodsArr = new Array();

            if ($('.order-session').length > 0) {
                $('.order-session').each(function (i) {
                    var val = new Object();

                    val.venuesId = $(this).data('venuesid');
                    val.siteId = $(this).data('siteid');
                    val.siteName = $(this).data('sitename');
                    val.startTime = $(this).data('starttime');
                    val.endTime = $(this).data('endtime');
                    val.venuesName = $(this).data('venuesname');
                    val.quantity = 1;//数量
                    val.price = $(this).data('price');
                    val.type = $(this).data('type');

                    sessionArr.push(val);
                });
            }

            if ($('.order-goods').length > 0) {
                $('.order-goods').each(function (i) {
                    var val = new Object();

                    val.goodsId = $(this).data('goodsid');
                    val.goodsUnit = $(this).data('goodsunit');
                    val.goodsName = $(this).data('goodsname');
                    val.goodsPrice = $(this).data('goodsprice');
                    val.quantity = parseInt($(this).find('.inputBorder').val());//数量
                    val.type = $(this).data('type');

                    goodsArr.push(val);
                });
            }
            console.log('goodsArr=' + goodsArr.length);
            console.log('sessionArr=' + sessionArr.length);

            if (sessionArr.length > Config.MAX_BOOKING_COUNT) {//超出预约限制
                U.msg('超出预约限制：同一帐号，同一场馆，一天最多只能预约' + Config.MAX_BOOKING_COUNT + '个场次');
                return;
            }


            order = {
                member: {
                    code: U.transfer(''),
                    name: U.transfer(''),
                    phone: U.transfer(''),
                    userTypeId: userTypeId
                },
                venues: {
                    id: curVenuesId,
                    name: curVenuesName
                },
                bookings: sessionArr,
                goods: goodsArr
            };
            console.log(JSON.stringify(order));

            //跳转到订单确认页面，因为参数数据量大，所以必须采取form方式POST传参并跳转
            $('#temp_order_content').val(JSON.stringify(order));
            $('#order-form').submit();//上面那个地方有地址
        } else {
            U.msg('请先选择场次或服务');
        }
    }

    function getSelectedSession() {
        var sids = new Array();
        $('.order-session').each(function (i) {
            sids.push($(this).data('uid'));
        });
        return sids;
    }

    /**
     * 判断是否已选择
     */
    template.helper("isSelected", function (uid) {
        var index = $.inArray(uid, getSelectedSession());
        if (index != -1) {//已选择
            return true;
        } else {
            return false;
        }
    });

    /**
     * 鼠标悬浮显示信息
     */
    function bindHoverListener() {
        $('.block-booking').mousemove(function (e) {
            var span = $(this).find('span');
            if (span != null) {
                $('#user-name').html($(span).data('name'));
                $('#user-code').html($(span).data('code'));
                $('#user-phone').html($(span).data('phone'));
            }
            $('.hover-booking').show().css({
                "top": e.pageY + 1,
                "left": e.pageX + 10
            });
        }).mouseleave(function () {
            $('.hover-booking').hide();
        });

        $('.block-locked').mousemove(function (e) {
            var span = $(this).find('span');
            if (span != null) {
                var startDate = moment($(span).data('startdate'), "YYYY-MM-DD HH:mm:ss").format("YYYY-MM-DD");
                var endDate = moment($(span).data('enddate'), "YYYY-MM-DD HH:mm:ss").format("YYYY-MM-DD");

                $('#lock-start').html(startDate);
                $('#lock-end').html(endDate);
                $('#lock-weeks').html(U.getChineseWeeks($(span).data('weeks')));
                $('#lock-description').html($(span).data('description'));
            }
            $('.hover-locked').show().css({
                "top": e.pageY + 1,
                "left": e.pageX + 10
            });
        }).mouseleave(function () {
            $('.hover-locked').hide();
        });

        $('.block-disabled').mousemove(function (e) {
            var span = $(this).find('span');
            if (span != null) {
                $('#disable-reason').html($(span).data('disablereason'));
            }
            $('.hover-disabled').show().css({
                "top": e.pageY + 1,
                "left": e.pageX + 10
            });
        }).mouseleave(function () {
            $('.hover-disabled').hide();
        });
    }


    /**
     * 解锁
     */
    function unlock(id) {
        layer.confirm('您确定要解锁该场次吗？', {
            btn: ['确定', '取消'],
            yes: function (index, layero) {
                U.ajax({
                    url: "/gym/api/lock/details/unlock",// 请求URL
                    loading: true,
                    data: {
                        id: id
                    },
                    success: function (data, status) {
                        if (data.no == 2000 && data.content != null && data.content > 0) {
                            U.msg("解锁成功");
                            initSessions(date);
                        } else {
                            U.msg("解锁失败");
                        }
                    }
                });
            },
            btn2: function (index, layero) {
                layer.close(index);
            }
        })
    }


    function venue_unlock(uid) {
        var venuesId, siteId, startTime, endTime, state, lockDate;

        venuesId = uid.substring(0, 2);
        siteId = uid.substring(3, 5);
        startTime = uid.substring(17, 22).replace("-", ":");
        endTime = uid.substring(23, 28).replace("-", ":");
        lockDate = uid.substring(6, 16);
        lockDate = lockDate + " 00:00:00"
        state = 1;
        U.ajax({
            url: "/gym/api/lock/details/getUnlockDetails",// 请求URL
            loading: true,
            data: {
                venuesId: venuesId,
                siteId: siteId,
                sessionStartTime: startTime,
                sessionEndTime: endTime,
                state: state,
                lockDate: lockDate,
            },
            success: function (data, status) {
//                alert(JSON.stringify(data));
                if (data.no == 2000 && data.content != null) {
                    var id = data.content.id;
                    unlock(id);
                } else {
                    U.msg("服务异常");
                }
            }
        });
//        alert(venuesId);
//        alert(siteId);
//        alert(startTime);
//        alert(lockDate);
//        alert(endTime);
//        alert(lockDate);
        //1.通过锁场id获取锁场详情
        //2.通过锁场详情id和当前日期和当前场次获取当前锁场id

        //        lockId: lockId,
        //            startLockDate: $('#lockdate-picker-start ').val(),
        //            endLockDate: $('#lockdate-picker-end').val(),
        //            sessionStartTime: $('#startTime').val(),
        //            sessionEndTime: $('#endTime').val(),
        //            state: $('#select-state').val(),
        //            week: $('#select-week').val(),
        //            siteId: $('#select-site').val()
    }
</script>
</body>

</html>
