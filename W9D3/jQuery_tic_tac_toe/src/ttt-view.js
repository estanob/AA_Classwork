class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on("click", "li", (e) => {
      const $sq = $(e.currentTarget);
      this.makeMove($sq);
    });
  }

  makeMove($square) {
    const $pos = $square.data("pos");
    const $curPlayer = this.game.currentPlayer;

    try {
      this.game.playMove($pos);
    } catch (err) {
      alert("Invalid move");
      return;
    }

    $square.addClass($curPlayer);

    if (this.game.isOver()) {
      const winner = this.game.winner();

      if (winner) {
        const h1 = $("<h1>").text(`Congratulations! Player ${winner} has won!`);
        this.$el.append(h1);
      } else {
        const h1 = $("<h1>").text("It's a draw!");
        this.$el.append(h1);
      }
    }
  }

  setupBoard() {
    const $ul = $("<ul>");

    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        let $li = $("<li>").data("pos", [i, j]);
        $ul.append($li);
      }
    }

    this.$el.append($ul);
  }
}

module.exports = View;
