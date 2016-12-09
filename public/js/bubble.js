$(document).ready(function(){

	// calling this method draws the bubble chart viz using this JSON file
	drawBubbleChart(baseURL+'/blogs/vizData/');
    // drawDendrogram(baseURL+'/blogs/vizData/');

	$('#editShirtTitleForm').submit(function(e){
		e.preventDefault(); // don't submit the form

		var title = $('#editShirtTitle').val();
		var id = $('#editShirtID').val();

		$.post(
			baseURL+'/blogs/editTitle/process/',
			{
				'title': title,
				'id': id
			},
			function(data) {
				if(data.success == 'success') {
					// Edit successful
					$('#editShirtTitleForm').hide(); // hide edit panel
					$('#deleteBlog').hide();

					drawBubbleChart(baseURL+'/blogs/vizData/'); // redraw viz
				} else if (data.error != '') {
					alert(data.error); // show error as popup
				}
			},
			'json'
		);

        //  $.ajax({
        //     type: "post",
        //     url: baseURL+'/blogs/editTitle/process/',
        //     dataType:"json",
        //     data:
        //     {
		// 		'title': title,
		// 		'id': id
		// 	},
        //     success: function (response) {
        //         if(response.success === "success") {
        //             console.log("success");
        //             // do something with response.message or whatever other data on success
        //         }
        //     },
        //     error: function (errorResponse) {
        //         console.log(errorResponse.responseText);
        //     }
        // })
        // return false;
	});

	$('#deleteBlog').submit(function(e){
		e.preventDefault(); // don't submit the form

		var title = $('#deleteTitle').val();
		var id = $('#deleteID').val();
		console.log(id);
		$.post(
			baseURL+'/blogs/deleteBlog/process/',
			{
				'title': title,
				'id': id
			},
			function(data) {
				if(data.success == 'success') {
					// Edit successful
					$('#editShirtTitleForm').hide(); // hide edit panel
					$('deleteBlog').hide(); // hide edit panel

					drawBubbleChart(baseURL+'/blogs/vizData/'); // redraw viz
				} else if (data.error != '') {
					alert(data.error); // show error as popup
				}
			},
			'json'
		);


	});


});

// source: http://bl.ocks.org/mbostock/4063269
function drawBubbleChart(jsonUrl) {
	$('svg').empty(); // clear any previous graphics elements

    console.log("BUBBLE");

    var diameter = 960,
    format = d3.format(",d"),
    color = d3.scaleOrdinal(d3.schemeCategory20c);

    var bubble = d3.pack()
        .size([diameter, diameter])
        .padding(1.5);

    var svg = d3.select("svg")
        .attr("width", diameter)
        .attr("height", diameter)
        .attr("class", "bubble");

    // var svg = d3.select("body").append("svg")
    //     .attr("width", diameter)
    //     .attr("height", diameter)
    //     .attr("class", "bubble");

    d3.json(jsonUrl/*baseURL+"/flare.json"*/, function(error, data) {
      if (error) throw error;

      var root = d3.hierarchy(classes(data))
          .sum(function(d) { return d.value; })
          .sort(function(a, b) { return b.value - a.value; });

      bubble(root);
      var node = svg.selectAll(".node")
          .data(root.children)
          .enter().append("g")
          .attr("class", "node")
        //   .attr("transform", function(d) { return "translate(" + 100 + "," + 100 + ")"; });
          .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")";
					})
					.on("mouseover",function(d){
						d3.select(this).classed("hovered", true);

					})
					.on("mouseout",function(d){
						d3.select(this).classed("hovered", false);
					})
					.on("click", function(d) {
							if($('#editShirtTitleForm').is(':visible')) {
                                $('#editShirtTitleForm').hide();
																$('#deleteBlog').hide();

                                // $('#addCommentForm').hide();
							} else {
								$('#editShirtTitle').val(d.data.title);
								$('#deleteTitle').val(d.data.title);
								$('#editShirtID').val(d.data.id);
								$('#deleteID').val(d.data.id);
								$('#editShirtTitleForm').show();
								$('#deleteBlog').show();
								$('#deleteBlog').focus();
								$('#editShirtTitle').focus();
                                // $('#addCommentForm').show();
							}
					});


      node.append("title")
          .text(function(d) { return d.data.title + ": " + format(d.value); });

      node.append("circle")
    //   .attr("r", 20)
          .attr("r", function(d) { return d.r; });
          // .style("fill", function(d) {
          //   return color(d.data.packageName);
          // });

      node.append("text")
          .attr("dy", ".3em")
          .style("text-anchor", "middle")
        //   .text(function(d) { return d.data.title; });
          .text(function(d) { return d.data.title.substring(0, d.r / 3); });
    });

    // Returns a flattened hierarchy containing all leaf nodes under the root.
    function classes(root) {
      var classes = [];

      function recurse(name, node) {
        if (node.children) node.children.forEach(function(child) { recurse(node.name, child); });
        else classes.push({packageName: name, id: node.id, title: node.name, value: node.size});
      }

      recurse(null, root);
      return {children: classes};
    }

    d3.select(self.frameElement).style("height", diameter + "px");
}
