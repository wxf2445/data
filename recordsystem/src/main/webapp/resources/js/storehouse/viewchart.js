$(document).ready(function () {
    var theme = "shine";
    var linechart = "";
    var getSensorDataUrl = $.fn.getBaseName() + "/json/storehouse/sensordata";
    console.log(getSensorDataUrl);
    var initCharts = function () {
        //var effect = ['spin' , 'bar' , 'ring' , 'whirling' , 'dynamicLine' , 'bubble'];
        //effectIndex = ++effectIndex % effect.length;
        theme = "shine";
        linechart = echarts.init($(".linechart")[0], theme);
        linechart.clear();
        linechart.showLoading({
            text: "请稍后，正在获取数据！",
            effect: 'bubble',
            textStyle: {
                fontSize: 20
            }
        });
    }
    var showChart = function (result) {

        option = {
            tooltip: {
                trigger: 'axis',
                position: function (pt) {
                    return [pt[0], '10%'];
                }
            },
            title: {
                left: 'center',
                text: '大数据量面积图',
            },
            legend: {
                top: 'bottom',
                data: ['温度', '湿度']
            },
            toolbox: {
                feature: {
                    dataZoom: {
                        yAxisIndex: 'none'
                    },
                    restore: {},
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: result.dates
            },
            yAxis: {
                type: 'value',
                boundaryGap: [0, '100%']
            },
            dataZoom: [{
                type: 'inside',
                start: 0,
                end: 30
            }, {
                start: 0,
                end: 30,
                handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
                handleSize: '80%',
                handleStyle: {
                    color: '#fff',
                    shadowBlur: 3,
                    shadowColor: 'rgba(0, 0, 0, 0.6)',
                    shadowOffsetX: 2,
                    shadowOffsetY: 2
                }
            }],
            series: [
                {
                    name: '温度',
                    type: 'line',
                    smooth: true,
                    symbol: 'none',
                    sampling: 'average',
                    itemStyle: {
                        normal: {
                            color: 'rgb(255, 70, 131)'
                        }
                    },
                    areaStyle: {
                        normal: {
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: 'rgb(255, 158, 68)'
                            }, {
                                offset: 1,
                                color: 'rgb(255, 70, 131)'
                            }])
                        }
                    },
                    data: result.temps
                },
                {
                    name: '湿度',
                    type: 'line',
                    smooth: true,
                    symbol: 'none',
                    sampling: 'average',
                    itemStyle: {
                        normal: {
                            color: 'rgb(255, 70, 131)'
                        }
                    },
                    areaStyle: {
                        normal: {
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: 'rgb(255, 158, 68)'
                            }, {
                                offset: 1,
                                color: 'rgb(255, 70, 131)'
                            }])
                        }
                    },
                    data: result.moistures
                }
            ]
        };

        // 为echarts对象加载数据
        linechart.setOption(option);
        linechart.hideLoading();
    }
    $(".viewchart").on("click", function (e) {
        $('#chartTemplate').tmpl().replaceAll($('#nonFooterModal .modal-body'));
        $('#nonFooterModal').modal("show");
        $("#nonFooterModal .head").text("库房温湿度图表");
        var stid = $(this).closest("tr").attr("id");
        initCharts();
        $.ajax({
            type: "get",
            url: getSensorDataUrl,
            data: {id: stid},
            success: function (result) {
                console.log(result);
                showChart(result.sensordata);
            }
        });
    });
});