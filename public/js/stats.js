$( document ).ready(function() {
    // Histogramme Google
    var lecteurs = parseInt($('#lecteurs').text());
    var nonLecteurs = parseInt($('#non-lecteurs').text());
    google.charts.load('43', {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ['Element', 'Density', { role: 'style' }],
        ['Lecteurs', lecteurs, 'gold'],
        ['Non-lecteurs', nonLecteurs, 'color: #e5e4e2' ]
      ]);
      var options = {
        title: "Pourcentage des lecteurs/non-lecteurs parmi les utilisateurs",
        bar: {groupWidth: '50%'},
        legend: 'none',
        showValueLabels: true,
        width: 900,
        height: 500,
      };
      var chart_div = document.getElementById('chart_div');
      var chart = new google.visualization.ColumnChart(chart_div);
      // Wait for the chart to finish drawing before calling the getImageURI() method.
      google.visualization.events.addListener(chart, 'ready', function () {
        chart_div.innerHTML = '<img src="' + chart.getImageURI() + '">';
      });
      chart.draw(data, options);
    }

    // Box Plot
    var cinemaArray = $('#cinema').text();
    cinemaArray = $.parseJSON( '[' + cinemaArray + ']' );

    var TVArray = $('#tv').text();
    TVArray = $.parseJSON( '[' + TVArray + ']' );

    var computerArray = $('#computer').text();
    computerArray = $.parseJSON( '[' + computerArray + ']' );

    var tabletArray = $('#tablet').text();
    tabletArray = $.parseJSON( '[' + tabletArray + ']' );

    $('#container').highcharts({

        chart: {
            type: 'boxplot'
        },

        title: {
            text: 'Box plot des films vus en fonction du support'
        },
        credits: {
            enabled: false
        },

        legend: {
            enabled: false
        },

        xAxis: {
            categories: ['Cinéma', 'TV', 'Ordinateur', 'Tablette'],
            title: {
                text: 'Support de visionnage'
            }
        },

        yAxis: {
            title: {
                text: 'Nombre de films vus par semaine'
            }
        },

        series: [{
            name: 'Nombre de films vus par semaine',
            data: [
                cinemaArray,
                TVArray,
                computerArray,
                tabletArray
            ],
            tooltip: {
                headerFormat: '<em>Support de visionnage: {point.key}</em><br/>'
            }
        }]

    });



    // Chart pie
    $('a[data-toggle="pill"]').on('shown.bs.tab', function (e) {
    var target = $(e.target).attr("href") // activated tab
    if(target == '#piechart')
    {
      var aimeLire = parseInt($('#likeReading').text());
      var aimePasLire = parseInt($('#dontLikeReading').text());
      // Chart pie
      $('#chart_pie').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: 'Répartition de l\'envie de lire davantage'
            },
            credits: {
                enabled: false
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                        style: {
                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                        }
                    }
                }
            },
            series: [{
                name: 'Brands',
                colorByPoint: true,
                data: [{
                    name: 'Veulent lire plus',
                    y: aimeLire
                }, {
                    name: 'Ne veulent pas lire plus',
                    y: aimePasLire,
                    sliced: true,
                    selected: true
                }]
            }]
        });
    }
    });


});