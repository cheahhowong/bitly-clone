function toggleTable() {
	let x = document.getElementById("table");
	if (x.style.display === "none"){
		x.style.display = "block";
		window.location = '#table';
	} else {
		x.style.display = "none";
	}
}

$(document).ready(function(){
	$("#submitForm").submit(function(event){
		event.preventDefault();
		$form = $(event.target)
		$formSubmit = $form.find('input[type="submit"]')
		$formSubmit.val('loading')
		$.ajax({
			url: $form.attr('action'),
			method: $form.attr('method'), 
			data: $form.serialize(),
			dataType: "JSON",
			success: function(response){
				
				if(response['saved']==true){
					$formSubmit.val('Shorten')
					let x = "<tr><td><a href=\""+response.long_url+"\">"+response.long_url+"</a></td>"+"<td><a href=\""+response.short_url+"\">https://roxasbitly.herokuapp.com/"+response.short_url+"</a></td>"+"<td><a href=\""+response.count+"\">"+response.count+"</a></td></tr>"
					$('#table table').append(x)
				}
				else {
					alert("Please enter valid URL!")
					$formSubmit.val('Shorten')
				}
			},
			
		});
	});
});