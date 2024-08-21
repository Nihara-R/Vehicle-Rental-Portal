$(window).scroll(function(){
                if($(window).scrollTop()){
                    $("nav").addClass("black");
                }
                else{
                    $("nav").removeClass("black");
                }
            });

            var modal = document.getElementById('id01');


window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

const items = document.querySelectorAll('.accordion .button7');
function toggleAccordion(){
	const itemToggle = this.getAttribute('aria-expanded');
	
	for(i=0; i< items.length;i++){
		items[i].setAttribute('aria-expanded','fales');
	}
	if(itemToggle == 'false'){
		this.setAttribute('aria-expanded','true');
	}
}
items.forEach((item)=>item.addEventListener('click',toggleAccordion));



  
