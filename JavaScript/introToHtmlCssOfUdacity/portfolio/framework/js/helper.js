var HTMLfeaturedWorkStart = '<div class="row text-center row%num%"></div>';
var HTMLcolmd6Start = '<div class="col%data% col-md-6"></div>';
var HTMLfeaturedWorkImg = '<img class="img-responsive" src="%data%" data-toggle="modal" data-target="#project%num%">';
var HTMLfeaturedWorkTitle = '<h3>%data%</h3>';
var HTMLfeaturedWorkLink = '<p><a href="%data%">Link to project</a></p>';


var HTMlmodal = '<div class="modal fade" id="project%colnum%" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">';
		 HTMlmodal   +='<div class="modal-dialog">';
		 HTMlmodal   +='<div class="modal-content">';
		 HTMlmodal   +='<div class="modal-header">';
		 HTMlmodal   +='<h4 class="modal-title" id="myModalLabel">';
		 HTMlmodal   +='%title%';
		 HTMlmodal   +='</h4>';
		 HTMlmodal   +='</div>';
		 HTMlmodal   +='<div class="modal-body">';
		 HTMlmodal   +='<img class="img-responsive" src="%imgURL%">';
		 HTMlmodal   +='%discription%';
		 HTMlmodal   +='<div class="modal-footer">';
		 HTMlmodal   +='<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>';
		 HTMlmodal   +='</div></div></div></div>';