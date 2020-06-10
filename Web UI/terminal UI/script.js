let who = 0;
// var figlet = require("figlet");
$(".term").terminal(
	{
		hello: function () {
			this.echo("Hello there!");
		},
		echo: function (message) {
			this.echo(message);
		},
		who: function () {
			who = who + 1;
			if (who === 3) {
				this.echo("Who let the dogs out?");
				who = 0;
			} else {
				this.echo("You!");
			}
		},
		bye: function () {
			this.disable();
		},
		story: function () {
			this.read("Enter story:").then(function (story) {
				this.echo(story + "\nLol!");
			});
		},
		cls: function () {
			this.clear();
		},
	},
	{}
);
