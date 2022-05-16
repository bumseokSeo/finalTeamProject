$(function(){
	$('#fullpage').fullpage({
		//options here
		navigation:true,
		anchors:['section1', 'section2', 'section3', 'section4'],
		sectionsColor:['#FF6D00', '#FF8500', '#FF9100', 'rgba(132,144,22,0.5)'],
		
		controlArrows: true,
		slidesNavigation: false,
		slidesNavPosition: 'bottom',
	
	});
});