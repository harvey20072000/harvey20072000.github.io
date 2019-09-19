// init blog common settings
$(function() {

    String.prototype.format = String.prototype.f = function() {
        var s = this,
            i = arguments.length;

        while (i--) {
            s = s.replace(new RegExp('\\{' + i + '\\}', 'gm'), arguments[i]);
        }
        return s;
    };
	
    $.ajax({
        url: "resource/commons.json",
        //url: "https://harvey20072000.github.io/blog/resource/commons.json", //TODO this url is for test only
        dataType: "json",
        success: function(data) {
            setCommonProps(data);
        },
        error: function(data) {
            alert('load common properties fail, please try again later (ˊ^ˋ)');
        }
    });
	
	$(function(){
		setTimeout(function(){
			let $div = $("#skel-panels-defaultWrapper");
			$div.css("height","0%");
			$div.parent("div").next().css("height","0%");
		},100);
	});
	
});

var commonDataset = null;

function setCommonProps(data) {
    commonDataset = data;
    // set title
    $('title').text(data['title']);

    // set logo(pc)
    $('#logo').html(data['logo']['html']);
	// set logo(mobile)
	$('#titleBar span.title').html(data['logo']['html']);

    // set nav(pc)
    let $ul = $('#nav ul');
    for (var i in data['navigations']) {
        let eachNav = data['navigations'][i];
        if (eachNav['isPublic']) {
			let $li = $('<li><a href="{0}">{1}</a></li>'.format(eachNav['linkTarget'], eachNav['name']));
			if(window.location.pathname.includes(eachNav['linkTarget'])){
				$li.addClass('current_page_item');	
			}
            $li.appendTo($ul);
        }
    }
	// set nav(mobile)
	let $nav = $('<nav></nav>');
	$('#navPanel > div').append($nav);
    for (var i in data['navigations']) {
        let eachNav = data['navigations'][i];
        if (eachNav['isPublic']) {
			let $a = $('<a class="link depth-0" href="{0}" style="cursor: pointer; display: block; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-0"></span>{1}</a>'.format(eachNav['linkTarget'], eachNav['name']));
			/*
			if(window.location.pathname.includes(eachNav['linkTarget'])){
				$a.addClass('current_page_item');	
			}
			*/
            $a.appendTo($nav);
        }
    }
	

    // set footers
    let footersData = data['footers'];
    let footerIdFormat = '#footer_{0}';
    let $target = $(footerIdFormat.format('contactMe')).find('section');
    for (var i in footersData['contactMe']) {
        let eachObj = footersData['contactMe'][i];
        if (eachObj['isPublic']) {
            $('<p><a target="_blank" href="{0}" ><strong>{1}</strong></a></p>'.format(eachObj['linkTarget'], eachObj['channel'])).appendTo($target);
        }
    }
    $target = $(footerIdFormat.format('codingFriends')).find('section');
    for (var i in footersData['codingFriends']) {
        let eachObj = footersData['codingFriends'][i];
        if (eachObj['isPublic']) {
            $('<p><a target="_blank" href="{0}" ><strong>{1}</strong></a></p>'.format(eachObj['linkTarget'], eachObj['name'])).appendTo($target);
        }
    }
	
    // 預設全部隨機，footers.json有指定才固定範圍隨機
    var target_jsInteracts = null;
    if (footersData['jsInteract'].length > 0) {
        target_jsInteracts = footersData['jsInteract'];
    } else {
        target_jsInteracts = all_jsInteracts;
    }
	
	let target_jsInteract = target_jsInteracts[(Math.random() * target_jsInteracts.length) | 0];
	if(target_jsInteract.includes(".html")){
		$(footerIdFormat.format('jsInteract')).find('section').append($('<iframe class="interactZone" style="height: 300px;"></iframe>'));
		$target = $(footerIdFormat.format('jsInteract')).find('.interactZone');
		$target.prop('src',target_jsInteract);
	}else if(target_jsInteract.includes(".js")){
		$(footerIdFormat.format('jsInteract')).find('section').append($('<div class="interactZone"></div>'));
		$target = $(footerIdFormat.format('jsInteract')).find('.interactZone');
		$.getScript('js/{0}'.format(target_jsInteract), function() {
	        console.log("Script "+target_jsInteract+" loaded."); 
	    });
		/*
		$.getScript('https://harvey20072000.github.io/{0}'.format(target_jsInteract), function() { //TODO this url is for test only
	        console.log("Script "+target_jsInteract+" loaded."); 
	    });
		*/
	}else{
		$(footerIdFormat.format('jsInteract')).find('section').append($('<p>Oops, you\'ve encounter some problems, please reload or try this later.</p>'));
		return;
	}
								
}

var all_jsInteracts = ['jsInteracts/paper_scissors_stone/index.html','jsInteract_paper_scissors_stone.js'];
var articleDataset = null;

// article loader
function loadArticles(target){
	$.ajax({
        url: "resource/acticles.json",
        //url: "https://harvey20072000.github.io/blog/resource/acticles.json", //TODO this url is for test only
        dataType: "json",
        success: function(data) {
			articleDataset = data;
            doLoadArticles(target,data);
        },
        error: function(data) {
            alert('load acticles fail, please try again later (ˊ^ˋ)');
        }
    });
}

function doLoadArticles(target,data){
	let targetArticles = data[target];
	if(targetArticles == null)
		return;
		
    let $row = $('#articles .row');
	for(var i in targetArticles){
		let eachArticle = targetArticles[i];
		let articleTime = moment(eachArticle['date'], "YYYYMMDDHHmm").format('MMM DD HH:mm');
		let $div = $('<div class="2u articleColumn"><p class="date"><b>{0}</b></p><p><a class="title" target="_blank" href="{1}"><b>{2}</b></a></p></div>'.format(articleTime,eachArticle['url'],eachArticle['name']))
		$row.append($div);
	}
}

// TODO pagination & <li> inline & article content add '#' as tag for search function
