$(function() {
    /*
	$('<link>')
  .appendTo('head')
  .attr({
      type: 'text/css', 
      rel: 'stylesheet',
      href: 'css/jsInteract_paper_scissors_stone.css'
  });
	*/
    $('<link>')
        .appendTo('head')
        .attr({
            type: 'text/css',
            rel: 'stylesheet',
            href: 'https://harvey20072000.github.io/{0}'.format('jsInteract_paper_scissors_stone.css') //TODO this url is for test only
        });

    let $target = $('#footer_jsInteract .interactZone');
    $('<h1>Rock, Paper, Scissors</h1>').appendTo($target);
    $('<input placeholder="Choose rock, paper or scissors?"/>').appendTo($target);
    let $button = $('<button>Confirm</button>');
    $button.click(function() {
        let $target = $('#footer_jsInteract .interactZone');
        let userChoice = $target.find('input').val();
        if (!userChoice) {
            // User choice was undefined
            $target.find('.game').append("<p>Player 1, you cheated! Refresh this screen and fight like a man.</p>");
        } else {
            // Display user choice
            $target.find('.game').append("<p>Player 1:" + " " + userChoice + "</p>");
        }
        // Computer choice
        var computerChoice = Math.random();
        if (computerChoice < 0.34) {
            computerChoice = "rock";
        } else if (computerChoice <= 0.67) {
            computerChoice = "paper";
        } else {
            computerChoice = "scissors";
        }
        // Display computer choice
        $target.find('.game').append("<p>Computer:" + " " + computerChoice + "</p>");
        // Compare user choice vs computer choice
        var compare = function(choice1, choice2) {
            if (choice1 === choice2) {
                return "It's a tie!";
            }
            if (choice1 === "rock") {
                if (choice2 === "scissors") {
                    // rock wins
                    return "You win!";
                } else {
                    // paper wins
                    return "You lose! Try again.";
                }
            }
            if (choice1 === "paper") {
                if (choice2 === "rock") {
                    // paper wins
                    return "You win!";
                } else {
                    // scissors wins
                    return "You lose! Try again.";
                }
            }
            if (choice1 === "scissors") {
                if (choice2 === "rock") {
                    // rock wins
                    return "You lose! Try again.";
                } else {
                    // scissors wins
                    return "You win!";
                }
            }
        };
        // Run the compare function
        var results = compare(userChoice, computerChoice);
        // Display results
        $target.find('.game').append("<br><hr><br>" + results);
    });
    $button.appendTo($target);
    $('<div class="game"></div>').appendTo($target);
});
