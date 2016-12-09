$(document).ready(function(){

	// calling this method draws the bubble chart viz using this JSON file
	// drawBubbleChart(baseURL+'/blogs/vizData/');
    drawDendrogram(baseURL+'/blogs/vizData/');

	// $('#editShirtTitleForm').submit(function(e){
	// 	e.preventDefault(); // don't submit the form
    //
	// 	var title = $('#editShirtTitle').val();
	// 	var id = $('#editShirtID').val();
    //
	// 	$.post(
	// 		baseURL+'/shirts/editTitle/process/',
	// 		{
	// 			'title': title,
	// 			'id': id
	// 		},
	// 		function(data) {
	// 			if(data.success == 'success') {
	// 				// Edit successful
	// 				$('#editShirtTitleForm').hide(); // hide edit panel
	// 				drawDendrogram(baseURL+'/shirts/vizData/'); // redraw viz
	// 			} else if (data.error != '') {
	// 				alert(data.error); // show error as popup
	// 			}
	// 		},
	// 		'json'
	// 	);
	// });

});

// source: http://bl.ocks.org/mbostock/4063570
function drawDendrogram(jsonUrl) {
	$('svg').empty(); // clear any previous graphics elements

	// grab the SVG element
	var svg = d3.select("svg"),
	    width = +svg.attr("width"), // store width and height locally
	    height = +svg.attr("height"),
			// shift everything right so we can see root text label
	    g = svg.append("g").attr("transform", "translate(40,0)");

	// create dendrogram layout
	var tree = d3.cluster()
	    .size([height, width - 160]); // shift everything left to see text labels

	// grab data to be visualized from JSON file
	d3.json(jsonUrl, function(error, treeData) {
	    if (error) throw error;

			// create a root node from this dataset
	    var root = d3.hierarchy(treeData);

        console.log(root);
        console.log(jsonUrl);

	    tree(root); // lays out the dendrogram using this root node

			// create paths from dataset
	    var link = g.selectAll(".link")
	        .data(root.descendants().slice(1))
	        .enter().append("path")
	        .attr("class", "link")
	        .attr("d", function(d) {
	            return "M" + d.y + "," + d.x +
	                "C" + (d.parent.y + 100) + "," + d.x +
	                " " + (d.parent.y + 100) + "," + d.parent.x +
	                " " + d.parent.y + "," + d.parent.x;
	        });

			// create <g> nodes from dataset
	    var node = g.selectAll(".node")
	        .data(root.descendants())
	        .enter().append("g")
	        .attr("class", function(d) {
	            return "node" + ((d.data.parent != 'blogs') ? " node--internal" : " node--leaf");
	        })
	        .attr("transform", function(d) {
	            return "translate(" + d.y + "," + d.x + ")";
	        })
					// hover event handlers to change color
					.on("mouseover",function(d){
						d3.select(this).classed("hovered", true);
					})
					.on("mouseout",function(d){
						d3.select(this).classed("hovered", false);
					})
					// click event handler to show/hide edit panel
					.on("click", function(d) {
						if(d.data.type == 'blog') {
							if($('#editShirtTitleForm').is(':visible')) {
								$('#editShirtTitleForm').hide();
							} else {
								$('#editShirtTitle').val(d.data.name);
								$('#editShirtID').val(d.data.id);
								$('#editShirtTitleForm').show();
								$('#editShirtTitle').focus();
							}
						}
					});

			// draw a circle and append to the node
	    node.append("circle")
	        .attr("r", 5);

			// draw text label and append to the node
	    node.append("text")
	        .attr("dy", 3)
	        .attr("x", function(d) {
	            return d.children ? -8 : 8;
	        })
	        .style("text-anchor", function(d) {
	            return d.children ? "end" : "start";
	        })
	        .text(function(d) {
	            return d.data.name;
	        });
	});

}

// source: http://bl.ocks.org/mbostock/4063269
function drawBubbleChart(jsonUrl) {
	$('svg').empty(); // clear any previous graphics elements

    var svg = d3.select("svg"),
        width = +svg.attr("width"),
        height = +svg.attr("height");

    var format = d3.format(",d");

    var color = d3.scaleOrdinal(d3.schemeCategory20c);

    var pack = d3.pack()
        .size([width, height])
        .padding(1.5);

    d3.json(jsonUrl, function(error, classes) {
        console.log(jsonUrl);

    //   if (error) throw error;

    //   var root = d3.hierarchy({children: classes})
    //       .sum(function(d) { return d.value; })
    //       .each(function(d) {
    //         if (id = d.data.id) {
    //           var id, i = id.lastIndexOf(".");
    //           d.id = id;
    //           d.package = id.slice(0, i);
    //           d.class = id.slice(i + 1);
    //         }
    //       });

        // var root = d3.hierarchy(classes);

        // console.log(root);

    //   var node = svg.selectAll(".node")
    //     .data(pack(root).leaves())
    //     .enter().append("g")
    //       .attr("class", "node")
    //       .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });
    //
    //   node.append("circle")
    //       .attr("id", function(d) { return d.id; })
    //       .attr("r", function(d) { return d.r; })
    //       .style("fill", function(d) { return color(d.package); });
    //
    //   node.append("clipPath")
    //       .attr("id", function(d) { return "clip-" + d.id; })
    //     .append("use")
    //       .attr("xlink:href", function(d) { return "#" + d.id; });
    //
    //   node.append("text")
    //       .attr("clip-path", function(d) { return "url(#clip-" + d.id + ")"; })
    //     .selectAll("tspan")
    //     .data(function(d) { return d.class.split(/(?=[A-Z][^A-Z])/g); })
    //     .enter().append("tspan")
    //       .attr("x", 0)
    //       .attr("y", function(d, i, nodes) { return 13 + (i - nodes.length / 2 - 0.5) * 10; })
    //       .text(function(d) { return d; });
    //
    //   node.append("title")
    //       .text(function(d) { return d.id + "\n" + format(d.name); });
    });
}
