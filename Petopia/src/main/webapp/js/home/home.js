$(function(){
	$('#fullpage').fullpage({
		//options here
		navigation:true,
		anchors:['section1', 'section2', 'section3', 'section4', 'section5'],
		sectionsColor:['#fff', 'rgba(255,133,0,0.8)', 'rgba(255,145,0,0.7)', '#fff', 'rgba(132,144,22,0.5)'],
		
		controlArrows: true,
		slidesNavigation: false,
		slidesNavPosition: 'bottom',
	
	});
});