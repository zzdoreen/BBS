<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<title>数据统计</title>
	<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
    <meta charset="utf-8" />
    <script src="https://cdn.jsdelivr.net/npm/echarts@4.6.0/dist/echarts.min.js"></script>
	<style>
        #topic,#user{
            border: 1px solid #ccc;
            background: rgba(255,255,255,0.3);
            border-radius: 15px;
            float:left;
            margin-right:5%;
        }
	</style>
</head>

<body>
    <%@include file="header.jsp" %>
	<div class="outer">
		<div class='inner'>
		<c:forEach var="module" items="${moduleList}">
			<h3 class='modules' style='display:none'>${module.name}</h3>
			<c:forEach var="topic" items="${module.topicList}" varStatus="status">
				<a class='topic' style='display:none'>${topic.name},${topic.postTotal},${module.name},${topic.viewCount},${topic.replyCount}</a>
			</c:forEach>
		</c:forEach>
		<c:forEach var='user' items="${userList}">
			<p class='province' style='display:none'>${user.province}</p>
		</c:forEach>
		
		<div id="chart" style="width:100%;height:55%;"></div>
		<div id="topic" style="width:45%;height:45%;"></div>
		<div id="user" style="width:45%;height:45%;"></div>
		
		</div>
    </div>
    
    <script type="text/javascript">
    	var oModules = document.getElementsByClassName('modules')
    	var oTopics = document.getElementsByClassName('topic')
    	var oProvince = document.getElementsByClassName('province')
    	var moduleData = []
    	var viewCount = []
    	var replyCount = []
    	var topicCount = []
    	
    	var topicDatas = []
    	var topicData = []
    	var obj = {}
    	var userDatas = []
    	var userData = []
    	for(let i=0;i<oModules.length;i++){
    		var modules = oModules[i].innerHTML
    		moduleData[i] = modules
    		viewCount.push(0)
    		topicCount.push(0)
    		replyCount.push(0)
    	}
    	for(let i=0;i<oTopics.length;i++){
    		var item = oTopics[i].innerHTML
    		topicDatas[i] = {
    				value: item.split(',')[1],
    				name: item.split(',')[0]
    		}
    		topicData[i] = item.split(',')[0]
    		var moduleName = item.split(',')[2]
    		var viewNum = Number(item.split(',')[3])
    		var replyNum = Number(item.split(',')[4])
    		var topicNum = Number(item.split(',')[1])
    		for(let j=0;j<moduleData.length;j++){
    			if(moduleName===moduleData[j]){
    				viewCount[j] += viewNum
    				replyCount[j] += replyNum
    				topicCount[j] += topicNum
    			}
    		}
    	}
    	
    	for(let i=0;i<oProvince.length;i++){
    		var users = oProvince[i].innerHTML
    		if(obj[users]){
    			obj[users]++
    		}else{
    			obj[users] = 1
    		}
    	}
    	for(let i in obj){
    		userDatas.push({
    			value: obj[i],
    			name: i
    		}) 
    		userData.push(i)
    	}
        // 基于准备好的dom，初始化echarts实例
        var topicChart = echarts.init(document.getElementById('topic'));
        var userChart = echarts.init(document.getElementById('user'));
        var allChart = echarts.init(document.getElementById('chart'));
        // 指定图表的配置项和数据
        topicOption = {
            title: {
                text: '帖子数据统计',
                left: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c} ({d}%)'
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                top: 'center',
                data: topicData
            },
            toolbox: {
                show: true,
                feature: {
                    mark: { show: true },
                    dataView: { show: true, readOnly: false },
                    magicType: {
                        show: true,
                        type: ['pie', 'funnel']
                    },
                    restore: { show: true },
                    saveAsImage: { show: true }
                }
            },
            series: [
                {
                    name: '帖子总数',
                    type: 'pie',
                    radius: [30, 100],
                    center: ['60%', '50%'], // left top
                    roseType: 'radius',
                    data: topicDatas,
                    label: {
                    	show: false
                    },
                    emphasis: {
                        label: {
                            show: true
                        }
                    },
                }
            ]
        };
        
        userOption = {
                title: {
                    text: '用户分布统计',
                    left: 'center'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: '{a} <br/>{b} : {c} ({d}%)'
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    top: 'center',
                    data: userData
                },
                toolbox: {
                    show: true,
                    feature: {
                        mark: { show: true },
                        dataView: { show: true, readOnly: false },
                        magicType: {
                            show: true,
                            type: ['pie', 'funnel']
                        },
                        restore: { show: true },
                        saveAsImage: { show: true }
                    }
                },
                series: [
                    {
                        name: '用户分布',
                        type: 'pie',
                        radius: [30, 100],
                        center: ['60%', '50%'], // left top
                        roseType: 'radius',
                        data: userDatas,
                        label: {
                        	show: false
                        },
                        emphasis: {
                            label: {
                                show: true
                            }
                        },
                    }
                ]
            };
        
        option = {
        	    tooltip: {
        	        trigger: 'axis',
        	        axisPointer: {
        	            type: 'cross',
        	            crossStyle: {
        	                color: '#999'
        	            }
        	        }
        	    },
        	    toolbox: {
        	        feature: {
        	            dataView: {show: true, readOnly: false},
        	            magicType: {show: true, type: ['line', 'bar']},
        	            restore: {show: true},
        	            saveAsImage: {show: true}
        	        }
        	    },
        	    legend: {
        	        data: ['访问量', '发帖量', '回复数']
        	    },
        	    xAxis: [
        	        {
        	            type: 'category',
        	            data: moduleData,
        	            axisPointer: {
        	                type: 'shadow'
        	            }
        	        }
        	    ],
        	    yAxis: [
        	        {
        	            type: 'value',
        	            name: '访问量',
        	            min: 0,
        	            max: 250,
        	            interval: 50,
        	            axisLabel: {
        	                formatter: '{value} 人'
        	            }
        	        },
        	        {
        	            type: 'value',
        	            name: '发帖量',
        	            min: 0,
        	            max: 25,
        	            interval: 5,
        	            axisLabel: {
        	                formatter: '{value} 条'
        	            }
        	        }
        	    ],
        	    series: [
        	        {
        	            name: '访问量',
        	            type: 'bar',
        	            data: viewCount
        	        },
        	        {
        	            name: '发帖量',
        	            type: 'bar',
        	            data: topicCount
        	        },
        	        {
        	            name: '回复数',
        	            type: 'line',
        	            yAxisIndex: 1,
        	            data: replyCount
        	        }
        	    ]
        	};
        
        // 使用刚指定的配置项和数据显示图表。
        topicChart.setOption(topicOption);
        userChart.setOption(userOption);
        allChart.setOption(option)
    </script>
</body>

</html>