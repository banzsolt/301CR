/**
 * Created by Zsolti on 13/12/2016.
 */

$(function () {

    var hoverFormater = function(content, date) {
        var new_date = "{0}-{1}-{2} {3}:{4}:{5}".format(date.getFullYear(), date.getMonth()+1, date.getDate(), date.getHours(), date.getMinutes(), date.getSeconds());
        var begin_index = content.toString().search('>')+1;
        var end_index = content.substring(1, content.length - 1).search('<')+1;
        var edited_content =  content.replace(content.substring(begin_index, end_index), "");

        return edited_content.substr(0, begin_index) + new_date + edited_content.substr(begin_index);
    };

    gon.history_data.forEach(function(element){
       element['rank'] = 1/element['rank']
    });

    Morris.Line({
        element: 'history-graph',
        data: gon.history_data,
        yLabelFormat: function(y) { return 1/y; },
        xLabelFormat: function (x) { return "{0}-{1}-{2}".format(x.getFullYear(), x.getMonth()+1, x.getDate())},
        xkey: 'created_at',
        ykeys: ['rank'],
        labels: ['Rank'],
        ymin: 0.00001,
        hoverCallback: function (index, options, content, row) {
            return hoverFormater(content,new Date(gon.history_data[index].created_at));
        }
    });

    $('.hide-graph').click(function() {
        var graphDiv = $(this).parent().find('.hidable-graph');
        if (graphDiv.is(":hidden")) {
            graphDiv.show("slow");
        } else {
            graphDiv.slideUp();
        }
    });





});