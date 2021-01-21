const View = require("./ttt-view.js"); // require appropriate file
const Game = require("../../tic tac toe node solution/game.js"); // require appropriate file

$(() => {
  // Your code here
  const game = new Game();
  const gameEl = $(".ttt");
  new View(game, gameEl);
});
