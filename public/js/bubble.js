$(document).ready(function(){

	// calling this method draws the bubble chart viz using this JSON file
	drawBubbleChart(baseURL+'/blogs/vizData/');
    // drawDendrogram(baseURL+'/blogs/vizData/');

	$('#editShirtTitleForm').submit(function(e){
		e.preventDefault(); // don't submit the form

		var title = $('#editShirtTitle').val();
		var id = $('#editPostID').val();

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
                    $('#addCommentForm').hide();

                    $("div.temp").remove();

					drawBubbleChart(baseURL+'/blogs/vizData/'); // redraw viz
				} else if (data.error != '') {
					alert(data.error); // show error as popup
				}
			},
			'json'
		);
	});

    $('#addCommentForm').submit(function(e){
		e.preventDefault(); // don't submit the form

        var id = $('#editPostID').val();
		var comment = $('#addedComment').val();

		$.post(
			baseURL+'/blogs/addComment/process/',
			{
				'comment': comment,
                'id': id
			},
			function(data) {
				if(data.success == 'success') {
					// Edit successful
                    $('#editShirtTitleForm').hide(); // hide edit panel
					$('#deleteBlog').hide();
                    $('#addCommentForm').hide();

                    $("div.temp").remove();

					drawBubbleChart(baseURL+'/blogs/vizData/'); // redraw viz
				} else if (data.error != '') {
					alert(data.error); // show error as popup
				}
			},
			'json'
		);
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
					$('#deleteBlog').hide();
                    $('#addCommentForm').hide();

          $("div.temp").remove();

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
						$("div.temp").remove();

							if($('#editShirtTitleForm').is(':visible')) {
                                $('#editShirtTitleForm').hide(); // hide edit panel
            					$('#deleteBlog').hide();
                                $('#addCommentForm').hide();
								//$("div.temp").remove();

							} else {
								$('#editShirtTitle').val(d.data.title);
								$('#deleteTitle').val(d.data.title);
								$('#editShirtID').val(d.data.id);
								$('#deleteID').val(d.data.id);
								$('#editPostID').val(d.data.id);
								$('#editShirtTitleForm').show();
								$('#deleteBlog').show();
								$('#addCommentForm').show();
								$('#deleteBlog').focus();
								$('#editShirtTitle').focus();
								$('#addedComment').focus();

								$.ajax({
										url: baseURL + '/comments/' + d.data.id + '/',
										type: 'GET',
										success: function(res) {
												console.log(res);
												var obj = jQuery.parseJSON( res );
												$('#parent').append("<div class = 'temp'><h1> Comments </h1></div>");
												for (i = 0; i < obj.length; i++) {
													$('#parent').append("<div class = 'temp'>  " + obj[i] + "</div>");

												}
											}
										});
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
